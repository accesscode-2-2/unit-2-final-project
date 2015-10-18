//
//  City+CoreDataProperties.h
//  InControl
//
//  Created by Xiulan Shi on 10/18/15.
//  Copyright © 2015 Diana Elezaj. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "City.h"

NS_ASSUME_NONNULL_BEGIN

@interface City (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *name;
@property (nullable, nonatomic, retain) NSNumber *rate;
@property (nullable, nonatomic, retain) NSString *impression;
@property (nullable, nonatomic, retain) NSData *photo;

@end

NS_ASSUME_NONNULL_END
