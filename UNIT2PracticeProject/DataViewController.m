//
//  DataViewController.m
//  UNIT2PracticeProject
//
//  Created by Bereket  on 10/12/15.
//  Copyright © 2015 Bereket . All rights reserved.
//

#import "DataViewController.h"

@interface DataViewController ()

@end

@implementation DataViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
}



- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.dataLabel.text = [self.photoDataObject description];
    
    //    for (int count=0; count<[PhotoAlbum sharedPhotoAlbum].photoEntries.count; count++) {
    //
    //        JournalEntryObject* someObject = [[PhotoAlbum sharedPhotoAlbum].photoEntries objectAtIndex:count];
    //        NSLog(@"SAVED TITLE : %@", someObject);
    //
    //       // NSLog(@"%@",[PhotoAlbum sharedPhotoAlbum].photoEntries);
    //    }
    //
    self.imageView.image = (UIImage *)self.photoDataObject;
    self.titleLabel.text= (NSString*)self.titleDataObject;
    self.textView.text = (NSString*)self.textEntrydataObject;
    
}


@end
