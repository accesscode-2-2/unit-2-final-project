//
//  CollectionViewCell.h
//  finalMeetUp
//
//  Created by Christian Maldonado on 10/18/15.
//  Copyright © 2015 Christian Maldonado. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *sortNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *idLabel;
@property (weak, nonatomic) IBOutlet UILabel *shortNameLabel;

@end
