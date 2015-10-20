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


//color properties for Pompeii Palette
@property (nonatomic) UIColor *icyNight;
@property (nonatomic) UIColor *blueSky;
@property (nonatomic) UIColor *tropicalDream;
@property (nonatomic) UIColor *brownForest;
@property (nonatomic) UIColor *brickRed;
@property (nonatomic) UIColor *colesiumGrey;

+(UIColor *)makeColorWithRed:(NSInteger)red
                       green:(NSInteger)green
                        blue:(NSInteger)blue
                       alpha:(NSInteger)alpha;

-(void)initializeData;

-(void)initializeColorData;

@end