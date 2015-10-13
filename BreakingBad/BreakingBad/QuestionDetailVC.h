//
//  questionDetailVC.h
//  BreakingBad
//
//  Created by Zoufishan Mehdi on 10/12/15.
//  Copyright © 2015 Zoufishan Mehdi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"


@protocol SecondViewControllerDelegate <NSObject>
@required
- (void)dataFromController:(NSString *)data;
@end

@interface QuestionDetailVC : UIViewController

@property (nonatomic) IBOutlet UILabel *questionLabel;
@property (weak, nonatomic) IBOutlet UITextView *answerTextView;

@property (nonatomic) NSString *question;

@property (nonatomic, retain) NSString *data;
@property (nonatomic, weak) id<SecondViewControllerDelegate> delegate;

@end
