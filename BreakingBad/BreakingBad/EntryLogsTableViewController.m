//
//  EntryLogsTableViewController.m
//  BreakingBad
//
//  Created by Zoufishan Mehdi on 10/16/15.
//  Copyright © 2015 Zoufishan Mehdi. All rights reserved.
//

#import "EntryLogsTableViewController.h"
#import "Entry.h"
#import "Habit.h"
#import "MainPageVC.h"
#import "EntryLogsTableViewCell.h"
#import <AFNetworking/AFNetworking.h>

@interface EntryLogsTableViewController ()

@property (nonatomic) NSArray *data;

@end

@implementation EntryLogsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"My Entries";
    
    UINib *nib = [UINib nibWithNibName:@"EntryLogsTableViewCell" bundle:nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:@"entryLogCellID"];
    
    [self fetchWeatherData];
    
}

-(NSString *)stringFromTimeInterval:(NSTimeInterval)time{
    NSDate *date = [NSDate dateWithTimeIntervalSinceReferenceDate:time];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"EEEE"];
    NSString *dateName = [dateFormatter stringFromDate:date];
    
    return dateName;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.habit.entries.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"entryCell" forIndexPath:indexPath];
//    
//    
//    Entry *entry = self.habit.entries[indexPath.row];
//    
//    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
//    dateFormatter.dateStyle = NSDateFormatterShortStyle;
//    
//    NSString *dateString = [dateFormatter stringFromDate:entry.createdAt];
//    
//    cell.textLabel.text = dateString;
    
    
    
    EntryLogsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"entryLogCellID" forIndexPath:indexPath];
    
    NSDictionary *dict = self.data[indexPath.row];
    
    //NSTimeInterval timeInterval = [dict[@"time"] doubleValue];
    
    NSString *minTemp = [NSString stringWithFormat:@"%@",dict[@"temperatureMin"]];
    NSString *minTempShort = [NSString stringWithFormat:@"%.02f",[minTemp doubleValue]];
    
    NSString *maxTemp = [NSString stringWithFormat:@"%@",dict[@"temperatureMax"] ];
    NSString *maxTempShort = [NSString stringWithFormat:@"%.02f",[maxTemp doubleValue]];
    
    double avgTempDouble = ([minTempShort doubleValue] + [maxTempShort doubleValue])/2 ;
    
    NSString *avgTemp = [NSString stringWithFormat:@"%.01f",avgTempDouble];
    
    
    Entry *entry = self.habit.entries[indexPath.row];
    
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        dateFormatter.dateStyle = NSDateFormatterShortStyle;
    
        NSString *dateString = [dateFormatter stringFromDate:entry.createdAt];
    
    cell.weatherIconImageView.image = [UIImage imageNamed:dict[@"icon"]];
    cell.tempInfoLabel.text = avgTemp;
    cell.entryDateLabel.text = dateString;
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    MainPageVC *mainPageVC = (MainPageVC *)[self.storyboard instantiateViewControllerWithIdentifier:@"showMainPgVC"];
    
    mainPageVC.entry = self.habit.entries[indexPath.row];
    mainPageVC.readOnly = YES;
    mainPageVC.habitName = self.habit.name;
    
    [self.navigationController pushViewController:mainPageVC animated:YES];
    
    
}

-(void)fetchWeatherData{
    AFHTTPRequestOperationManager *manager = [[AFHTTPRequestOperationManager alloc] init];
    NSDictionary *latitudeLongitudeDict = [[NSUserDefaults standardUserDefaults] objectForKey:@"dict"];
    
    NSString *latitude = [latitudeLongitudeDict objectForKey:@"latitude"];
    NSString *longitude = [latitudeLongitudeDict objectForKey:@"longitude"];
    
    NSString *url;
    if(latitude && longitude && latitude.length && longitude.length)
    {
      //  url =[NSString stringWithFormat:@"https://api.forecast.io/forecast/95ac0e76481513d58b808d31fba3a227/%@,%@",latitude,longitude];
    }
    else
    {
     //   url = [NSString stringWithFormat:@"https://api.forecast.io/forecast/95ac0e76481513d58b808d31fba3a227/%@,%@",self.latitude,self.longitude];
    }
    url  = @"https://api.forecast.io/forecast/95ac0e76481513d58b808d31fba3a227/-22,47";
    [manager GET:url parameters:nil success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        
        
        NSDictionary *daily = responseObject[@"daily"];
        NSArray *data = daily[@"data"];
        self.data = data;
        [self.tableView reloadData];
    } failure:^(AFHTTPRequestOperation * _Nonnull operation, NSError * _Nonnull error) {
        NSLog(@"Error: %@", error.localizedDescription);
    }];
}

@end
