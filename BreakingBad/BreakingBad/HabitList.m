//
//  HabitList.m
//  BreakingBad
//
//  Created by Mesfin Bekele Mekonnen on 10/12/15.
//  Copyright © 2015 Zoufishan Mehdi. All rights reserved.
//

#import "HabitList.h"
#import "ViewController.h"
#import "QuestionDetailVC.h"

@implementation HabitList


//+ (NSMutableArray *)listOfHabits{
//    
//    
//    NSArray *habitList = @[@"Smoking",
//                           @"Biting your nails",
//                           @"Cocaine Addiction",
//                           @"Biting your lips",
//                           @"Eating unhealthy",
//                           @"Excessive Drinking",
//                           @"Facebook"];
//    
//   
//    
////    [ addObjectsFromArray:habitList];
//    
//    
//    return nil;
//}

- (NSMutableArray *)habitsList{
    NSArray *habitList = @[@"Smoking",
                           @"Biting your nails",
                           @"Cocaine Addiction",
                           @"Biting your lips",
                           @"Eating unhealthy",
                           @"Excessive Drinking",
                           @"Facebook"];
    
    self.habits  = [[NSMutableArray alloc] initWithArray:habitList];
    return self.habits;
}

@end
