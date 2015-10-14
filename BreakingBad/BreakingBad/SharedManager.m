//
//  SharedManager.m
//  BreakingBad
//
//  Created by Zoufishan Mehdi on 10/13/15.
//  Copyright © 2015 Zoufishan Mehdi. All rights reserved.
//

#import "SharedManager.h"

@implementation SharedManager

+ (SharedManager *)sharedModel {
    static SharedManager *sharedMyManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedMyManager = [[self alloc] init];
        [sharedMyManager initializeData];
    });
    return sharedMyManager;
    
}

//+ (SharedManager *)sharedInstance
//{
//    static dispatch_once_t predicate = 0;
//    __strong static id sharedObject = nil;
//    //static id sharedObject = nil;  //if you're not using ARC
//    dispatch_once(&predicate, ^{
//        sharedObject = [[self alloc] init];
//        
//        [SharedManager in
//        //sharedObject = [[[self alloc] init] retain]; // if you're not using ARC
//    });
//    return sharedObject;
//}



-(void)initializeData{
    
    self.habitListData = [[HabitList alloc] init];
    
    self.habitArray = @[@"Smoking",
                        @"Biting your nails",
                        @"Cocaine Addiction",
                        @"Biting your lips",
                        @"Eating unhealthy",
                        @"Excessive Drinking",
                        @"Facebook"].mutableCopy;
    
}

@end
