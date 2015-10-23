//
//  FoursquareAPIManager.h
//  InControl
//
//  Created by Xiulan Shi on 10/18/15.
//  Copyright © 2015 Diana Elezaj. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Venue.h"

@interface FoursquareAPIManager : NSObject

+ (void)fetchResultsWithSearchTerm:(NSString*)searchTerm location:(NSString*)location
                     callbackBlock:(void(^)(id response))block;

+ (void)fetchPhotosForVenue:(Venue *)venue callbackBlock:(void(^)(id response))block;


@end
