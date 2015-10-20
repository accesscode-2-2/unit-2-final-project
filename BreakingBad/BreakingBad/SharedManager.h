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

@interface SharedManager : NSObject

@property (nonatomic) HabitList *habitListData;

@property (nonatomic) NSMutableArray *habitArray;
@property (nonatomic) NSInteger selectedRow;
@property (nonatomic) NSMutableDictionary *answersDictionary;

@property (nonatomic) BBUser *currentUser;

//Pompeii Palette
@property (nonatomic) UIColor *icyNight;
@property (nonatomic) UIColor *blueSky;
@property (nonatomic) UIColor *tropicalDream; //darker blue/green
@property (nonatomic) UIColor *brownForest;
@property (nonatomic) UIColor *brickRed;
@property (nonatomic) UIColor *colesiumGrey;

//Color Entrance Color Palette
//@property (nonatomic) UIColor *iceGrey;
//@property (nonatomic) UIColor *mintGreen;
//@property (nonatomic) UIColor *blueSteel;
//@property (nonatomic) UIColor *chocolateBrown;
//@property (nonatomic) UIColor *caramelToffee;
//@property (nonatomic) UIColor *pastelPink;

//Scandinavian Hues Color Palette
//@property (nonatomic) UIColor *aquaBlue;
//@property (nonatomic) UIColor *eggplantPurple;
//@property (nonatomic) UIColor *maroon;
//@property (nonatomic) UIColor *sherbert;
//@property (nonatomic) UIColor *caramelToffee;
//@property (nonatomic) UIColor *vanillaSky;



+ (SharedManager *)sharedModel;

+(UIColor *)makeColorWithRed:(NSInteger)red
                       green:(NSInteger)green
                        blue:(NSInteger)blue
                       alpha:(NSInteger)alpha;

-(void)initializeData;

-(void)initializeColorData;

@end
