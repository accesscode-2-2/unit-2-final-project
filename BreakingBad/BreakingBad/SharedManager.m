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
        [sharedMyManager initializeColorData];
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


-(void)initializeColorData {
    
    //Pompeii Palette
        self.icyNight = [SharedManager makeColorWithRed:235 green:240 blue:240 alpha:1.0];
        self.blueSky = [SharedManager makeColorWithRed:212 green:230 blue:230 alpha:1.0];
        self.tropicalDream = [SharedManager makeColorWithRed:174 green:200 blue:203 alpha:1.0];
        self.brownForest = [SharedManager makeColorWithRed:95 green:86 blue:81 alpha:1.0];
        self.brickRed = [SharedManager makeColorWithRed:178 green:126 blue:111 alpha:1.0];
        self.colesiumGrey = [SharedManager makeColorWithRed:208 green:203 blue:194 alpha:1.0];
    
    //Color Entrance Color Palette
//        self.iceGrey = [SharedManager makeColorWithRed:235 green:235 blue:235 alpha:1.0];
//        self.mintGreen = [SharedManager makeColorWithRed:205 green:221 blue:217 alpha:1.0];
//        self.blueSteel = [SharedManager makeColorWithRed:123 green:132 blue:152 alpha:1.0];
//        self.chocolateBrown = [SharedManager makeColorWithRed:87 green:69 blue:77 alpha:1.0];
//        self.caramelToffee = [SharedManager makeColorWithRed:199 green:180 blue:150 alpha:1.0];
//        self.pastelPink = [SharedManager makeColorWithRed:221 green:203 blue:208 alpha:1.0];
    
    
    //Scandinavia Hues Color Palette
//    self.aquaBlue = [SharedManager makeColorWithRed:222 green:239 blue:232 alpha:1.0];
//    self.eggplantPurple = [SharedManager makeColorWithRed:80 green:58 blue:73 alpha:1.0];
//    self.maroon = [SharedManager makeColorWithRed:89 green:33 blue:48 alpha:1.0];
//    self.sherbert = [SharedManager makeColorWithRed:157 green:72 blue:81 alpha:1.0];
//    self.caramelToffee = [SharedManager makeColorWithRed:200 green:177 blue:130 alpha:1.0];
//    self.vanillaSky = [SharedManager makeColorWithRed:230 green:220 blue:188 alpha:1.0];
    
}

+(UIColor *)makeColorWithRed:(NSInteger)red green:(NSInteger)green blue:(NSInteger)blue alpha:(NSInteger)alpha {
    return [UIColor colorWithRed:red / 255.0
                           green:green / 255.0
                            blue:blue / 255.0
                           alpha:alpha / 1.0];
}


@end
