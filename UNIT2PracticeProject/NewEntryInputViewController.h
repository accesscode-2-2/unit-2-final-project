//
//  NewEntryInputViewController.h
//  UNIT2PracticeProject
//
//  Created by Bereket  on 10/15/15.
//  Copyright © 2015 Bereket . All rights reserved.
//

#import <UIKit/UIKit.h>

#import "NewJournalEntryViewController.h"
#import "PhotoAlbum.h"

@class JournalEntryObject;

@interface NewEntryInputViewController : UIViewController

<UITextFieldDelegate,
UITextViewDelegate>

@property (nonatomic) JournalEntryObject *entryObject;

@property (strong, nonatomic) IBOutlet UITextField *titleTextField;

@property (strong, nonatomic) IBOutlet UITextView *journalEntryTextView;


- (IBAction)saveEntryButtonTapped:(id)sender;

@property (nonatomic) UIImageView* selectedPhoto; //<-------

//@property (nonatomic) JournalEntryObject *myJournalEntry;

@end
