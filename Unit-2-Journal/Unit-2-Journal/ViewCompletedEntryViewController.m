//
//  ViewCompletedEntryViewController.m
//  Unit-2-Journal
//
//  Created by Shena Yoshida on 10/10/15.
//  Copyright © 2015 Jamaal Sedayao. All rights reserved.
//

#import "ViewCompletedEntryViewController.h"

@interface ViewCompletedEntryViewController ()

@end

@implementation ViewCompletedEntryViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"Journal Post passed: %@",self.journalPostDetail);
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];

}

#pragma mark - delete item

- (IBAction)deleteButtonTapped:(id)sender
{
    // delete item from memory and storyboard
    
    [self dismissViewControllerAnimated:YES completion:nil];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
