//
//  JournalEntryObject.h
//  UNIT2PracticeProject
//
//  Created by Bereket  on 10/15/15.
//  Copyright © 2015 Bereket . All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NewJournalEntryViewController.h"
#import "NewEntryInputViewController.h"


@interface JournalEntryObject : NSObject <UITextViewDelegate, UITextFieldDelegate>

@property (nonatomic) UIImage* savedImageEntry;
@property (nonatomic) NSString*  savedTextEntry;
@property (nonatomic) NSString* savedTitle;


@end
