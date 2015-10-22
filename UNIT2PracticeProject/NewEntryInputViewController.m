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
#import "AppDelegate.h"

@interface NewEntryInputViewController ()


@end

@implementation NewEntryInputViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    AppDelegate *delegate = [UIApplication sharedApplication].delegate;
    
    self.entryObject = [NSEntityDescription insertNewObjectForEntityForName:@"JournalEntryObject" inManagedObjectContext:delegate.managedObjectContext];
    
    if (self.selectedPhoto.image != nil) {
        NSLog(@"We have Photo Data");
    }
    [self.view endEditing:YES];
    
    self.journalEntryTextView.text = @"Enter Text Here";
    self.journalEntryTextView.textColor = [UIColor lightGrayColor];
    self.journalEntryTextView.delegate = self;
    
//    NSArray *savedJournalEntries = [[NSUserDefaults standardUserDefaults] objectForKey:@"journalEntriesKey"];
//
//    if (savedJournalEntries) {
//        [PhotoAlbum sharedPhotoAlbum].photoEntries = savedJournalEntries.mutableCopy;
//    }
//    
    
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
    
    self.entryObject.timeOfEntry = [[NSDate alloc] init];
    
    
    self.entryObject.savedImageEntry = [ImageSingleton myImage].image;
    
    
    [[PhotoAlbum sharedPhotoAlbum].photoEntries addObject:self.entryObject];
    
    AppDelegate *delegate = [UIApplication sharedApplication].delegate;
    [delegate saveContext];        //saves into the "database"
    
    
    [self.navigationController popToRootViewControllerAnimated:YES]; //<---yo remember this
    

    
}




@end
