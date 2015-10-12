//
//  HabitList.m
//  BreakingBad
//
//  Created by Mesfin Bekele Mekonnen on 10/12/15.
//  Copyright © 2015 Zoufishan Mehdi. All rights reserved.
//

#import "HabitList.h"

@implementation HabitList


+ (NSMutableArray *)listOfHabits{
    
    
    NSArray *habitList = @[@"Smoking",
                           @"Bitting your nails",
                           @"Cocaine Addiction",
                           @"Biting your lips",
                           @"Eating unhealthy",
                           @"Excessive Drinking",
                           @"Facebook"];
    
    NSMutableArray *hl = [NSMutableArray new];
    
    [hl addObjectsFromArray:habitList];
    
    return hl;
}

@end
