//
//  FetchWeatherData.h
//  BreakingBad
//
//  Created by Mesfin Bekele Mekonnen on 10/19/15.
//  Copyright © 2015 Zoufishan Mehdi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Habit.h"

@interface FetchWeatherData : NSObject

@property (nonatomic) NSArray *urlStringsArray;

@property (nonatomic) NSMutableArray *temps;


@property (nonatomic) Habit *habit;

@property (nonatomic) NSArray *data;

@property (nonatomic) NSOperationQueue *primeQueue;


@end
