//
//  JournalMainCollectionViewController.m
//  Unit-2-Journal
//
//  Created by Shena Yoshida on 10/10/15.
//  Copyright © 2015 Jamaal Sedayao. All rights reserved.
//

#import "JournalMainCollectionViewController.h"
#import <Parse/Parse.h>

@interface JournalMainCollectionViewController ()

@end

@implementation JournalMainCollectionViewController

//static NSString * const reuseIdentifier = @"Cell";

- (void) viewDidAppear:(BOOL)animated{
    [self.collectionView reloadData];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    if (self.allJournalPosts == nil){
   self.allJournalPosts = [[NSMutableArray alloc]init];
    } else {
        nil;
    }

    NSLog(@"Current Journal Post: %@", self.journalPostToAdd);
    
    if (self.journalPostToAdd != nil){
    [self. allJournalPosts addObject:self.journalPostToAdd];
    }
    
    NSLog(@"All Journal Posts: %@", self.allJournalPosts);
    
    
    collectionImages = [NSMutableArray arrayWithObjects:@"destroyer.png", @"drake.png", @"big_nerd_ranch.png", @"talking_heads.png", @"true_detective", @"sleater_kinney.png", @"x-files.png", @"run_the_jewels.png", @"lean_startup.png", nil];
    
    self.collectionView.alwaysBounceVertical = YES;
    
    [self runQuery]; // run Parse query to fetch saved data
}

#pragma mark - fetch saved data from Parse

- (void)runQuery {
    PFQuery *query = [PFQuery queryWithClassName:@"JournalPost"];
    [query findObjectsInBackgroundWithBlock:^(NSArray * _Nullable objects, NSError * _Nullable error) {
        
        self.allJournalPosts = objects; // pull all images from Parse
        NSLog(@"info fetched from parse: %@", self.allJournalPosts); // test it!
        
        // right now the posts are saved as a URL... change this back to image somehow
        
        [self.collectionView reloadData]; // reload tableView
    }];
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1; // change to months
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.allJournalPosts.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"Cell";
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
   
    
    PFObject *post = self.allJournalPosts[indexPath.row]; // pulling out parse data here
    PFFile *file = post[@"imageForMedia"]; // this returns urls for each image
   // [cell.imageView loadInBackground]; // broken
    NSLog(@"file: %@", file);
    
    NSString *fileString = [NSString stringWithFormat:@"%@",file];
    NSURL *fileURL = [NSURL URLWithString:fileString];
    NSData *fileData = [NSData dataWithContentsOfURL:fileURL];
    UIImage *fileImage = [UIImage imageWithData:fileData];
    
    UIImageView *collectionImageView = (UIImageView *)[cell viewWithTag:100];
    
    //collectionImageView.image = [UIImage imageNamed:[collectionImages objectAtIndex:indexPath.row]];
    
    JournalPost *thisResult = self.allJournalPosts[indexPath.row];
    iTunesSearchResult *iTunes = thisResult.postSubject;
    
    NSString *imageString = iTunes.artworkURL;
    NSURL *imageURL = [NSURL URLWithString:imageString];
    NSData *imageData = [NSData dataWithContentsOfURL:imageURL];
   // UIImage *image = [UIImage imageWithData:imageData];
    
    collectionImageView.image = fileImage;
    
    // round corners
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
