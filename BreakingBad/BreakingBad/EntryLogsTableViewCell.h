//
//  EntryLogsTableViewCell.h
//  BreakingBad
//
//  Created by Mesfin Bekele Mekonnen on 10/17/15.
//  Copyright © 2015 Zoufishan Mehdi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EntryLogsTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *weatherIconImageView;
@property (weak, nonatomic) IBOutlet UILabel *tempInfoLabel;
@property (weak, nonatomic) IBOutlet UILabel *entryDateLabel;

@end
