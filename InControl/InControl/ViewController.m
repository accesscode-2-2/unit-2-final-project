//
//  ViewController.m
//  InControl
//
//  Created by Diana Elezaj on 10/11/15.
//  Copyright © 2015 Diana Elezaj. All rights reserved.
//

#import "ViewController.h"
#import "FoodViewController.h"
#import "HotelViewController.h"
#import "ImageTableViewController.h"
#import "VideoViewController.h"
#import "MeetupTableViewController.h"
#import "InstaTableViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIButton *goButton;
@property (weak, nonatomic) IBOutlet UIView *budgetView;
@property (nonatomic, strong) NSMutableIndexSet *optionIndices;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.searchBar.hidden = YES;
    self.goButton.hidden = YES;
    self.budgetView.hidden = YES;
    
    UIGraphicsBeginImageContext(self.view.frame.size);
    [[UIImage imageNamed:@"newBackOk"] drawInRect:self.view.bounds];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:image];
    
    self.optionIndices = [NSMutableIndexSet indexSetWithIndex:1];
}


- (IBAction)goButton:(id)sender {
    [self ShowMenu];
    self.goButton.hidden = YES;
    self.searchBar.hidden = YES;
    [self.view endEditing:YES];
    
    //save user's input
    NSString *saveString = self.searchBar.text;
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:saveString forKey:@"savedString"];
    [defaults synchronize];
}

- (IBAction)onBurger:(id)sender {
    self.budgetView.hidden = YES;
    [self ShowMenu];
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *loadString =  [defaults objectForKey:@"savedString"];
    [self.searchBar setText:loadString];
    NSLog(@"will appear search bar %@",self.searchBar.text);
    
}

-(void) ShowMenu {
    
    NSArray *images = @[
                        [UIImage imageNamed:@"search"],
                        [UIImage imageNamed:@"budget"],
                        [UIImage imageNamed:@"food"],
                        [UIImage imageNamed:@"hotel"],
                        [UIImage imageNamed:@"image"],
                        [UIImage imageNamed:@"video"],
                        [UIImage imageNamed:@"insta"],
                        [UIImage imageNamed:@"meetup"],
//                        [UIImage imageNamed:@"star"],
//                        [UIImage imageNamed:@"star"],
//                        [UIImage imageNamed:@"star"],
//                        [UIImage imageNamed:@"star"],
                        ];
    NSArray *colors = @[
                        [UIColor colorWithRed:240/255.f green:159/255.f blue:254/255.f alpha:1],
                        [UIColor colorWithRed:255/255.f green:137/255.f blue:167/255.f alpha:1],
                        [UIColor colorWithRed:126/255.f green:242/255.f blue:195/255.f alpha:1],
                        [UIColor colorWithRed:119/255.f green:152/255.f blue:255/255.f alpha:1],
                        [UIColor colorWithRed:240/255.f green:159/255.f blue:254/255.f alpha:1],
                        [UIColor colorWithRed:255/255.f green:137/255.f blue:167/255.f alpha:1],
                        [UIColor colorWithRed:126/255.f green:242/255.f blue:195/255.f alpha:1],
                        [UIColor colorWithRed:119/255.f green:152/255.f blue:255/255.f alpha:1],
//                        [UIColor colorWithRed:240/255.f green:159/255.f blue:254/255.f alpha:1],
//                        [UIColor colorWithRed:255/255.f green:137/255.f blue:167/255.f alpha:1],
//                        [UIColor colorWithRed:126/255.f green:242/255.f blue:195/255.f alpha:1],
//                        [UIColor colorWithRed:119/255.f green:152/255.f blue:255/255.f alpha:1],
                        ];
    
    RNFrostedSidebar *callout = [[RNFrostedSidebar alloc] initWithImages:images selectedIndices:self.optionIndices borderColors:colors];
    //        RNFrostedSidebar *callout = [[RNFrostedSidebar alloc] initWithImages:images];
    callout.delegate = self;
    //    callout.showFromRight = YES;
    [callout show];
}

#pragma mark - RNFrostedSidebarDelegate

