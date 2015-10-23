//
//  Venue.h
//  InControl
//
//  Created by Xiulan Shi on 10/13/15.
//  Copyright © 2015 Diana Elezaj. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Venue : NSObject

@property (nonatomic) NSString *name;
@property (nonatomic) NSString *address;
@property (nonatomic) NSNumber *phone;
@property (nonatomic) NSURL *photoURL;

@property (nonatomic) NSString *latlng;
@property (nonatomic) NSString *venueID;
@property (nonatomic, copy) void (^photoUpdateListener)();

- (void)fetchPhotosWithCallbackBlock:(void(^)())callbackBlock;


@end
