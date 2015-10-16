//
//  CustomModalViewController.m
//  BreakingBad
//
//  Created by Zoufishan Mehdi on 10/11/15.
//  Copyright © 2015 Zoufishan Mehdi. All rights reserved.
//

#import "CustomModalViewController.h"
#import <Parse/Parse.h>
#import "MainPageVC.h"
#import "LoginViewController.h"
#import "ViewController.h"
#import "SharedManager.h"

@implementation CustomModalViewController

#pragma mark
#pragma LifeCycle Methods

//- (void)viewDidAppear:(BOOL)animated {
//    [super viewDidAppear:animated];
//    
//    // Check if user is logged in
//    if (![PFUser currentUser]) {
//        // Instantiate our custom log in view controller
//        LoginViewController *logInViewController = [[LoginViewController alloc] init];
//        [logInViewController setDelegate:self];
//        [logInViewController setFacebookPermissions:[NSArray arrayWithObjects:@"friends_about_me", nil]];
//        [logInViewController setFields:PFLogInFieldsUsernameAndPassword
//         | PFLogInFieldsSignUpButton
//         | PFLogInFieldsDismissButton];
//        
//        // Instantiate our custom sign up view controller
//        CustomModalViewController *signUpViewController = [[CustomModalViewController alloc] init];
//        [signUpViewController setDelegate:self];
//        [signUpViewController setFields:PFSignUpFieldsDefault | PFSignUpFieldsAdditional];
//        
//        // Link the sign up view controller
//        [logInViewController setSignUpController:signUpViewController];
//        
//        // Present log in view controller
//        [self presentViewController:logInViewController animated:YES completion:NULL];
//    }
//}
//
//- (void)viewDidLoad{
//    [super viewDidLoad];
//}

- (IBAction)cancelButtonTapped:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)signUpButtonTapped:(UIButton *)sender {
    
    PFUser *thisUser = [PFUser user];
    if(![[thisUser objectForKey:@"emailVerified"] boolValue]){
        [thisUser fetch];
    }
    
    if ([self.passwordTextField.text isEqualToString:self.confirmPasswordTextField.text] && self.passwordTextField.text.length !=0) {
        PFUser *thisUser = [PFUser user];
        thisUser.email = self.emailTextField.text;
        thisUser.username = self.usernameTextField.text;
        thisUser.password = self.passwordTextField.text;
        
        [thisUser signUpInBackgroundWithBlock:^(BOOL succeeded, NSError * _Nullable error) {
            
            [[SharedManager sharedModel].currentUser saveInBackground];
            
            MainPageVC *mvc = (MainPageVC *)[self.storyboard instantiateViewControllerWithIdentifier:@"showMainPgVC"];
            [self presentViewController:mvc animated:YES completion:nil];
        }];
        
        
    } else {
        
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Error" message:@"The password field is either empty or does not match the confirm password field" preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [alertController dismissViewControllerAnimated:YES completion:nil];
        }];
        
        [alertController addAction:okAction];
        
        [self presentViewController:alertController animated:YES completion:nil];
    }
    
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    [self.emailTextField resignFirstResponder];
    [self.usernameTextField resignFirstResponder];
    [self.passwordTextField resignFirstResponder];
    [self.confirmPasswordTextField resignFirstResponder];
}



@end
