//
//  BBUser.h
//  BreakingBad
//
//  Created by Mesfin Bekele Mekonnen on 10/11/15.
//  Copyright © 2015 Zoufishan Mehdi. All rights reserved.
//

#import "PFUser.h"
#import "Habit.h"
#import <Parse/Parse.h>

@interface BBUser : PFUser<PFSubclassing>

@property (nonatomic) NSMutableArray<Habit *> *habits;
@property (nonatomic) NSString *email;
@property (nonatomic) NSString *password;
@property (nonatomic) NSString *username;

@end
