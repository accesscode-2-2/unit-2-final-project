//
//  HabitsNewsTableViewCell.h
//  BreakingBad
//
//  Created by Zoufishan Mehdi on 10/19/15.
//  Copyright © 2015 Zoufishan Mehdi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HabitsNewsTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *newsHeadlineLabel;
@property (weak, nonatomic) IBOutlet UITextView *newsSnippetTextView;

@end
