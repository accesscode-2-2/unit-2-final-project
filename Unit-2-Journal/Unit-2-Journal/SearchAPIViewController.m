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
@property (weak, nonatomic) IBOutlet UIButton *otherButton;
@property (nonatomic) NSString *media;
@property (nonatomic) NSMutableArray *searchResults;

@end

@implementation SearchAPIViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setUpSwipeGestures];

    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.searchTextField.delegate = self;
    
//    iTunesSearchResult *searchResults = [[iTunesSearchResult alloc]init];
    
    
}

#pragma mark - setup swipe gestures

- (void)setUpSwipeGestures
{
    UISwipeGestureRecognizer *swipeRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(userSwipedRight:)];
    swipeRight.direction = UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:swipeRight];
}

- (void)userSwipedRight:(UISwipeGestureRecognizer*)swipe
{
    if (swipe.direction == UISwipeGestureRecognizerDirectionRight) {
        [self performSegueWithIdentifier:@"pushToJournalFromSearch" sender:self];
    }
}

#pragma mark - setup buttons

- (IBAction)mediaButtonTypeSelected:(id)sender {
    self.media = [sender currentTitle];
     NSLog(@"Media: %@",self.media);
}

- (IBAction)mediaButtonOther:(id)sender {
}

- (IBAction)createJournalEntryButtonTapped:(id)sender {
    
}

- (IBAction)addToWishListButtonTapped:(id)sender {
    
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
                            
                            if ([self.media isEqualToString:@"movie"]){
                                resultsObject.artistName = artistName;
                                resultsObject.albumOrMovieName = movieName;
                                resultsObject.artworkURL = artworkURL;
                            } else if ([self.media isEqualToString:@"music"]){
                                resultsObject.artistName = artistName;
                                resultsObject.albumOrMovieName = albumName;
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

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.searchResults.count;

}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"APIResultsIdentifier" forIndexPath:indexPath];
   
    iTunesSearchResult *searchResult = self.searchResults[indexPath.row];
    
    cell.textLabel.text = searchResult.albumOrMovieName;
    cell.detailTextLabel.text = searchResult.artistName;
    
    NSString *artworkString = searchResult.artworkURL;
    NSURL *artworkURL = [NSURL URLWithString:artworkString];
    NSData *artworkData = [NSData dataWithContentsOfURL:artworkURL];
    UIImage *artworkImage = [UIImage imageWithData:artworkData];
    
//    NSLog(@"Image String: %@", searchResult.artworkURL);
//    NSLog(@"Image URL: %@", artworkURL);
//    NSLog(@"Image Data: %@", artworkData);
//    NSLog(@"Image: %@", artworkImage);
    
    cell.imageView.image = artworkImage;
    
    return cell;
}


/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
