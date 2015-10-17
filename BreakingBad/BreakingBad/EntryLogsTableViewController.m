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

@interface EntryLogsTableViewController ()

@end

@implementation EntryLogsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}



#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.habit.entries.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"entryCell" forIndexPath:indexPath];
    
    
    Entry *entry = self.habit.entries[indexPath.row];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateStyle = NSDateFormatterShortStyle;
    
    NSString *dateString = [dateFormatter stringFromDate:entry.createdAt];
    
    cell.textLabel.text = dateString;
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    MainPageVC *mainPageVC = (MainPageVC *)[self.storyboard instantiateViewControllerWithIdentifier:@"showMainPgVC"];
    
    mainPageVC.entry = self.habit.entries[indexPath.row];
    mainPageVC.readOnly = YES;
    mainPageVC.habitName = self.habit.name;
    
    [self.navigationController pushViewController:mainPageVC animated:YES];
    
    
}

@end
