//
//  ImageSingleton.m
//  UNIT2PracticeProject
//
//  Created by Bereket  on 10/18/15.
//  Copyright © 2015 Bereket . All rights reserved.
//

#import "ImageSingleton.h"


@implementation ImageSingleton

+ (ImageSingleton *)myImage {
    static ImageSingleton *sharedMyManager = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedMyManager = [[self alloc] init];
       sharedMyManager.image = nil;
        
    });
    
    return sharedMyManager;
}




@end
