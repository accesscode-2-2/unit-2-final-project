//
//  AddVisitedViewController.m
//  InControl
//
//  Created by Xiulan Shi on 10/16/15.
//  Copyright © 2015 Diana Elezaj. All rights reserved.
//

#import <CoreData/CoreData.h>
#import "AppDelegate.h"
#import "City.h"
#import "AddVisitedViewController.h"
#import "Photo.h"
#import "Photo+CoreDataProperties.h"

@interface AddVisitedViewController ()
@property (weak, nonatomic) IBOutlet UITextField *cityTextField;
@property (weak, nonatomic) IBOutlet UITextField *impressionTextField;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIButton *rate1Button;
@property (weak, nonatomic) IBOutlet UIButton *rate2Button;
@property (weak, nonatomic) IBOutlet UIButton *rate3Button;
@property (weak, nonatomic) IBOutlet UIButton *rate4Button;
@property (weak, nonatomic) IBOutlet UIButton *rate5Button;
@property (nonatomic) NSNumber *rateSelected;
@property (nonatomic) UIImage *whiteStarBackground;
@property (nonatomic) UIImage *yellowStarBackground;


@property (nonatomic) UIImagePickerController *picker;
@property (nonatomic) UIImagePickerController *picker2;
@property (nonatomic) UIImage *image;

@property (nonatomic) NSMutableArray *photos;

@property (nonatomic) Photo *photo;

@end

@implementation AddVisitedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if (!self.photos) {
        self.photos = [NSMutableArray new];
    }
    
    self.whiteStarBackground = [UIImage imageNamed:@"WhiteStar"];
    self.yellowStarBackground = [UIImage imageNamed:@"YellowStar"];
    self.rateSelected = @1;

    [self setupNavigationBar];
    
    AppDelegate *delegate = [UIApplication sharedApplication].delegate;
    
    self.city = [NSEntityDescription insertNewObjectForEntityForName:@"City" inManagedObjectContext:delegate.managedObjectContext];
    
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES ];
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"cc"]];

}

- (void)setupNavigationBar {
    
    self.navigationItem.title = @"Create New Visited City";
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(cancel)];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(save)];
}

- (void)cancel {
    AppDelegate *delegate = [UIApplication sharedApplication].delegate;
    [delegate.managedObjectContext deleteObject:self.city];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)save {
    self.city.name = self.cityTextField.text;
    
    NSNumberFormatter *f = [[NSNumberFormatter alloc] init];
    f.numberStyle = NSNumberFormatterDecimalStyle;
    self.city.rate = self.rateSelected;
    
    self.city.impression = self.impressionTextField.text;
    
    self.city.photos = [NSOrderedSet orderedSetWithArray:self.photos];
    
    AppDelegate *delegate = [UIApplication sharedApplication].delegate;
    [delegate.managedObjectContext save:nil];
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

- (IBAction)chooseExistingButtonTapped:(id)sender {
    
    self.picker2 = [[UIImagePickerController alloc] init];
    self.picker2.delegate = self;
    [self.picker2 setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
    [self presentViewController:self.picker2 animated:YES completion:NULL];

}

- (IBAction)takePhotoButtonTapped:(id)sender {
    
    self.picker = [[UIImagePickerController alloc] init];
    self.picker.delegate = self;
    [self.picker setSourceType:UIImagePickerControllerSourceTypeCamera];
    [self presentViewController:self.picker animated:YES completion:NULL];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    
    AppDelegate *delegate = [UIApplication sharedApplication].delegate;
    Photo *newPhoto = [NSEntityDescription insertNewObjectForEntityForName:@"Photo" inManagedObjectContext:delegate.managedObjectContext];
    
    
    self.image = [info objectForKey:UIImagePickerControllerOriginalImage];
    [self.imageView setImage:self.image];
    newPhoto.imageData = UIImagePNGRepresentation (self.image);
    [self.photos addObject:newPhoto];
    
    [self dismissViewControllerAnimated:YES completion:NULL];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [self dismissViewControllerAnimated:YES completion:NULL];
}



- (IBAction)rate1Selected:(UIButton *)sender {
    self.rateSelected = @1;
    [self.rate1Button setBackgroundImage:self.yellowStarBackground forState:UIControlStateNormal];
    [self.rate2Button setBackgroundImage:self.whiteStarBackground forState:UIControlStateNormal];
    [self.rate3Button setBackgroundImage:self.whiteStarBackground forState:UIControlStateNormal];
    [self.rate4Button setBackgroundImage:self.whiteStarBackground forState:UIControlStateNormal];
    [self.rate5Button setBackgroundImage:self.whiteStarBackground forState:UIControlStateNormal];
}
- (IBAction)rate2Selected:(UIButton *)sender {
    self.rateSelected = @2;
    [self.rate1Button setBackgroundImage:self.yellowStarBackground forState:UIControlStateNormal];
    [self.rate2Button setBackgroundImage:self.yellowStarBackground forState:UIControlStateNormal];
    [self.rate3Button setBackgroundImage:self.whiteStarBackground forState:UIControlStateNormal];
    [self.rate4Button setBackgroundImage:self.whiteStarBackground forState:UIControlStateNormal];
    [self.rate5Button setBackgroundImage:self.whiteStarBackground forState:UIControlStateNormal];
}
- (IBAction)rate3Selected:(UIButton *)sender {
    self.rateSelected = @3;
    [self.rate1Button setBackgroundImage:self.yellowStarBackground forState:UIControlStateNormal];
    [self.rate2Button setBackgroundImage:self.yellowStarBackground forState:UIControlStateNormal];
    [self.rate3Button setBackgroundImage:self.yellowStarBackground forState:UIControlStateNormal];
    [self.rate4Button setBackgroundImage:self.whiteStarBackground forState:UIControlStateNormal];
    [self.rate5Button setBackgroundImage:self.whiteStarBackground forState:UIControlStateNormal];
}
- (IBAction)rate4Selected:(UIButton *)sender {
    self.rateSelected = @4;
    [self.rate1Button setBackgroundImage:self.yellowStarBackground forState:UIControlStateNormal];
    [self.rate2Button setBackgroundImage:self.yellowStarBackground forState:UIControlStateNormal];
    [self.rate3Button setBackgroundImage:self.yellowStarBackground forState:UIControlStateNormal];
    [self.rate4Button setBackgroundImage:self.yellowStarBackground forState:UIControlStateNormal];
    [self.rate5Button setBackgroundImage:self.whiteStarBackground forState:UIControlStateNormal];
}
- (IBAction)rate5Selected:(UIButton *)sender {
    self.rateSelected = @5;
    [self.rate1Button setBackgroundImage:self.yellowStarBackground forState:UIControlStateNormal];
    [self.rate2Button setBackgroundImage:self.yellowStarBackground forState:UIControlStateNormal];
    [self.rate3Button setBackgroundImage:self.yellowStarBackground forState:UIControlStateNormal];
    [self.rate4Button setBackgroundImage:self.yellowStarBackground forState:UIControlStateNormal];
    [self.rate5Button setBackgroundImage:self.yellowStarBackground forState:UIControlStateNormal];
}





@end
