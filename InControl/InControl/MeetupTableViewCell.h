//
//  MeetupTableViewCell.h
//  InControl
//
//  Created by Artur Lan on 10/18/15.
//  Copyright © 2015 Diana Elezaj. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MeetupTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *whoLabel;
@property (weak, nonatomic) IBOutlet UILabel *cityAndCountryLabel;
@property (weak, nonatomic) IBOutlet UILabel *descriptionMeetup;
@end
