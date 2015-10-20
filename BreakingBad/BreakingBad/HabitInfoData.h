//
//  HabitInfoData.h
//  BreakingBad
//
//  Created by Zoufishan Mehdi on 10/18/15.
//  Copyright © 2015 Zoufishan Mehdi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HabitInfoData : NSObject

//add info properties to be used in instance type
@property (nonatomic) NSString *nyHeadline;
@property (nonatomic) NSString *nySnippet;
@property (nonatomic) NSString *nyUrl;

- (instancetype)initWithJSON:(NSDictionary *)json;

@end
