//
//  APIManager.h
//  InControl
//
//  Created by Xiulan Shi on 10/13/15.
//  Copyright © 2015 Diana Elezaj. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface APIManager : NSObject

+ (void) GETRequestWithURL:(NSURL *) URL completionHandler:(void(^)(NSData *, NSURLResponse *, NSError *)) completionHandler;

@end
