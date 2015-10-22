//
//  Goal.h
//  BreakingBad
//
//  Created by Mesfin Bekele Mekonnen on 10/11/15.
//  Copyright © 2015 Zoufishan Mehdi. All rights reserved.
//

#import "PFObject.h"
#import "Step.h"
#import <Parse/Parse.h>

@interface Goal : PFObject<PFSubclassing>

@property (nonatomic) NSMutableArray<Step *> *steps;
@property (nonatomic) NSString *name;


@end
