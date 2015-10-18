//
//  DetailVisitedViewController.m
//  InControl
//
//  Created by Xiulan Shi on 10/16/15.
//  Copyright © 2015 Diana Elezaj. All rights reserved.
//

#import "DetailVisitedViewController.h"

@interface DetailVisitedViewController ()
@property (weak, nonatomic) IBOutlet UILabel *cityLabel;
@property (weak, nonatomic) IBOutlet UILabel *rateLabel;
@property (weak, nonatomic) IBOutlet UILabel *impressionLabel;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation DetailVisitedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self setupNavigationBar];
    self.cityLabel.text = self.city.name;
    self.rateLabel.text = [NSString stringWithFormat:@"%@", self.city.rate];
    self.impressionLabel.text = self.city.impression;
    self.imageView.image = [UIImage imageWithData:self.city.photo];
    
}

//- (void)setupNavigationBar {
//    
//    [self.navigationItem setTitle:@"Detailed Visited City"];
//    
//    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(cancel)];

//    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(save)];
//}
//
//- (void)cancel {
//    [self dismissViewControllerAnimated:YES completion:nil];
//}
//

@end
