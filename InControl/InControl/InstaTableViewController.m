//
//  InstaTableViewController.m
//  InControl
//
//  Created by Diana Elezaj on 10/21/15.
//  Copyright © 2015 Diana Elezaj. All rights reserved.
//

#import "InstaTableViewController.h"
#import <AFNetworking/AFNetworking.h>
#import <SDWebImage/UIImageView+WebCache.h>
#import "APIManager.h"
#import "InstagramPost.h"
#import "InstagramPostTableViewCell.h"



@interface InstaTableViewController ()
@property (nonatomic) NSMutableArray *detailsResults;

@end

@implementation InstaTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"Insta";

    [[self navigationController] setNavigationBarHidden:NO animated:YES];

   
    
    
    [self fetchInstagramData];
    NSLog(@"detailsss");
    
    // set up pull to refresh
    self.refreshControl = [[UIRefreshControl alloc] init];
    [self.refreshControl addTarget:self action:@selector(pulledToRefresh:) forControlEvents:UIControlEventValueChanged];
    
    // tell the table view to auto adjust the height of each cell
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 12.0;
    
    // grab the nib from the main bundle
    UINib *nib = [UINib nibWithNibName:@"InstagramPostTableViewCell" bundle:nil];
    
    // register the nib for the cell identifer
    [self.tableView registerNib:nib forCellReuseIdentifier:@"InstagramCellIdentifier"];
    
   
    
    
}

-(void) viewWillAppear:(BOOL)animated {
    [[self navigationController] setNavigationBarHidden:NO animated:YES];
}


- (IBAction)refreshTapped:(id)sender {
    [self fetchInstagramData];
}


- (void)fetchInstagramData {
    
    NSString *cityName_City = [NSString stringWithFormat:@"%@city",self.city];
    NSLog(@"cityName_City %@", cityName_City);
    
          // create an instagram url
        NSString *urlString = [NSString stringWithFormat:@"https://api.instagram.com/v1/tags/%@/media/recent?client_id=a2c55d5958864f32a2b1af4f8b01c8db", cityName_City];
   
    
    
    
    
    
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    [manager GET:urlString
      parameters:nil
         success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
             NSArray *results = responseObject[@"data"];
             
             // reset my array
             self.detailsResults = [[NSMutableArray alloc] init];
             
             // loop through all json posts
             for (NSDictionary *result in results) {
                 
                 // create new post from json
                 InstagramPost *post = [[InstagramPost alloc] initWithJSON:result];
                 
                 // add post to array
                 [self.detailsResults addObject:post];
             }
             
             [self.tableView reloadData];
             
         } failure:^(AFHTTPRequestOperation * _Nonnull operation, NSError * _Nonnull error) {
             NSLog(@"%@", error);
             
         }];
    
}


- (void)pulledToRefresh:(UIRefreshControl *)sender {
    [self fetchInstagramData];
    [sender endRefreshing];
    
    // sender == self.refreshControl
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

 - (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.detailsResults.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    InstagramPostTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"InstagramCellIdentifier" forIndexPath:indexPath];
    
    InstagramPost *post = self.detailsResults[indexPath.section];
    
    cell.likeCountLabel.text = [NSString stringWithFormat:@"%ld likes", post.likeCount];
    
//    cell.tagCountLabel.text = [NSString stringWithFormat:@"Tags: %ld", post.tags.count];
    
    cell.captionLabel.text = post.caption[@"text"];
    
    //    NSData *data = [NSData dataWithContentsOfURL:url];
    //    UIImage *image = [UIImage imageWithData:data];
    //
    //    cell.userMediaImageView.image = image;
    
    NSURL *url = [NSURL URLWithString:post.imageURL];
    
    [cell.userMediaImageView sd_setImageWithURL:url completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        cell.userMediaImageView.image = image;
    }];
    
    return cell;
}






@end

