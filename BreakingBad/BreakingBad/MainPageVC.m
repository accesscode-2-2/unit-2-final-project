//
//  MainPageVC.m
//  BreakingBad
//
//  Created by Zoufishan Mehdi on 10/13/15.
//  Copyright © 2015 Zoufishan Mehdi. All rights reserved.
//

#import "MainPageVC.h"
#import "SharedManager.h"
#import "YALContextMenuTableView.h"
#import "CustomContextTableViewCell.h"
#import "CheckProgressViewController.h"

@interface MainPageVC ()
<
UIPickerViewDataSource,
UIPickerViewDelegate,
UITableViewDataSource,
UITableViewDelegate
>

@property (weak, nonatomic) IBOutlet UIPickerView *habitPickerView;
@property (weak, nonatomic) IBOutlet UITextField *habitTextField;
@property (weak, nonatomic) IBOutlet UIButton *doneButton;

@property (strong, nonatomic) IBOutletCollection(UILabel) NSArray *reply;
@property (nonatomic) YALContextMenuTableView *contextMenuTableView;
@property (nonatomic) NSArray *menuTitles;
@property (nonatomic) NSArray *menuIcons;


@end



@implementation MainPageVC

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
                        @"Info"];
    
    self.menuIcons = @[[UIImage imageNamed:@"cancel"],
                       [UIImage imageNamed:@"my_habits"],
                       [UIImage imageNamed:@"check_progress"],
                       [UIImage imageNamed:@"goals"],
                       [UIImage imageNamed:@"info"]];
}

#pragma mark
#pragma Values from Singleton
- (IBAction)doneButtonTapped:(UIButton *)sender {
    
    [[SharedManager sharedModel].habitArray addObject:self.habitTextField.text];
    [self.habitPickerView reloadAllComponents];
}


-(void)answersFromPreviousScreen{
    for (int i=0; i <self.reply.count; i++)
    {
        UILabel *currentAnswerLabel = (UILabel *) [SharedManager sharedModel].answersLabel[i];
        UILabel *label = (UILabel *)self.reply[i];
        if(currentAnswerLabel.tag == label.tag)
        {
            label.text = currentAnswerLabel.text;
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
    
    [self.habitPickerView selectRow:[SharedManager sharedModel].selectedRow inComponent:0 animated:YES];
}

#pragma mark
#pragma UIPickerView DataSource Methods

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    
    return [SharedManager sharedModel].habitArray.count;
}

- (nullable NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    
    return [SharedManager sharedModel].habitArray[row];
}

@end
