//
//  HabitInfoData.m
//  BreakingBad
//
//  Created by Zoufishan Mehdi on 10/18/15.
//  Copyright © 2015 Zoufishan Mehdi. All rights reserved.
//

#import "HabitInfoData.h"

@implementation HabitInfoData

- (instancetype) initWithJSON:(NSDictionary *)json {
    
    if (self = [super init]) {
        self.nyHeadline = json[@"headline"][@"main"];
        self.nySnippet = json[@"snippet"];
        self.nyUrl = json[@"web_url"];
       
        return self;
    }
    return nil;
}

@end
