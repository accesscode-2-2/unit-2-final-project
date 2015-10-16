//
//  MainPageVC.m
//  BreakingBad
//
//  Created by Zoufishan Mehdi on 10/13/15.
//  Copyright © 2015 Zoufishan Mehdi. All rights reserved.
//

#import "MainPageVC.h"
#import "BBUser.h"
#import "Habit.h"
#import "Entry.h"
#import "SharedManager.h"
#import "YALContextMenuTableView.h"
#import "CustomContextTableViewCell.h"
#import "CheckProgressViewController.h"
#import "QuestionDetailVC.h"

@interface MainPageVC ()
<
UIPickerViewDataSource,
UIPickerViewDelegate,
UITableViewDataSource,
UITableViewDelegate,
QuestionDetailVCDelegate
>

@property (weak, nonatomic) IBOutlet UIPickerView *habitPickerView;
@property (weak, nonatomic) IBOutlet UITextField *habitTextField;
@property (weak, nonatomic) IBOutlet UIButton *doneButton;

@property (strong, nonatomic) IBOutletCollection(UILabel) NSArray *reply;
@property (nonatomic) YALContextMenuTableView *contextMenuTableView;
@property (nonatomic) NSArray *menuTitles;
@property (nonatomic) NSArray *menuIcons;

@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *questionsArray;
@property (nonatomic) NSArray *habitsArray;

@property (nonatomic) BBUser *user;
@property (nonatomic) Entry *entry;
@property (nonatomic) Habit *habit;

@end



@implementation MainPageVC

#pragma mark
#pragma Question Buttons Method

- (IBAction)questionButtonTapped:(UIButton *)sender {
    QuestionDetailVC *qvc = (QuestionDetailVC *)[self.storyboard instantiateViewControllerWithIdentifier:@"showQDetailSegue"];
    qvc.question = sender.titleLabel.text;
    qvc.delegate = self;
    qvc.tag = sender.tag;
    
    [self presentViewController:qvc animated:YES completion:nil];
}

- (void)finishedAnswering:(QuestionDetailVC *)qvc withAnswer:(NSString *)answer {
    for(int i=0; i < self.questionsArray.count; i++)
    {
        UIButton *currentButton = (UIButton *)self.questionsArray[i];
        if(qvc.tag == currentButton.tag)
        {
            UILabel *currentAnswerLabel = (UILabel *)self.reply[i];
            
            currentAnswerLabel.text = answer;
            
            NSString *tagString = [NSString stringWithFormat:@"%ld",(long)qvc.tag];
            
            [[SharedManager sharedModel].answersDictionary setObject:answer forKey:tagString];
            
            self.entry = [Entry new];
            self.entry.entryLog = answer;
            [self.habit.entries addObject:self.entry];
        }
    }
}

#pragma mark
#pragma Context Menu methods
- (IBAction)menuButtonTapped:(UIButton *)sender {
    if(!self.contextMenuTableView){
        self.contextMenuTableView = [[YALContextMenuTableView alloc] initWithTableViewDelegateDataSource:self];
        self.contextMenuTableView.animationDuration = 0.15;
        self.contextMenuTableView.delegate = self;
        
        //register nib
        
        UINib *cellNib = [UINib nibWithNibName:@"CustomContextTableViewCell" bundle:nil];
        [self.contextMenuTableView registerNib:cellNib forCellReuseIdentifier:@"contextMenuCellReuseId"];
    }
    // it is better to use this method only for proper animation
    [self.contextMenuTableView showInView:self.view withEdgeInsets:UIEdgeInsetsZero animated:YES];
    
}

- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation{
    //should be called after rotation animation completed
    [self.contextMenuTableView reloadData];
}

- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration {
    [super willRotateToInterfaceOrientation:toInterfaceOrientation duration:duration];
    
    [self.contextMenuTableView updateAlongsideRotation];
}

- (void)viewWillTransitionToSize:(CGSize)size
       withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator {
    
    [super viewWillTransitionToSize:size withTransitionCoordinator:coordinator];
    
    
    [coordinator animateAlongsideTransition:nil completion:^(id<UIViewControllerTransitionCoordinatorContext> context) {
        //should be called after rotation animation completed
        [self.contextMenuTableView reloadData];
    }];
    [self.contextMenuTableView updateAlongsideRotation];
}

- (void)initiateMenuOptions {
    self.menuTitles = @[@"",
                        @"My Habits",
                        @"Check Progress",
                        @"Set Goals",
                        @"Info",
                        @"Save"];
    
    self.menuIcons = @[[UIImage imageNamed:@"cancel"],
                       [UIImage imageNamed:@"my_habits"],
                       [UIImage imageNamed:@"check_progress"],
                       [UIImage imageNamed:@"goals"],
                       [UIImage imageNamed:@"info"],
                       [UIImage imageNamed:@"save"]];
}

