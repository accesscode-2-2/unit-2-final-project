//
//  VisitedTableViewCell.h
//  InControl
//
//  Created by Diana Elezaj on 10/20/15.
//  Copyright © 2015 Diana Elezaj. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VisitedTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *cityImageView;
@property (weak, nonatomic) IBOutlet UILabel *cityNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *cityRateLabel;

@end
