//
//  LatAndLngViewController.m
//  InControl
//
//  Created by Artur Lan on 10/20/15.
//  Copyright © 2015 Diana Elezaj. All rights reserved.
//

#import "LatAndLngViewController.h"

@interface LatAndLngViewController ()

@end

@implementation LatAndLngViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)save:(UIBarButtonItem *)saveButton{
    NSLog(@"kjhkjhkjhkjhkjhkh");
}
- (void)cancel:(UIBarButtonItem *)cancelButton{
    [self.navigationController popViewControllerAnimated:YES];
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
