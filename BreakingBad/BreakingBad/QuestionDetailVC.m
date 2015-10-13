//
//  questionDetailVC.m
//  BreakingBad
//
//  Created by Zoufishan Mehdi on 10/12/15.
//  Copyright © 2015 Zoufishan Mehdi. All rights reserved.
//

#import "QuestionDetailVC.h"
#import "ViewController.h"

@interface QuestionDetailVC ()


@end


@implementation QuestionDetailVC


- (void)viewDidLoad{
    [super viewDidLoad];
    
    self.questionLabel.text = self.question;

}

- (IBAction)doneButtonTapped:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
