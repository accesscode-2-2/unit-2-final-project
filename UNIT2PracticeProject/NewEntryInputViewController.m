//
//  NewEntryInputViewController.m
//  UNIT2PracticeProject
//
//  Created by Bereket  on 10/15/15.
//  Copyright © 2015 Bereket . All rights reserved.
//

#import "NewEntryInputViewController.h"
#import "EntryListTableViewController.h"
#import "JournalEntryObject.h"
#import "PhotoAlbum.h"

@interface NewEntryInputViewController ()


@end

@implementation NewEntryInputViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.entryObject = [[JournalEntryObject alloc] init];
    
    if (self.selectedPhoto.image != nil) {
        NSLog(@"We have Photo Data");
    }
    [self.view endEditing:YES];
    
    self.journalEntryTextView.text = @"Enter Text Here";
    self.journalEntryTextView.textColor = [UIColor lightGrayColor];
    self.journalEntryTextView.delegate = self;
    
}

#pragma placeholder text for journalEntryTextView

- (BOOL) textViewShouldBeginEditing:(UITextView *)textView
{
    self.journalEntryTextView.text = @"";
    self.journalEntryTextView.textColor = [UIColor blackColor];
    return YES;
}

-(void) textViewDidChange:(UITextView *)textView
{
    
    if(self.journalEntryTextView.text.length == 0){
        self.journalEntryTextView.textColor = [UIColor lightGrayColor];
        self.journalEntryTextView.text = @"Enter Text Here";
        [self.journalEntryTextView resignFirstResponder];
    }
}


#pragma saveEntry
- (IBAction)saveEntryButtonTapped:(id)sender {
    
    NSLog(@"%@", self.journalEntryTextView.text);
    NSLog(@"%@", self.titleTextField.text);
    
    self.entryObject.savedTextEntry = self.journalEntryTextView.text;
    self.entryObject.savedTitle = self.titleTextField.text;
    
    self.entryObject.savedImageEntry = [ImageSingleton myImage].image;
    
    
    [[PhotoAlbum sharedPhotoAlbum].photoEntries addObject:self.entryObject];
    
    //   JournalEntryObject* someObject = [[PhotoAlbum sharedPhotoAlbum].photoEntries objectAtIndex:0];
    //   NSLog(@"SAVED TITLE : %@", someObject.savedImageEntry);
    
    //    UINavigationController *navController = [self.tabBarController.viewControllers objectAtIndex:1];
    //
    //    EntryListTableViewController* viewcontroller = [navController.viewControllers firstObject];
    //
    //
    //
    
    [self dismissViewControllerAnimated:NO completion:nil];
    
}


@end
