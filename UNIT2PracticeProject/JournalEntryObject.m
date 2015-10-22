//
//  JournalEntryObject.m
//  UNIT2PracticeProject
//
//  Created by Bereket  on 10/15/15.
//  Copyright © 2015 Bereket . All rights reserved.
//

#import "JournalEntryObject.h"

@interface JournalEntryObject ()
@property (nonatomic) NSData* savedImageEntryData;
@end

@implementation JournalEntryObject

@dynamic  savedTextEntry;
@dynamic  savedTitle;
@dynamic  timeOfEntry;
@dynamic  savedImageEntryData;

@dynamic savedImageEntry;  //this is not backed by Core Data :D

- (void)setSavedImageEntry:(UIImage *)savedImageEntry {
    self.savedImageEntryData = UIImagePNGRepresentation(savedImageEntry); // UIImagePNGRepresentation converts it to NSData.
}

- (UIImage *)savedImageEntry {
        
    return [UIImage imageWithData:self.savedImageEntryData];
}

@end
