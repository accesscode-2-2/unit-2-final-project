//
//  questionDetailVC.h
//  BreakingBad
//
//  Created by Zoufishan Mehdi on 10/12/15.
//  Copyright © 2015 Zoufishan Mehdi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QuestionDetailVC : UIViewController

@property (nonatomic) IBOutlet UILabel *questionLabel;
@property (weak, nonatomic) IBOutlet UITextView *answerTextView;

@property (nonatomic) NSString *question;

@end
