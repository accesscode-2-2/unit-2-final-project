//
//  MyHabitsTVC.m
//  BreakingBad
//
//  Created by Zoufishan Mehdi on 10/16/15.
//  Copyright © 2015 Zoufishan Mehdi. All rights reserved.
//

#import "MyHabitsTVC.h"
#import "Habit.h"
#import "FetchWeatherData.h"
#import "EntryLogsTableViewController.h"
#import <Parse/Parse.h>
#import <AFNetworking/AFNetworking.h>
#import "SharedManager.h"

@interface MyHabitsTVC ()

////properties to add color to
@property (strong, nonatomic) IBOutlet UITableView *myHabitsTableView;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *doneButton;


@end

@implementation MyHabitsTVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"My Habits";
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
    cell.backgroundColor = [SharedManager sharedModel].icyNight;
    
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
