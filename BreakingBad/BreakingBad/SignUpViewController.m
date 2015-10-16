//
//  SignUpViewController.m
//  BreakingBad
//
//  Created by Mesfin Bekele Mekonnen on 10/16/15.
//  Copyright © 2015 Zoufishan Mehdi. All rights reserved.
//

#import "SignUpViewController.h"
#import "MainPageVC.h"

@interface SignUpViewController ()

@end

@implementation SignUpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.signUpView setLogo:[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"drugs"]]];
}




//
//
//#pragma mark
//#pragma PFSignUpViewController Delegate
//
//// Sent to the delegate to determine whether the sign up request should be submitted to the server.
//- (BOOL)signUpViewController:(PFSignUpViewController *)signUpController shouldBeginSignUp:(NSDictionary *)info {
//    BOOL informationComplete = YES;
//    
//    // loop through all of the submitted data
//    for (id key in info) {
//        NSString *field = [info objectForKey:key];
//        if (!field || field.length == 0) { // check completion
//            informationComplete = NO;
//            break;
//        }
//    }
//    
//    // Display an alert if a field wasn't completed
//    if (!informationComplete) {
//        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Missing Information" message:@"Make sure you fill out all of the information!" preferredStyle:UIAlertControllerStyleAlert];
//        
//        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
//            [alertController dismissViewControllerAnimated:YES completion:nil];
//        }];
//        
//        [alertController addAction:okAction];
//        
//        [self presentViewController:alertController animated:YES completion:nil];
//    }
//    
//    return informationComplete;
//}
//
//// Sent to the delegate when a PFUser is signed up.
//- (void)signUpViewController:(PFSignUpViewController *)signUpController didSignUpUser:(PFUser *)user {
//    MainPageVC *mvc = (MainPageVC *)[self.storyboard instantiateViewControllerWithIdentifier:@"showMainPgVC"];
//    [self presentViewController:mvc animated:YES completion:nil];
//    [self dismissViewControllerAnimated:YES completion:nil];
//    // Dismiss the PFSignUpViewController
//}
//
//// Sent to the delegate when the sign up attempt fails.
//- (void)signUpViewController:(PFSignUpViewController *)signUpController didFailToSignUpWithError:(NSError *)error {
//    NSLog(@"Failed to sign up because of error %@...", error.localizedDescription);
//}
//
//// Sent to the delegate when the sign up screen is dismissed.
//- (void)signUpViewControllerDidCancelSignUp:(PFSignUpViewController *)signUpController {
//    NSLog(@"User dismissed the signUpViewController");
//    [self.navigationController popViewControllerAnimated:YES];
//    
//}



@end
