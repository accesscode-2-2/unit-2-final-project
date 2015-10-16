//
//  Habit.h
//  BreakingBad
//
//  Created by Mesfin Bekele Mekonnen on 10/11/15.
//  Copyright © 2015 Zoufishan Mehdi. All rights reserved.
//

#import <Parse/Parse.h>
#import "Entry.h"
#import "Goal.h"

@interface Habit : PFObject<PFSubclassing, NSCopying>

@property (nonatomic) NSMutableArray<Entry *> *entries;
@property (nonatomic) NSMutableArray<Goal *> *goals;
@property (nonatomic) NSString *name;

@end
