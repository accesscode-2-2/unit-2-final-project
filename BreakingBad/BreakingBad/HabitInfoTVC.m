//
//  HabitInfoTVC.m
//  BreakingBad
//
//  Created by Zoufishan Mehdi on 10/18/15.
//  Copyright © 2015 Zoufishan Mehdi. All rights reserved.
//

#import "HabitInfoTVC.h"
#import <AFNetworking/AFNetworking.h>
#import "HabitInfoData.h"
#import "Habit.h"

#import "MyHabitsTVC.h"
#import "EntryLogsTableViewController.h"
#import <Parse/Parse.h>
#import "HabitNewsTVC.h"
#import "SharedManager.h"


@interface HabitInfoTVC ()
@property (strong, nonatomic) IBOutlet UITableView *habitInfoTableView;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *doneButton;

@end

@implementation HabitInfoTVC

- (void)viewDidLoad {
    [super viewDidLoad];
 
    [self addColorHabitInfo];
}


-(void)addColorHabitInfo {
    self.habitInfoTableView.backgroundColor = [SharedManager sharedModel].icyNight;
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.habitsArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"habitInfoCell" forIndexPath:indexPath];
    
    Habit *habit = self.habitsArray[indexPath.row];
    cell.textLabel.text = habit.name;
    cell.backgroundColor = [SharedManager sharedModel].icyNight; 
    
    return cell;
    
    }

#pragma mark - Navigation

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    HabitNewsTVC *habNewsTVC = (HabitNewsTVC *)[self.storyboard instantiateViewControllerWithIdentifier:@"habitsNewsTVC"];
    
    habNewsTVC.data = self.habitsArray[indexPath.row];
    
    [self.navigationController pushViewController:habNewsTVC animated:YES];
    
}


- (IBAction)doneButtonTapped:(UIBarButtonItem *)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
