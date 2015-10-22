//
//  JournalEntryObject.h
//  UNIT2PracticeProject
//
//  Created by Bereket  on 10/15/15.
//  Copyright © 2015 Bereket . All rights reserved.
//

#import <CoreData/CoreData.h>
#import "NewJournalEntryViewController.h"
#import "NewEntryInputViewController.h"


@interface JournalEntryObject : NSManagedObject <UITextViewDelegate, UITextFieldDelegate>

@property (nonatomic) NSString*  savedTextEntry;
@property (nonatomic) NSString* savedTitle;
@property (nonatomic) NSDate* timeOfEntry;
@property (nonatomic) UIImage* savedImageEntry;

@end
