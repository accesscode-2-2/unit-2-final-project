//
//  FetchWeatherData.m
//  BreakingBad
//
//  Created by Mesfin Bekele Mekonnen on 10/19/15.
//  Copyright © 2015 Zoufishan Mehdi. All rights reserved.
//

#import "FetchWeatherData.h"
#import "SharedManager.h"
#import <AFNetworking/AFNetworking.h>



@implementation FetchWeatherData

-(instancetype)init{
    if (self = [super init]) {
        self.habit = [SharedManager sharedModel].habit;
        //[self fetchWeatherData];
        //self.primeQueue = [NSOperationQueue new];
        [self data];
        return self;
    }
    return nil;
}



-(NSArray *)data{
    NSMutableArray<NSOperation *> *operationArray =[NSMutableArray new];
    for(int i=0; i < self.urlStringsArray.count; i++)
    {
        NSBlockOperation *operation = [NSBlockOperation blockOperationWithBlock:^{
            NSMutableArray<NSURLRequest *> *urlRequests = [NSMutableArray new];
            
            NSURL *url = [NSURL URLWithString:self.urlStringsArray[i]];
            NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
            [urlRequests addObject:urlRequest];
            
        }];
        [operationArray addObject:operation];
    }
    [self.primeQueue addOperations:operationArray waitUntilFinished:YES];
    
    [AFURLConnectionOperation batchOfRequestOperations:operationArray progressBlock:^(NSUInteger numberOfFinishedOperations, NSUInteger totalNumberOfOperations) {
        NSLog(@"%lu",(unsigned long)numberOfFinishedOperations);
    } completionBlock:^(NSArray * _Nonnull operations) {
        NSLog(@"%@",operations);
    }];
    return operationArray;
    
}



@end
