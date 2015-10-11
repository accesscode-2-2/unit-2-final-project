//
//  SearchAPIViewController.m
//  Unit-2-Journal
//
//  Created by Shena Yoshida on 10/10/15.
//  Copyright © 2015 Jamaal Sedayao. All rights reserved.
//

#import "SearchAPIViewController.h"

@interface SearchAPIViewController ()

@property (weak, nonatomic) IBOutlet UITextField *searchTextField;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIButton *musicButton;
@property (weak, nonatomic) IBOutlet UIButton *moviesButton;
@property (weak, nonatomic) IBOutlet UIButton *booksButton;
@property (weak, nonatomic) IBOutlet UIButton *otherButton;

@end

@implementation SearchAPIViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setUpSwipeGestures];
}

#pragma mark - setup swipe gestures

- (void)setUpSwipeGestures
{
//    UISwipeGestureRecognizer *swipeLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(userSwipedLeft:)];
//    swipeLeft.direction = UISwipeGestureRecognizerDirectionLeft;
//    [self.view addGestureRecognizer:swipeLeft];
    
    UISwipeGestureRecognizer *swipeRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(userSwipedRight:)];
    swipeRight.direction = UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:swipeRight];
}

//- (void)userSwipedLeft:(UISwipeGestureRecognizer*)swipe
//{
//    if (swipe.direction == UISwipeGestureRecognizerDirectionLeft) {
//        [self performSegueWithIdentifier:@"pushToSearch" sender:self];
//    }
//}

- (void)userSwipedRight:(UISwipeGestureRecognizer*)swipe
{
    if (swipe.direction == UISwipeGestureRecognizerDirectionRight) {
        [self performSegueWithIdentifier:@"pushToJournalFromSearch" sender:self];
    }
}

#pragma mark - setup buttons

- (IBAction)mediaButtonTypeSelected:(id)sender {
}

- (IBAction)mediaButtonOther:(id)sender {
}

- (IBAction)createJournalEntryButtonTapped:(id)sender {
}

- (IBAction)addToWishListButtonTapped:(id)sender {
}

@end
