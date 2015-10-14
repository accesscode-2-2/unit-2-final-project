//
//  CustomContextTableViewCell.m
//  BreakingBad
//
//  Created by Mesfin Bekele Mekonnen on 10/14/15.
//  Copyright © 2015 Zoufishan Mehdi. All rights reserved.
//

#import "CustomContextTableViewCell.h"

@implementation CustomContextTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.layer.masksToBounds = YES;
    self.layer.shadowOffset = CGSizeMake(0, 2);
    self.layer.shadowColor = [[UIColor colorWithRed:181.0/255.0 green:181.0/255.0 blue:181.0/255.0 alpha:1] CGColor];
    self.layer.shadowRadius = 5;
    self.layer.shadowOpacity = 0.5;
}

-(UIView *)animatedContent{
    return self.menuTitleLabel;
}

-(UIView *)animatedIcon{
    return self.menuTitleImage;
}


@end
