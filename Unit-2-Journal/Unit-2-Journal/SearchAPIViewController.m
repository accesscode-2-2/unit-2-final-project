//
//  SearchAPIViewController.m
//  Unit-2-Journal
//
//  Created by Shena Yoshida on 10/10/15.
//  Copyright © 2015 Jamaal Sedayao. All rights reserved.
//

#import "SearchAPIViewController.h"
#import <AFNetworking/AFNetworking.h>
#import "APIManager.h"
#import "iTunesSearchResult.h"
#import "CreateJournalEntryViewController.h"
#import "SearchAPITableViewCell.h" // add custom cell
#import "TabBarViewController.h"
#import "WishListTableViewController.h"

@interface SearchAPIViewController ()
<
UITableViewDataSource,
UITableViewDelegate,
UITextFieldDelegate
>

@property (weak, nonatomic) IBOutlet UITextField *searchTextField;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIButton *musicButton;
@property (weak, nonatomic) IBOutlet UIButton *moviesButton;
@property (weak, nonatomic) IBOutlet UIButton *booksButton;
@property (strong, nonatomic) IBOutlet UIButton *podcastButton;
@property (nonatomic) NSString *media;
@property (nonatomic) NSMutableArray *searchResults;
@property (nonatomic) iTunesSearchResult *passSearchResult;

@end

@implementation SearchAPIViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.searchTextField.delegate = self;
    
    // set up custom cell .xib
    UINib *nib = [UINib nibWithNibName:@"SearchAPITableViewCell" bundle:nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:@"SearchAPITableViewCellIdentifier"];
    
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 35.0;
}

#pragma mark - setup buttons

- (IBAction)mediaButtonTypeSelected:(id)sender {
    
    if (self.musicButton.isTouchInside){
        self.media = @"music&entity=album";
    } else if (self.booksButton.isTouchInside){
        self.media = @"ebook";
    } else {
        self.media = [sender currentTitle];
    }
    
    NSLog(@"Media: %@",self.media);
}

- (IBAction)createJournalEntryButtonTapped:(id)sender {
    
}

- (IBAction)addToWishListButtonTapped:(id)sender {
    
    WishListTableViewController *viewController = [[WishListTableViewController alloc]init];
    viewController.searchResult = self.passSearchResult;

    [self.tabBarController setSelectedIndex:0];
    
    
}
- (void) makeNewiTunesAPIRequestWithSearchTerm:(NSString *)term
                                       inMedia:(NSString *)media
                                 callbackBlock:(void(^)())block{
    
    NSString *urlString = [NSString stringWithFormat:
                           @"https://itunes.apple.com/search?media=%@&term=%@",media,term];
    
    NSString *encodedString = [urlString stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    
    NSLog(@"%@", encodedString);
    
    NSURL *url = [NSURL URLWithString:encodedString];
    
    [APIManager GETRequestWithURL:url
                completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                    
                    if (data != nil){
                        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
                        
                        //NSLog(@"%@",json);
                        
                        NSArray *results = [json objectForKey:@"results"];
                        
                        NSLog(@"Results: %@",results);
                        
                        self.searchResults = [[NSMutableArray alloc]init];
                        
                        
                        for (NSDictionary *result in results){
                            
                            NSString *artistName = [result objectForKey:@"artistName"];
                            NSString *albumName = [result objectForKey:@"collectionName"];
                            NSString *movieName = [result objectForKey:@"trackName"];
                            NSString *artworkURL =  [result objectForKey:@"artworkUrl100"];
                            
                            iTunesSearchResult *resultsObject = [[iTunesSearchResult alloc]init];
                            
                            if ([self.media isEqualToString:@"movie"] || [self.media isEqualToString:@"podcast"] ){
                                resultsObject.artistName = artistName;
                                resultsObject.albumOrMovieName = movieName;
                                resultsObject.artworkURL = artworkURL;
                            } else if ([self.media isEqualToString:@"music&entity=album"]){
                                resultsObject.artistName = artistName;
                                resultsObject.albumOrMovieName = albumName;
                                resultsObject.artworkURL = artworkURL;
                            } else if ([self.media isEqualToString:@"ebook"]){
                                resultsObject.artistName = artistName;
                                resultsObject.albumOrMovieName = movieName;
                                resultsObject.artworkURL = artworkURL;
                            }
                            
                            [self.searchResults addObject:resultsObject];
                        }
                        
                        block();
                    }
                }];
    
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    [self.view endEditing:YES];
    
    //make an API request
    [self makeNewiTunesAPIRequestWithSearchTerm:textField.text
                                        inMedia:self.media
                                  callbackBlock:^{
                                      [self.tableView reloadData];
                                  }];
    return YES;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.searchResults.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SearchAPITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SearchAPITableViewCellIdentifier" forIndexPath:indexPath];
   
    iTunesSearchResult *searchResult = self.searchResults[indexPath.row];
    
    cell.titleLabel.text = searchResult.albumOrMovieName;
    cell.authorArtistDirectorLabel.text = searchResult.artistName;
    
    NSString *artworkString = searchResult.artworkURL;
    NSURL *artworkURL = [NSURL URLWithString:artworkString];
    NSData *artworkData = [NSData dataWithContentsOfURL:artworkURL];
    UIImage *artworkImage = [UIImage imageWithData:artworkData];
    
//    NSLog(@"Image String: %@", searchResult.artworkURL);
//    NSLog(@"Image URL: %@", artworkURL);
//    NSLog(@"Image Data: %@", artworkData);
//    NSLog(@"Image: %@", artworkImage);
    
    cell.artworkImage.image = artworkImage;
    
    cell.imageView.layer.borderWidth = 2.0;
    cell.imageView.layer.borderColor = [UIColor blackColor].CGColor;
    cell.imageView.layer.cornerRadius = 3.0;

    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
   
    iTunesSearchResult *searchResult = self.searchResults[indexPath.row];
    
    self.passSearchResult = searchResult;

    NSLog(@"%@", self.passSearchResult);
    
    // push view controller
    
}



 #pragma mark - Navigation

 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
     if ([[segue identifier]isEqualToString:@"pushToCreateJournalEntry"]) {
     
         NSLog(@"segue");

     CreateJournalEntryViewController *viewController = segue.destinationViewController;
     viewController.postSearchResult = self.passSearchResult;
     }
     
 }

@end
