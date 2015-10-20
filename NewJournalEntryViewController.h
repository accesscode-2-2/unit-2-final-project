//
//  NewJournalEntryViewController.h
//  UNIT2PracticeProject
//
//  Created by Bereket  on 10/15/15.
//  Copyright © 2015 Bereket . All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JournalEntryObject.h"
#import "NewEntryInputViewController.h"
#import "ImageSingleton.h"

@interface NewJournalEntryViewController : UIViewController

<
UIImagePickerControllerDelegate,
UINavigationControllerDelegate
>

- (IBAction)takeAphotoButtonTapped:(id)sender;


- (IBAction)newEntryButtonTapped:(id)sender;


@property (strong, nonatomic) IBOutlet UIImageView *capturedPicImageView;

@end
