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
    self.answerTextView.backgroundColor = [SharedManager sharedModel].brickRed;
    
}



-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    [self.answerTextView resignFirstResponder];
}


- (IBAction)doneButtonTapped:(UIButton *)sender {
    [self.delegate finishedAnswering:self withAnswer:self.answerTextView.text];
    [self dismissViewControllerAnimated:YES completion:nil];
}




@end
