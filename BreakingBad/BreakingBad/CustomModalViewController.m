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

@implementation CustomModalViewController


- (IBAction)didClickClose:(id)sender {
    
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
            //add segue
        }];
        MainPageVC *mvc = (MainPageVC *)[self.storyboard instantiateViewControllerWithIdentifier:@"showMainPgVC"];
        [self presentViewController:mvc animated:YES completion:nil];
         //[self dismissViewControllerAnimated:YES completion:nil];
       
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
    
    //[self.emailTextField endEditing:YES];
    //        [self.usernameTextField endEditing:YES];
    //        [self.passwordTextField endEditing:YES];
    //        [self.confirmPasswordTextField endEditing:YES];
    
}


@end
