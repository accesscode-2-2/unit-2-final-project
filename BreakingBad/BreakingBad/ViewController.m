//
//  ViewController.m
//  BreakingBad
//
//  Created by Zoufishan Mehdi on 10/10/15.
//  Copyright © 2015 Zoufishan Mehdi. All rights reserved.
//

#import "ViewController.h"
#import <Parse/Parse.h>
#import "BBUser.h"
#import "Habit.h"
#import "Goal.h"
#import "Entry.h"
#import "Step.h"
#import "HabitList.h"


@interface ViewController ()<UIPickerViewDelegate, UIPickerViewDataSource>
@property (weak, nonatomic) IBOutlet UIPickerView *habitsPickerView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.habitsPickerView.delegate = self;
    self.habitsPickerView.dataSource = self;
//    BBUser *user = (BBUser *)[PFUser object];
//    
//    user.email  = @"ab1c@gmail.com";
//    user.password = @"mesfinnotcool";
//    user.username = @"nc3j";
//    
//    
//    Habit *habit = [Habit new];
//    habit.name = @"Smoking";
//    
//    Entry *entry = [Entry new];
//    entry.entryLog = @"Bitting nails";
//    
//    
//    Step *step1 = [Step new];
//    step1.stepDescription = @"1. No pack for a whole day";
//    step1.completed = 1;
//    
//    Step *step2 = [Step new];
//    step2.stepDescription = @"1. No pack for a whole week";
//    step2.completed = 0;
//    
//    Goal *goal = [Goal new];
//    goal.name = @"Quit Smoking";
//    goal.steps = [NSMutableArray new];
//    
//    [goal.steps addObject:step1];
//    [goal.steps addObject:step2];
//    
//    
//    habit.entries = [NSMutableArray new];
//    habit.goals = [NSMutableArray new];
//    habit.name = @"Zouf says we need to talk, ...whatever";
//    
//    [habit.entries addObject:entry];
//    [habit.goals addObject:goal];
//    
//    
//    if([user objectForKey:@"habits"]==nil){
//        user.habits = [NSMutableArray new];
//        [user.habits addObject:habit];
//    }
//    
//    [user signUpInBackground];
//    [user saveInBackground];
//    
//    
//    PFQuery *query = [PFQuery queryWithClassName:@"_User"];
//    [query findObjectsInBackgroundWithBlock:^(NSArray * _Nullable objects, NSError * _Nullable error) {
//        ;
//        NSLog(@"%@",objects);
//    }];
//    
//    BBUser *currentUser = (BBUser *)[PFUser currentUser];
//    [currentUser objectForKey:@"habits"];
//    [currentUser fetchIfNeeded];
//    NSLog(@"%@",currentUser.habits);
    
}



#pragma mark
#pragma UIPickerView DataSource Methods

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return [HabitList listOfHabits].count;
}

- (nullable NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    return [HabitList listOfHabits][row];
}






@end
