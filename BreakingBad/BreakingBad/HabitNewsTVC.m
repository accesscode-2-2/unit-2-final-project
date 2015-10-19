//
//  HabitNewsTVC.m
//  BreakingBad
//
//  Created by Zoufishan Mehdi on 10/19/15.
//  Copyright © 2015 Zoufishan Mehdi. All rights reserved.
//

#import "HabitNewsTVC.h"
#import <AFNetworking/AFNetworking.h>
#import "HabitInfoTVC.h"
#import <Parse/Parse.h>
#import "HabitInfoData.h"
#import "HabitsNewsTableViewCell.h"
#import "Habit.h"

@interface HabitNewsTVC () <UITableViewDataSource,
UITableViewDelegate>


@end

@implementation HabitNewsTVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
   self.navigationItem.title = @"Habit News";
    
    UINib *nib = [UINib nibWithNibName:@"HabitsNewsTableViewCell" bundle:nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:@"HabitsNewsCellID"];
    
       [self fetchHabitInfo];
}


#pragma mark- NYTimes API Request
//- (void)fetchHabitInfoData:(NSString *)searchTerm
//             callbackBlock:(void(^)())block {
- (void)fetchHabitInfo{
    
    //  NSString *urlString = [NSString stringWithFormat:@"https://api.nytimes.com/svc/search/v2/articlesearch.json?fq=smoking&api-key=4aaf719230b21874acd05c657c680643:18:73243649", searchTerm];
    
    
    NSString *url = @"http://api.nytimes.com/svc/search/v2/articlesearch.json?fq=drinking&api-key=4aaf719230b21874acd05c657c680643:18:73243649" ;
    
    //    NSString *encodedString = [urlString stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    //
    //    NSURL *forecastURL = [NSURL URLWithString:encodedString];
    //    NSString *myString = [forecastURL absoluteString];
    
    
    AFHTTPRequestOperationManager *manager = [[AFHTTPRequestOperationManager alloc] init];
    
    [manager GET:url parameters:nil success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        
        
        NSDictionary *results = responseObject[@"response"];
        NSArray *docs = results[@"docs"];
        
     
        
        // reset my array
        self.searchResults = [[NSMutableArray alloc] init];
        
        // loop through all json posts
        for (NSDictionary *result in docs) {
            // create new post from json
            HabitInfoData *data = [[HabitInfoData alloc] initWithJSON:result];
            // add post to array
            [self.searchResults addObject:data];
            NSLog(@"This is the habit info data: %@",data);
        }
        
        
        [self.tableView reloadData];
         NSLog(@"%@", results);
        
    } failure:^(AFHTTPRequestOperation * _Nonnull operation, NSError * _Nonnull error) {
        NSLog(@"Error: %@", error.localizedDescription);
        // block();
    }];
}



#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.searchResults.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    HabitsNewsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HabitsNewsCellID" forIndexPath:indexPath];
    
    
    HabitInfoData *data = self.searchResults[indexPath.row];
    
    cell.newsHeadlineLabel.text = data.nyHeadline;
    cell.newsSnippetTextView.text = data.nySnippet;
    
    
    return cell;
}



- (IBAction)doneButtonTapped:(UIBarButtonItem *)sender {
    
      [self dismissViewControllerAnimated:YES completion:nil];
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    HabitInfoData *article = self.searchResults[indexPath.row];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:article.nyUrl]];
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 140;
}



@end
