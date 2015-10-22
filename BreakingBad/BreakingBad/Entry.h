//
//  Entry.h
//  BreakingBad
//
//  Created by Mesfin Bekele Mekonnen on 10/11/15.
//  Copyright © 2015 Zoufishan Mehdi. All rights reserved.
//

#import "PFObject.h"
#import <Parse/Parse.h>

@interface Entry : PFObject<PFSubclassing>

@property (nonatomic) NSString *entryLog;
@property (nonatomic) NSDictionary *logs;
@property (nonatomic) NSString *temperature;
@property (nonatomic) NSString *location;

@end
