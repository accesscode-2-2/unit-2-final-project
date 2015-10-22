//
//  CustomVCTransitionViewController.m
//  BreakingBad
//
//  Created by Zoufishan Mehdi on 10/11/15.
//  Copyright © 2015 Zoufishan Mehdi. All rights reserved.
//

#import "CustomVCTransitionViewController.h"
#import "CustomModalViewController.h"
#import "PresentingAnimationController.h"
#import "DismissingAnimationController.h"
#import "LoginViewController.h"
#import "LoginViewController.h"
#import "SignUpViewController.h"
#import <pop/POP.h>
#import "SharedManager.h"

@implementation CustomVCTransitionViewController

-(void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [SharedManager sharedModel].brickRed;
    
    
     [self performSelector:@selector(threeSecondDelay) withObject:self afterDelay:0.4];

}


- (void)threeSecondDelay {
    
     CustomModalViewController *modalVC = [self.storyboard instantiateViewControllerWithIdentifier:@"customModal"];
    
    modalVC.transitioningDelegate = self;

    modalVC.modalPresentationStyle = UIModalPresentationCustom;

    [self presentViewController:modalVC animated:YES completion:nil];

}



//- (IBAction)didClickEnter:(id)sender {
//        CustomModalViewController *modalVC = [self.storyboard instantiateViewControllerWithIdentifier:@"customModal"];
//    
//    
//        modalVC.transitioningDelegate = self;
//    
//        modalVC.modalPresentationStyle = UIModalPresentationCustom;
//    
//        [self presentViewController:modalVC animated:YES completion:nil];
//    
    //    LoginViewController *lvc = [self.storyboard instantiateViewControllerWithIdentifier:@"loginVC"];
    //    lvc.transitioningDelegate = self;
    //    lvc.modalPresentationStyle = UIModalPresentationCustom;
    //    [self presentViewController:lvc animated:YES completion:nil];
    
    //    if (![PFUser currentUser])
    //           { // No user logged in
    //                // Create the log in view controller
    //                LoginViewController *logInViewController = [[LoginViewController alloc] init];
    //                [logInViewController setDelegate:self]; // Set ourselves as the delegate
    //               logInViewController.transitioningDelegate = self;
    //               logInViewController.modalPresentationStyle = UIModalPresentationCustom;
    //                // Create the sign up view controller
    //                SignUpViewController *signUpViewController = [[SignUpViewController alloc] init];
    //                [signUpViewController setDelegate:self]; // Set ourselves as the delegate
    //
    //                // Assign our sign up controller to be displayed from the login contr   oller
    //                [logInViewController setSignUpController:signUpViewController];
    //
    //                // Present the log in view controller
    //                [self presentViewController:logInViewController animated:YES completion:NULL];
    //            }
    
//}

//-(void)viewWillAppear:(BOOL)animated{
//    [super viewWillAppear:animated];
//    LoginViewController *lvc = [self.storyboard instantiateViewControllerWithIdentifier:@"loginVC"];
//    lvc.transitioningDelegate = self;
//    lvc.modalPresentationStyle = UIModalPresentationCustom;
//    [self presentViewController:lvc animated:YES completion:nil];
//}




#pragma mark - UIViewControllerTransitionDelegate -

- (id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
{
    return [[PresentingAnimationController alloc] init];
}

- (id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
    return [[DismissingAnimationController alloc] init];
}

@end
