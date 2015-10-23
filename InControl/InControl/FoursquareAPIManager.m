//
//  FoursquareAPIManager.m
//  InControl
//
//  Created by Xiulan Shi on 10/18/15.
//  Copyright © 2015 Diana Elezaj. All rights reserved.
//

#import "FoursquareAPIManager.h"
#import "APIManager.h"

@implementation FoursquareAPIManager

+ (void)fetchResultsWithSearchTerm:(NSString*)searchTerm
                          location:(NSString*)location
                     callbackBlock:(void(^)(id response))callbackBlock {
    
    NSString *urlString = [NSString stringWithFormat:@"https://api.foursquare.com/v2/venues/search?near=%@&query=%@&client_id=SVBBDTUHT5WOBDQ5NINYVTLNDNTHGD0XGRRE0LMB304VMWG1&client_secret=ZHPO4GOAGH3YSPQNQZAYC13YJ420Q2IPXAI0CRHQ0I3SB0HL&v=20151015", location, searchTerm];
    
    NSString *encodedString = [urlString stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    
    NSURL *url = [NSURL URLWithString:encodedString];
    
    [APIManager GETRequestWithURL:url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        
        if (data != nil) {
            NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
            callbackBlock(json);
        }
    }];
}

+ (void)fetchPhotosForVenue:(Venue *)venue
              callbackBlock:(void(^)(id response))callbackBlock {
    
    NSString *photoUrlString = [NSString stringWithFormat:@"https://api.foursquare.com/v2/venues/%@/photos?oauth_token=JJS3ZNRESBNYJF5OPZO3O4H2GYE5JBWSGTTZEVAKHCPALCLW&v=20151015", venue.venueID];
    NSString *encodedPhotoString = [photoUrlString stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    
    NSURL *photoUrl = [NSURL URLWithString:encodedPhotoString];
    
    [APIManager GETRequestWithURL:photoUrl completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        
        if (data != nil) {
            NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
            callbackBlock(json);
        }
    }];
}


@end
