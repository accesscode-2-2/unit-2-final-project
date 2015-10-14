//
//  MainPageVC.m
//  BreakingBad
//
//  Created by Zoufishan Mehdi on 10/13/15.
//  Copyright © 2015 Zoufishan Mehdi. All rights reserved.
//

#import "MainPageVC.h"
#import "SharedManager.h"

@interface MainPageVC ()<UIPickerViewDataSource,UIPickerViewDelegate>
@property (weak, nonatomic) IBOutlet UIPickerView *habitPickerView;
@property (weak, nonatomic) IBOutlet UITextField *habitTextField;
@property (weak, nonatomic) IBOutlet UIButton *doneButton;

@property (strong, nonatomic) IBOutletCollection(UILabel) NSArray *reply;


@end



@implementation MainPageVC

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

- (void)viewDidLoad{
    [super viewDidLoad];
    self.habitPickerView.delegate = self;
    [self answersFromPreviousScreen];
    
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
