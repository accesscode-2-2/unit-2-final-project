//
//  ImageSingleton.h
//  UNIT2PracticeProject
//
//  Created by Bereket  on 10/18/15.
//  Copyright © 2015 Bereket . All rights reserved.
//

#import <Foundation/Foundation.h>
#import  <UIKit/UIKit.h>
@interface ImageSingleton : NSObject



@property (nonatomic) UIImage* image;


+ (ImageSingleton *)myImage;


@end
