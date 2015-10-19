//
//  ViewCompletedEntryViewController.m
//  Unit-2-Journal
//
//  Created by Shena Yoshida on 10/10/15.
//  Copyright © 2015 Jamaal Sedayao. All rights reserved.
//

#import "ViewCompletedEntryViewController.h"

@interface ViewCompletedEntryViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *completedImageView;
@property (weak, nonatomic) IBOutlet UILabel *completedTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *completedCreatorLabel;
@property (weak, nonatomic) IBOutlet UILabel *completedDateLabel; // review written on
@property (weak, nonatomic) IBOutlet UITextView *completedReviewTextView;

@property (weak, nonatomic) IBOutlet UIButton *starOne;
@property (weak, nonatomic) IBOutlet UIButton *starTwo;
@property (weak, nonatomic) IBOutlet UIButton *starThree;
@property (weak, nonatomic) IBOutlet UIButton *starFour;
@property (weak, nonatomic) IBOutlet UIButton *starFive;


@end

@implementation ViewCompletedEntryViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    
    self.completedTitleLabel.text = self.journalPostDetail.title;
    self.completedCreatorLabel.text = self.journalPostDetail.creator;
    self.completedReviewTextView.text = self.journalPostDetail.postText;
    
    NSLog(@"stars: %@", self.journalPostDetail.starRating);
    
    // convert date to readable format
    NSDate *now = self.journalPostDetail.dateEntered;
    NSCalendar *calendar = [[NSCalendar alloc]
                            initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSCalendarUnit units = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay;
    NSDateComponents *components = [calendar components:units fromDate:now];
    
    self.completedDateLabel.text = [NSString stringWithFormat:@"Entry Date: %ld/%ld/%ld", (long)components.month, (long)components.day, (long)components.year]; // set date text
    
    NSURL *imageURL = [NSURL URLWithString:self.journalPostDetail.imageForMedia];
    NSData *imageData = [NSData dataWithContentsOfURL:imageURL];
    UIImage *image = [UIImage imageWithData:imageData];
    
    self.completedImageView.image = image;
    
    // round corners
    self.completedImageView.clipsToBounds = YES;
    self.completedImageView.layer.borderColor = [UIColor blackColor].CGColor;
    self.completedImageView.layer.borderWidth = 2.0;
    self.completedImageView.layer.cornerRadius = 30.0;
    
    [self setupStars];
}

#pragma mark - stars

- (void)setupStars {
    
    if ([self.journalPostDetail.starRating isEqual:@1]) {
        [self.starOne setBackgroundImage:[UIImage imageNamed:@"rating_star_filled.png"] forState:UIControlStateNormal];
        [self.starTwo setBackgroundImage:[UIImage imageNamed:@"rating_star.png"] forState:UIControlStateNormal];
        [self.starThree setBackgroundImage:[UIImage imageNamed:@"rating_star.png"] forState:UIControlStateNormal];
        [self.starFour setBackgroundImage:[UIImage imageNamed:@"rating_star.png"] forState:UIControlStateNormal];
        [self.starFive setBackgroundImage:[UIImage imageNamed:@"rating_star.png"] forState:UIControlStateNormal];
    }
    
    else if ([self.journalPostDetail.starRating isEqual:@2]) {
        [self.starOne setBackgroundImage:[UIImage imageNamed:@"rating_star_filled.png"] forState:UIControlStateNormal];
        [self.starTwo setBackgroundImage:[UIImage imageNamed:@"rating_star_filled.png"] forState:UIControlStateNormal];
        [self.starThree setBackgroundImage:[UIImage imageNamed:@"rating_star.png"] forState:UIControlStateNormal];
        [self.starFour setBackgroundImage:[UIImage imageNamed:@"rating_star.png"] forState:UIControlStateNormal];
        [self.starFive setBackgroundImage:[UIImage imageNamed:@"rating_star.png"] forState:UIControlStateNormal];
    }
    else if ([self.journalPostDetail.starRating isEqual:@3]) {
        [self.starOne setBackgroundImage:[UIImage imageNamed:@"rating_star_filled.png"] forState:UIControlStateNormal];
        [self.starTwo setBackgroundImage:[UIImage imageNamed:@"rating_star_filled.png"] forState:UIControlStateNormal];
        [self.starThree setBackgroundImage:[UIImage imageNamed:@"rating_star_filled.png"] forState:UIControlStateNormal];
        [self.starFour setBackgroundImage:[UIImage imageNamed:@"rating_star.png"] forState:UIControlStateNormal];
        [self.starFive setBackgroundImage:[UIImage imageNamed:@"rating_star.png"] forState:UIControlStateNormal];
    }
    else if ([self.journalPostDetail.starRating isEqual:@4]) {
        [self.starOne setBackgroundImage:[UIImage imageNamed:@"rating_star_filled.png"] forState:UIControlStateNormal];
        [self.starTwo setBackgroundImage:[UIImage imageNamed:@"rating_star_filled.png"] forState:UIControlStateNormal];
        [self.starThree setBackgroundImage:[UIImage imageNamed:@"rating_star_filled.png"] forState:UIControlStateNormal];
        [self.starFour setBackgroundImage:[UIImage imageNamed:@"rating_star_filled.png"] forState:UIControlStateNormal];
        [self.starFive setBackgroundImage:[UIImage imageNamed:@"rating_star.png"] forState:UIControlStateNormal];
    }
    else if ([self.journalPostDetail.starRating isEqual:@5]) {
        [self.starOne setBackgroundImage:[UIImage imageNamed:@"rating_star_filled.png"] forState:UIControlStateNormal];
        [self.starTwo setBackgroundImage:[UIImage imageNamed:@"rating_star_filled.png"] forState:UIControlStateNormal];
        [self.starThree setBackgroundImage:[UIImage imageNamed:@"rating_star_filled.png"] forState:UIControlStateNormal];
        [self.starFour setBackgroundImage:[UIImage imageNamed:@"rating_star_filled.png"] forState:UIControlStateNormal];
        [self.starFive setBackgroundImage:[UIImage imageNamed:@"rating_star_filled.png"] forState:UIControlStateNormal];
    }
}

#pragma mark - delete item

- (IBAction)deleteButtonTapped:(id)sender
{
    // delete item from memory and storyboard
    
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
