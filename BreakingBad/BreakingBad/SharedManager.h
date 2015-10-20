//
//  SharedManager.h
//  BreakingBad
//
//  Created by Zoufishan Mehdi on 10/13/15.
//  Copyright © 2015 Zoufishan Mehdi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HabitList.h"
#import "ViewController.h"
#import "BBUser.h"
#import "Habit.h"

@interface SharedManager : NSObject

@property (nonatomic) HabitList *habitListData;

@property (nonatomic) NSMutableArray *habitArray;
@property (nonatomic) NSInteger selectedRow;
@property (nonatomic) NSMutableDictionary *answersDictionary;

@property (nonatomic) BBUser *currentUser;

@property (nonatomic) Habit *habit;


+ (SharedManager *)sharedModel;

-(void)initializeData; 

@end
