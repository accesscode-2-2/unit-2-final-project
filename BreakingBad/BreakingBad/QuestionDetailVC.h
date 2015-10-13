//
//  questionDetailVC.h
//  BreakingBad
//
//  Created by Zoufishan Mehdi on 10/12/15.
//  Copyright © 2015 Zoufishan Mehdi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"

@class QuestionDetailVC;

@protocol QuestionDetailVCDelegate <NSObject>
- (void)finishedAnswering:(QuestionDetailVC *)qvc withAnswer:(NSString *)answer;
@end

@interface QuestionDetailVC : UIViewController

@property (nonatomic) IBOutlet UILabel *questionLabel;
@property (weak, nonatomic) IBOutlet UITextView *answerTextView;

@property (nonatomic) NSString *question;

@property (nonatomic, retain) NSString *data;
@property (nonatomic, weak) id<QuestionDetailVCDelegate> delegate;
@property (nonatomic) NSInteger tag;

@end
