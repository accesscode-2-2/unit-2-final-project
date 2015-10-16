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
#import "QuestionDetailVC.h"
#import "SharedManager.h"
#import "CustomVCTransitionViewController.h"



@interface ViewController ()<UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate, QuestionDetailVCDelegate>
@property (weak, nonatomic) IBOutlet UIPickerView *habitsPickerView;
@property (weak, nonatomic) IBOutlet UITextField *createNewHabit;


@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *question;
@property (strong, nonatomic) IBOutletCollection(UILabel) NSArray *answer;

@property (nonatomic) NSMutableArray *habitsArray;

@property (nonatomic) BBUser *user;
@property (nonatomic) Entry *entry;
@property (nonatomic) Habit *habit;

@end

@implementation ViewController

- (IBAction)saveButtonTapped:(UIBarButtonItem *)sender {
    
    //[self.user saveInBackground];
    
    [SharedManager sharedModel].currentUser = self.user;
    
    CustomVCTransitionViewController *customVC = [self.storyboard instantiateViewControllerWithIdentifier:@"customVC"];
    
    [self presentViewController:customVC animated:YES completion:nil];
    
}


- (IBAction)questionButtonTapped:(UIButton *)sender {
    QuestionDetailVC *qvc = (QuestionDetailVC *)[self.storyboard instantiateViewControllerWithIdentifier:@"showQDetailSegue"];
    qvc.question = sender.titleLabel.text;
    qvc.delegate = self;
    qvc.tag = sender.tag;
    
    [self presentViewController:qvc animated:YES completion:nil];
}


- (IBAction)habitDoneButtonTapped:(UIButton *)sender {
    [self.habitsArray addObject:self.createNewHabit.text];
    [self.habitsPickerView reloadAllComponents];
    
    self.habit = [Habit new];
    self.habit.name = self.createNewHabit.text;
    
    if([self.user objectForKey:@"habits"]==nil)
    {
        self.user.habits = [NSMutableArray<Habit *> new];
        [self.user.habits addObject:self.habit];
    }else{
        [self.user.habits addObject:self.habit];
    }
    
}

- (void)finishedAnswering:(QuestionDetailVC *)qvc withAnswer:(NSString *)answer {
    if(![SharedManager sharedModel].answersDictionary)
    {
        [SharedManager sharedModel].answersDictionary = [NSMutableDictionary new];
    }
    for(int i=0; i < self.question.count; i++)
    {
        UIButton *currentButton = (UIButton *)self.question[i];
        if(qvc.tag == currentButton.tag)
        {
            UILabel *currentAnswerLabel = (UILabel *)self.answer[i];
            
            currentAnswerLabel.text = answer;
            
            NSString *tagString = [NSString stringWithFormat:@"%ld",(long)qvc.tag];
            
            [[SharedManager sharedModel].answersDictionary setObject:answer forKey:tagString];
            
            self.entry = [Entry new];
            self.entry.entryLog = answer;
            if([self.habit objectForKey:@"entries"] == nil)
            {
                self.habit.entries = [NSMutableArray<Entry *> new];
                [self.habit.entries addObject:self.entry];
            }
            else
            {
                [self.habit.entries addObject:self.entry];
            }
        }
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.habitsPickerView.delegate = self;
    self.habitsPickerView.dataSource = self;
    self.habitsArray = [NSMutableArray new];
    HabitList *hl = [HabitList new];
    self.habitsArray = hl.habitsList;
    
    
    self.user = (BBUser *)[PFUser object];
    
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
    
    return self.habitsArray.count;
}

- (nullable NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    
    return self.habitsArray[row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    [SharedManager sharedModel].selectedRow = row;
    
    NSString *habitString = self.habitsArray[row];
    self.habit = [Habit new];
    self.habit.name = habitString;
    
    if([self.user objectForKey:@"habits"]==nil)
    {
        self.user.habits = [NSMutableArray<Habit *> new];
        [self.user.habits addObject:self.habit];
    }else{
        [self.user.habits addObject:self.habit];
    }
    
}





@end
