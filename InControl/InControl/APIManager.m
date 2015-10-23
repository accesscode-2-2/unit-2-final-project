//
//  APIManager.m
//  InControl
//
//  Created by Xiulan Shi on 10/13/15.
//  Copyright © 2015 Diana Elezaj. All rights reserved.
//

#import "APIManager.h"

@implementation APIManager

+ (void) GETRequestWithURL:(NSURL *) URL completionHandler:(void(^)(NSData *, NSURLResponse *, NSError *)) completionHandler {
    
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:URL completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            completionHandler(data, response, error);
        });
    }];
    
    [dataTask resume];
    
}

@end
