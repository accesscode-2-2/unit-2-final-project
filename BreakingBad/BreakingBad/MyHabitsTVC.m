//
//  MyHabitsTVC.m
//  BreakingBad
//
//  Created by Zoufishan Mehdi on 10/16/15.
//  Copyright © 2015 Zoufishan Mehdi. All rights reserved.
//

#import "MyHabitsTVC.h"
#import "SharedManager.h"
#import "Habit.h"
#import "FetchWeatherData.h"
#import "EntryLogsTableViewController.h"
#import <Parse/Parse.h>

@interface MyHabitsTVC ()

@end

@implementation MyHabitsTVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"My Habits";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.habitsArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"myHabitsCell" forIndexPath:indexPath];
    Habit *habit = self.habitsArray[indexPath.row];
    cell.textLabel.text = habit.name;
    
    return cell;
}

- (IBAction)doneButtonTapped:(UIBarButtonItem *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    EntryLogsTableViewController *eltvc = (EntryLogsTableViewController *)[self.storyboard instantiateViewControllerWithIdentifier:@"entryLogsID"];
    
    eltvc.habit = self.habitsArray[indexPath.row];
    [self.navigationController pushViewController:eltvc animated:YES];
    
}



@end
