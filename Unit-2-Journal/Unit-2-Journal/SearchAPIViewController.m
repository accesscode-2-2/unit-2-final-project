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

@end

@implementation SearchAPIViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.searchTextField.delegate = self;
 
    
}


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
                        
                        //self.searchResults = [[NSMutableArray alloc]init];
                        
                        
//                        for (NSDictionary *result in results){
//                            
//                            NSString *artistName = [result objectForKey:@"artistName"];
//                            NSString *albumName = [result objectForKey:@"collectionName"];
//                            NSString *songName = [result objectForKey:@"trackName"];
//                            NSURL *songPreview = [NSURL URLWithString:[result objectForKey:@"previewUrl"]];
//                            
//                            iTunesMusicResults *musicObject = [[iTunesMusicResults alloc]init];
//                            musicObject.artist = artistName;
//                            musicObject.album = albumName;
//                            musicObject.song = songName;
//                            musicObject.songURL = songPreview;
//                            
//                            //                            self.audioPlayer = musicObject.songPlayer;
//                            
//                            [self.searchResults addObject:musicObject];
//                        }
                        
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
    return 1;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"APIResultsIdentifier" forIndexPath:indexPath];
    
    
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