- (void)sidebar:(RNFrostedSidebar *)sidebar didTapItemAtIndex:(NSUInteger)index {
    NSLog(@"Tapped item at index %lu",(unsigned long)index);
    if (index == 0) { //search Bar
        
        self.searchBar.hidden = NO;
        self.goButton.hidden = NO;
        [sidebar dismissAnimated:YES completion:nil];
        
    }
    
    if (index == 1) { //budget
        
        if ([self.searchBar.text isEqualToString:@""]) {
            [self EmptySearchBarAlert];
        }
        else {
            
            NSString *url = [NSString stringWithFormat:@"http://www.budgetyourtrip.com/united-states-of-america/%@", self.searchBar.text];
            
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:url]];
            self.budgetView.hidden = YES;
            [sidebar dismissAnimated:YES completion:nil];
        }
    }
    if (index == 2) { //food
        
        if ([self.searchBar.text isEqualToString:@""]) {
            [self EmptySearchBarAlert];
        }
        else {
            FoodViewController * vc = [self.storyboard instantiateViewControllerWithIdentifier:@"FoodID"];
            vc.city = self.searchBar.text;
            [self presentViewController:vc animated:YES completion:nil];
            [sidebar dismissAnimated:YES completion:^(BOOL finished) {
                
            }];
        }
    }
    if (index == 3) { //hotel
        
        if ([self.searchBar.text isEqualToString:@""]) {
            [self EmptySearchBarAlert];
        }
        else {
            HotelViewController * vc = [self.storyboard instantiateViewControllerWithIdentifier:@"HotelID"];
            vc.city = self.searchBar.text;
            [self presentViewController:vc animated:YES completion:nil];
            [sidebar dismissAnimated:YES completion:^(BOOL finished) {
            }];
        }
    }
    if (index == 4) { //image
        if ([self.searchBar.text isEqualToString:@""]) {
            [self EmptySearchBarAlert];
        }
        else {
            ImageTableViewController * vc = [self.storyboard instantiateViewControllerWithIdentifier:@"ImageID"];
            UINavigationController *nc = [[UINavigationController alloc] initWithRootViewController:vc];
            vc.city = self.searchBar.text;

            [self presentViewController:nc animated:YES completion:nil];
            
            [sidebar dismissAnimated:YES completion:^(BOOL finished) {
            }];
        }
    }
    if (index == 5) { //video
        if ([self.searchBar.text isEqualToString:@""]) {
            [self EmptySearchBarAlert];
        }
        else {
            
            VideoViewController * vc = [self.storyboard instantiateViewControllerWithIdentifier:@"VideoID"];
           
            vc.city = self.searchBar.text;
            
            [self presentViewController:vc animated:YES completion:nil];
            
            [sidebar dismissAnimated:YES completion:^(BOOL finished) {
            }];
        }
    }
    if (index == 6) { //insta
        if ([self.searchBar.text isEqualToString:@""]) {
            [self EmptySearchBarAlert];
        }
        else {
            
            InstaTableViewController * vc = [self.storyboard instantiateViewControllerWithIdentifier:@"InstaID"];
             UINavigationController *nc = [[UINavigationController alloc] initWithRootViewController:vc];
            vc.city = self.searchBar.text;
            
            [self presentViewController:nc animated:YES completion:nil];
            
            [sidebar dismissAnimated:YES completion:^(BOOL finished) {
            }];
        }
    }
    if (index == 7) { //meetup
        if ([self.searchBar.text isEqualToString:@""]) {
            [self EmptySearchBarAlert];
        }
        else {
            
            MeetupTableViewController * vc = [self.storyboard instantiateViewControllerWithIdentifier:@"MeetupID"];
            UINavigationController *nc = [[UINavigationController alloc] initWithRootViewController:vc];

            vc.city = self.searchBar.text;
            
            [self presentViewController:nc animated:YES completion:nil];
            
            [sidebar dismissAnimated:YES completion:^(BOOL finished) {
            }];
        }
    }

}

-(void) EmptySearchBarAlert {
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"NEW TRIP ? ✈️" message:@"Please tell me your next destination! 😉 " preferredStyle: UIAlertControllerStyleAlert];
    
    UIAlertAction *okAction = [UIAlertAction
                               actionWithTitle:NSLocalizedString(@"OK", @"OK action")
                               style:UIAlertActionStyleDefault
                               handler:^(UIAlertAction *action)
                               {
                                   NSLog(@"OK action");
                               }];
    
    [alert addAction:okAction];
    [self presentViewController:alert animated:YES completion:nil];
}


- (IBAction)budgetViewButton:(id)sender {
    self.budgetView.hidden=YES;
    [self ShowMenu];
}




- (void)sidebar:(RNFrostedSidebar *)sidebar didEnable:(BOOL)itemEnabled itemAtIndex:(NSUInteger)index {
    if (itemEnabled) {
        [self.optionIndices addIndex:index];
        NSLog(@"something");
    }
    else {
        [self.optionIndices removeIndex:index];
        NSLog(@"else");
        
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
