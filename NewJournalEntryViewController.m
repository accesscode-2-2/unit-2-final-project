//
//  NewJournalEntryViewController.m
//  UNIT2PracticeProject
//
//  Created by Bereket  on 10/15/15.
//  Copyright © 2015 Bereket . All rights reserved.
//

#import "NewJournalEntryViewController.h"

@interface NewJournalEntryViewController ()

@end

@implementation NewJournalEntryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)takeAphotoButtonTapped:(id)sender {
    
    if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        
        UIAlertView *myAlertView = [[UIAlertView alloc] initWithTitle:@"Error"
                                                              message:@"Device has no camera"
                                                             delegate:nil
                                                    cancelButtonTitle:@"OK"
                                                    otherButtonTitles: nil];
        
        [myAlertView show];
        
    } else {
    
    UIImagePickerController* picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    
    [self presentViewController: picker animated:YES completion: NULL];
    
    }
    
    
}

- (IBAction)newEntryButtonTapped:(id)sender {
    
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    
    [self presentViewController:picker animated:YES completion:NULL];
    
    
}


- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    
//   UIImage *chosenImage = info[UIImagePickerControllerEditedImage];
    
    self.capturedPicImageView.image = info[UIImagePickerControllerEditedImage];
    
    [ImageSingleton myImage].image = self.capturedPicImageView.image;
    
    //[[PhotoAlbum sharedPhotoAlbum].photoEntries addObject:chosenImage];
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
//    if ([segue.identifier isEqualToString:@"InputEntryIdentifier"]) {
//        
//        NewEntryInputViewController* viewController = segue.destinationViewController;
//        
//        [ImageSingleton myImage].image = self.capturedPicImageView.image;
//        
//        if (viewController.selectedPhoto.image != nil) {
//            NSLog(@"We have Photo Data");
//        }
//
    
}

@end
