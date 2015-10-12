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
#import <pop/POP.h>

@implementation CustomVCTransitionViewController

- (IBAction)didClickEnter:(id)sender {
    CustomModalViewController *modalVC = [self.storyboard instantiateViewControllerWithIdentifier:@"customModal"];
    
    
    modalVC.transitioningDelegate = self;
    
    modalVC.modalPresentationStyle = UIModalPresentationCustom;
    
    [self presentViewController:modalVC animated:YES completion:nil];
}



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
