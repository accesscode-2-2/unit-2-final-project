//
//  questionDetailVC.m
//  BreakingBad
//
//  Created by Zoufishan Mehdi on 10/12/15.
//  Copyright © 2015 Zoufishan Mehdi. All rights reserved.
//

#import "QuestionDetailVC.h"
#import "ViewController.h"
#import "SharedManager.h"

@interface QuestionDetailVC ()


@end


@implementation QuestionDetailVC


- (void)viewDidLoad{
    [super viewDidLoad];
    
    self.questionLabel.text = self.question;
    if (self.answer) {
        self.answerTextView.text = self.answer;
    }
    
    [self addColorQuestionDetail];

}


-(void)addColorQuestionDetail {
    
    self.questionDetailView.backgroundColor = [SharedManager sharedModel].colesiumGrey;
    self.questionLabel.textColor = [SharedManager sharedModel].brickRed;

    self.answerTextView.backgroundColor = [SharedManager sharedModel].blueSky;
    
    self.doneButton.layer.borderWidth = 3.5;
    self.doneButton.layer.borderColor = [SharedManager sharedModel].tropicalDream.CGColor;
    self.doneButton.backgroundColor = [SharedManager sharedModel].brickRed;
    self.doneButton.layer.cornerRadius = 22;
    self.doneButton.tintColor = [SharedManager sharedModel].brownForest;
    
}



-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    [self.answerTextView resignFirstResponder];
}


- (IBAction)doneButtonTapped:(UIButton *)sender {
    [self.delegate finishedAnswering:self withAnswer:self.answerTextView.text];
    [self dismissViewControllerAnimated:YES completion:nil];
}




@end
