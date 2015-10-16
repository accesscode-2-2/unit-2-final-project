//
//  LoginViewController.h
//  BreakingBad
//
//  Created by Mesfin Bekele Mekonnen on 10/15/15.
//  Copyright © 2015 Zoufishan Mehdi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <ParseUI/ParseUI.h>
#import <Parse/Parse.h>

@interface LoginViewController : PFLogInViewController
<
PFSignUpViewControllerDelegate,
PFLogInViewControllerDelegate
>
@property (weak, nonatomic) IBOutlet UITextField *usernameTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;

@end
