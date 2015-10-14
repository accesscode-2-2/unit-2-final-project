//
//  CustomContextTableViewCell.h
//  BreakingBad
//
//  Created by Mesfin Bekele Mekonnen on 10/14/15.
//  Copyright © 2015 Zoufishan Mehdi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YALContextMenuCell.h"

@interface CustomContextTableViewCell : UITableViewCell<YALContextMenuCell>

@property (weak, nonatomic) IBOutlet UIImageView *menuTitleImage;
@property (weak, nonatomic) IBOutlet UILabel *menuTitleLabel;

@end
