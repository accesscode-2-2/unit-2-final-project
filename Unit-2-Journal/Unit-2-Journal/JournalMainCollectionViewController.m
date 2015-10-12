//
//  JournalMainCollectionViewController.m
//  Unit-2-Journal
//
//  Created by Shena Yoshida on 10/10/15.
//  Copyright © 2015 Jamaal Sedayao. All rights reserved.
//

#import "JournalMainCollectionViewController.h"

@interface JournalMainCollectionViewController ()

@end

@implementation JournalMainCollectionViewController

//static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    if (self.allJournalPosts == nil){
   self.allJournalPosts = [[NSMutableArray alloc]init];
    } else {
        nil;
    }
    
     NSLog(@"All Journal Posts: %@", self.allJournalPosts);
    
    collectionImages = [NSMutableArray arrayWithObjects:@"destroyer.png", @"drake.png", @"big_nerd_ranch.png", @"talking_heads.png", @"true_detective", @"sleater_kinney.png", @"x-files.png", @"run_the_jewels.png", @"lean_startup.png", nil];
    
    //[self setUpSwipeGestures];
    
    self.collectionView.alwaysBounceVertical = YES;
    
  //  [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"Cell"];
}

//#pragma mark - setup swipe gestures
//
//- (void)setUpSwipeGestures
//{
//    UISwipeGestureRecognizer *swipeLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(userSwipedLeft:)];
//    swipeLeft.direction = UISwipeGestureRecognizerDirectionLeft;
//    [self.view addGestureRecognizer:swipeLeft];
//    
//    UISwipeGestureRecognizer *swipeRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(userSwipedRight:)];
//    swipeRight.direction = UISwipeGestureRecognizerDirectionRight;
//    [self.view addGestureRecognizer:swipeRight];
//}
//
//- (void)userSwipedLeft:(UISwipeGestureRecognizer*)swipe
//{
//    if (swipe.direction == UISwipeGestureRecognizerDirectionLeft) {
//       [self performSegueWithIdentifier:@"pushToSearch" sender:self];
//    }
//}
//
//- (void)userSwipedRight:(UISwipeGestureRecognizer*)swipe
//{
//    if (swipe.direction == UISwipeGestureRecognizerDirectionRight) {
//         [self performSegueWithIdentifier:@"pushToWishList" sender:self];
//    }
//}

#pragma mark - Navigation


//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//
//}


#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1; // change to months
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return collectionImages.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"Cell";
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    
    UIImageView *collectionImageView = (UIImageView *)[cell viewWithTag:100];
    collectionImageView.image = [UIImage imageNamed:[collectionImages objectAtIndex:indexPath.row]];
    
    cell.layer.borderWidth = 2.0;
    cell.layer.borderColor = [UIColor blackColor].CGColor;
    cell.layer.cornerRadius = 30.0;
    
    
    return cell;
}




#pragma mark <UICollectionViewDelegate>

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end
