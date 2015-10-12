//
//  WishListTableViewCell.m
//  Unit-2-Journal
//
//  Created by Shena Yoshida on 10/12/15.
//  Copyright © 2015 Jamaal Sedayao. All rights reserved.
//

#import "WishListTableViewCell.h"

@implementation WishListTableViewCell

- (void)awakeFromNib {
    // Initialization code
    
    self.artworkImage.clipsToBounds = YES;
    self.artworkImage.layer.borderColor = [UIColor blackColor].CGColor;
    self.artworkImage.layer.borderWidth = 2.0;
    self.artworkImage.layer.cornerRadius = 25.0;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
