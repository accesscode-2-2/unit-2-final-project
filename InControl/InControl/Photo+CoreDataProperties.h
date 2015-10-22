//
//  Photo+CoreDataProperties.h
//  InControl
//
//  Created by Xiulan Shi on 10/21/15.
//  Copyright © 2015 Diana Elezaj. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Photo.h"

NS_ASSUME_NONNULL_BEGIN

@interface Photo (CoreDataProperties)

@property (nullable, nonatomic, retain) NSData *imageData;
@property (nullable, nonatomic, retain) NSDate *createdAt;
@property (nullable, nonatomic, retain) City *city;

@end

NS_ASSUME_NONNULL_END