#pragma mark
#pragma Values from Singleton
- (IBAction)doneButtonTapped:(UIButton *)sender {
    
    NSInteger selectedIdx = [self.habitPickerView selectedRowInComponent:0];
    Habit *selectedHabit = self.habitsArray[selectedIdx];
    
    Entry *newEntry = [Entry new];
    
    NSMutableDictionary *entryDictionary = [[NSMutableDictionary alloc] init];
    for(int i=0; i < self.questionsArray.count; i++)
    {
        UIButton *currentButton = (UIButton *)self.questionsArray[i];
        UILabel *label = (UILabel *)self.reply[i];
        
        NSString *key = [NSString stringWithFormat:@"%d", i];
        NSString *value = label.text;
        
        entryDictionary[key] = value;
    }
    
    newEntry.logs = entryDictionary;
    [selectedHabit.entries addObject:newEntry];
    [selectedHabit saveInBackground];
    
    
    
//    [self.habitsArray addObject:self.habitTextField.text];
    //[[SharedManager sharedModel].habitArray addObject:self.habitTextField.text];
//    [self.habitPickerView reloadAllComponents];
//    
//    self.habit = [Habit new];
//    self.habit.name = self.habitTextField.text;
//    
//    if([self.user objectForKey:@"habits"]==nil)
//    {
//        self.user.habits = [NSMutableArray<Habit *> new];
//        [self.user.habits addObject:self.habit];
//    }else{
//        [self.user.habits addObject:self.habit];
//    }
}


-(void)answersFromPreviousScreen{
    NSArray *allkeys = [[[SharedManager sharedModel] answersDictionary] allKeys];
    for(NSString *key in allkeys)
    {
        NSInteger tag = [key integerValue];
        for(int i=0; i < self.questionsArray.count; i++)
        {
            UIButton *currentQuestionButton = (UIButton *)self.questionsArray[i];
            if(tag == currentQuestionButton.tag)
            {
                UILabel *answerLabel = self.reply[i];
                answerLabel.text = [[SharedManager sharedModel].answersDictionary objectForKey:key];
                break;
            }
        }
    }
}

#pragma mark - YALContextMenuTableViewDelegate

- (void)contextMenuTableView:(YALContextMenuTableView *)contextMenuTableView didDismissWithIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"Menu dismissed with indexpath = %@", indexPath);
}

#pragma mark - UITableViewDataSource, UITableViewDelegate

- (void)tableView:(YALContextMenuTableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if(indexPath.row == 2){
        CheckProgressViewController *cp = (CheckProgressViewController *)[self.storyboard instantiateViewControllerWithIdentifier:@"checkProgressID"];
        [self presentViewController:cp animated:YES completion:nil];
    }
    else if (indexPath.row ==  5){
        [self.user saveInBackground];
    }
    
    [tableView dismisWithIndexPath:indexPath];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 65;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.menuTitles.count;
}

- (UITableViewCell *)tableView:(YALContextMenuTableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    CustomContextTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"contextMenuCellReuseId" forIndexPath:indexPath];
    
    if (cell) {
        cell.backgroundColor = [UIColor orangeColor];
        cell.menuTitleLabel.text = [self.menuTitles objectAtIndex:indexPath.row];
        cell.menuTitleImage.image = [self.menuIcons objectAtIndex:indexPath.row];
    }
    
    return cell;
}




#pragma mark
#pragma Life Cycle Methods

- (void)viewDidLoad{
    [super viewDidLoad];
    self.habitPickerView.delegate = self;
    [self answersFromPreviousScreen];
    [self initiateMenuOptions];
    
    
//    self.habitsArray = [NSMutableArray new];
//    HabitList *hl = [HabitList new];
//    self.habitsArray = hl.habitsList;
    
    //[self.habitPickerView selectRow:[SharedManager sharedModel].selectedRow inComponent:0 animated:YES];
    
//    BBUser *currentUser = (BBUser *)[PFUser currentUser];
//        [currentUser objectForKey:@"habits"];
//        [currentUser fetchIfNeededInBackgroundWithBlock:^(PFObject * _Nullable object, NSError * _Nullable error) {
//          NSLog(@"%@",object);
//        }];
//    PFQuery *query = [PFUser query];
//    
//    [query whereKey:@"username" equalTo:[currentUser username]];
//    
//    [query getFirstObjectInBackgroundWithBlock:^(PFObject * _Nullable object, NSError * _Nullable error) {
//        NSLog(@"Object: %@", object);
//        NSLog(@"Habits: %@", [object objectForKey:@"habtis"]);
//    }];
    
    
    __weak typeof(self) weakSelf = self;
    PFQuery *query = [PFQuery queryWithClassName:@"Habit"];
    [query findObjectsInBackgroundWithBlock:^(NSArray * _Nullable objects, NSError * _Nullable error) {
        weakSelf.habitsArray = objects;
        [weakSelf.habitPickerView reloadAllComponents];
    }];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self.habitTextField resignFirstResponder];
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
    return ((Habit *)self.habitsArray[row]).name;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
//    [SharedManager sharedModel].selectedRow = row;
//    
//    NSString *habitString = self.habitsArray[row];
//    self.habit = [Habit new];
//    self.habit.name = habitString;
//    
//    if([self.user objectForKey:@"habits"]==nil)
//    {
//        self.user.habits = [NSMutableArray<Habit *> new];
//        [self.user.habits addObject:self.habit];
//    }else{
//        [self.user.habits addObject:self.habit];
//    }
    
}

@end
