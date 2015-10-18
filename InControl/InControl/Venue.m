//
//  Venue.m
//  InControl
//
//  Created by Xiulan Shi on 10/13/15.
//  Copyright © 2015 Diana Elezaj. All rights reserved.
//

#import "Venue.h"
#import "FoursquareAPIManager.h"

@implementation Venue

- (void)fetchPhotosWithCallbackBlock:(void(^)())callbackBlock {
    
    [FoursquareAPIManager fetchPhotosForVenue:self callbackBlock:^(id response) {
        NSDictionary *photoData = [response[@"response"][@"photos"][@"items"] firstObject];
        NSString *size = [NSString stringWithFormat:@"%@x%@", photoData[@"width"], photoData[@"height"]];
        NSString *photoURL = [NSString stringWithFormat:@"%@%@%@", photoData[@"prefix"], size, photoData[@"suffix"]];

        self.photoURL = [NSURL URLWithString:photoURL];
        
        if (self.photoUpdateListener) {
            self.photoUpdateListener();
        }
        
        if (callbackBlock) {
            callbackBlock();
        }
    }];
}



@end
