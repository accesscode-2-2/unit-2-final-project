//
//  HabitList.h
//  BreakingBad
//
//  Created by Mesfin Bekele Mekonnen on 10/12/15.
//  Copyright © 2015 Zoufishan Mehdi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HabitList : NSObject

@property (nonatomic) NSMutableArray *habits; 

//+ (NSMutableArray *)listOfHabits;


- (NSMutableArray *)habitsList;

@end
