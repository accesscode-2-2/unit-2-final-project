//
//  CustomModalViewController.m
//  BreakingBad
//
//  Created by Zoufishan Mehdi on 10/11/15.
//  Copyright © 2015 Zoufishan Mehdi. All rights reserved.
//

#import "CustomModalViewController.h"
#import <Parse/Parse.h>

@implementation CustomModalViewController


- (IBAction)didClickClose:(id)sender {
    
    if ([self.passwordTextField isEqual:self.confirmPasswordTextField]) {
        PFUser *thisUser = [PFUser user];
        thisUser.email = self.emailTextField.text;
        thisUser.username = self.usernameTextField.text;
        thisUser.password = self.passwordTextField.text;
        
        [thisUser signUpInBackgroundWithBlock:^(BOOL succeeded, NSError * _Nullable error) {
            //add segue here
        }];
        
    } else {
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"The two password you entered do not match" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        
        [alert show];
        
    }
    
   [self dismissViewControllerAnimated:YES completion:nil];
    
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
