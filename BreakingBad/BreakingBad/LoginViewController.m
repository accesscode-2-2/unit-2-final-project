//
//  LoginViewController.m
//  BreakingBad
//
//  Created by Mesfin Bekele Mekonnen on 10/15/15.
//  Copyright © 2015 Zoufishan Mehdi. All rights reserved.
//

#import "LoginViewController.h"
#import "MainPageVC.h"
#import "ViewController.h"
#import "SignUpViewController.h"

@implementation LoginViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // [self.logInView setLogo:[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"drugs"]]];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    [self.usernameTextField resignFirstResponder];
    [self.passwordTextField resignFirstResponder];
}
//
////- (void)viewDidAppear:(BOOL)animated
////{
////    [super viewDidAppear:animated];
////
////    if (![PFUser currentUser])
////    { // No user logged in
////        // Create the log in view controller
////        PFLogInViewController *logInViewController = [[PFLogInViewController alloc] init];
////        [logInViewController setDelegate:self]; // Set ourselves as the delegate
////
////        // Create the sign up view controller
////        SignUpViewController *signUpViewController = [[SignUpViewController alloc] init];
////        [signUpViewController setDelegate:self]; // Set ourselves as the delegate
////
////        // Assign our sign up controller to be displayed from the login controller
////        [logInViewController setSignUpController:signUpViewController];
////
////        // Present the log in view controller
////        [self presentViewController:logInViewController animated:YES completion:NULL];
////    }
////}
//
//#pragma mark
//#pragma PFLoginViewController Delegate
//
//// Sent to the delegate to determine whether the log in request should be submitted to the server.
//- (BOOL)logInViewController:(PFLogInViewController *)logInController shouldBeginLogInWithUsername:(NSString *)username password:(NSString *)password
//{
//    // Check if both fields are completed
//    if (username && password && username.length != 0 && password.length != 0)
//    {
//        return YES; // Begin login process
//    }
//    
//    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Missing Information" message:@"Make sure you fill out all of the information!" preferredStyle:UIAlertControllerStyleAlert];
//    
//    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action)
//                               {
//                                   [alertController dismissViewControllerAnimated:YES completion:nil];
//                               }];
//    
//    [alertController addAction:okAction];
//    
//    [self presentViewController:alertController animated:YES completion:nil];
//    return NO; // Interrupt login process
//}

// Sent to the delegate when a PFUser is logged in.
- (IBAction)loginButtonTapped:(UIButton *)sender
{
    NSString *password = self.passwordTextField.text;
    NSString *username = self.usernameTextField.text;
    
    if ((username && username.length) && (password && password.length))
    {
        PFUser *thisUser = [PFUser user];
        
        thisUser.username = username;
        thisUser.password = password;
        
        [PFUser logInWithUsernameInBackground:thisUser.username password:thisUser.password block:^(PFUser * _Nullable user, NSError * _Nullable error) {
            MainPageVC *mvc = (MainPageVC *)[self.storyboard instantiateViewControllerWithIdentifier:@"showMainPgVC"];
            [self presentViewController:mvc animated:YES completion:nil];
        }];
    }
    else
    {
        
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Error" message:@"The password field is either empty or does not match the confirm password field" preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [alertController dismissViewControllerAnimated:YES completion:nil];
        }];
        
        [alertController addAction:okAction];
        
        [self presentViewController:alertController animated:YES completion:nil];
    }
    
}

//-(void)logInViewController:(PFLogInViewController *)logInController didLogInUser:(PFUser *)user
//{
//    MainPageVC *mvc = (MainPageVC *)[self.storyboard instantiateViewControllerWithIdentifier:@"showMainPgVC"];
//    [self presentViewController:mvc animated:YES completion:nil];
//    [self dismissViewControllerAnimated:YES completion:NULL];
//}
//
//// Sent to the delegate when the log in attempt fails.
//- (void)logInViewController:(PFLogInViewController *)logInController didFailToLogInWithError:(NSError *)error
//{
//    NSLog(@"Failed to log in because of error %@", error.localizedDescription);
//}
//
//// Sent to the delegate when the log in screen is dismissed.
//- (void)logInViewControllerDidCancelLogIn:(PFLogInViewController *)logInController {
//    //    ViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"ViewControllerID"];
//    //    [self presentViewController:vc animated:YES completion:nil];
//    
//    [self.navigationController popViewControllerAnimated:YES];
//#warning not going back to View Controller currently
//}



@end
