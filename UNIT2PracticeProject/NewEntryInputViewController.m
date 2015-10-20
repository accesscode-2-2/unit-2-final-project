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

@property (weak, nonatomic) IBOutlet UILabel *addTitle;


@end

@implementation NewEntryInputViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
    [self.addTitle.layer setCornerRadius:30.0f];

    
    // Do any additional setup after loading the view.
    self.entryObject = [[JournalEntryObject alloc] init];
    
    if (self.selectedPhoto.image != nil) {
        NSLog(@"We have Photo Data");
    }
    [self.view endEditing:YES];

}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

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
