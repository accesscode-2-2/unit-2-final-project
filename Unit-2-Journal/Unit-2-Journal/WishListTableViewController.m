//
//  WishListTableViewController.m
//  Unit-2-Journal
//
//  Created by Shena Yoshida on 10/10/15.
//  Copyright © 2015 Jamaal Sedayao. All rights reserved.
//

#import "WishListTableViewController.h"
#import "WishListTableViewCell.h"
#import <Parse/Parse.h>
#import "JournalPost.h"

@interface WishListTableViewController ()

@end

@implementation WishListTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    if (self.allJournalPosts == nil){
    self.allJournalPosts = [[NSMutableArray alloc]init];
    }
    
    NSLog(@"Wish List Result: %@",self.searchResult);
    
    //    [self setUpSwipeGestures];
    
    // set up custom cell .xib
    UINib *nib = [UINib nibWithNibName:@"WishListTableViewCell" bundle:nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:@"WishListTableViewCellIdentifier"];
    
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 35.0;
    //[self.tableView setSeparatorColor:[UIColor whiteColor]];
    [self.tableView setTableFooterView:[UIView new]]; // hide extra lines in empty tableview cells

    
    [self pullEntriesFromParse];
}

- (void)pullEntriesFromParse {
    
    // __weak typeof(self) weakSelf = self; // prevent memory leakage?
    
    PFQuery *query = [PFQuery queryWithClassName:@"JournalPost"];
    
    [query findObjectsInBackgroundWithBlock:^(NSArray * _Nullable objects, NSError * _Nullable error) {
        
        // create a for loop and iterate through the objects array and push only the posts that are marked with True to "self.allJournalPosts"
        
        [self.allJournalPosts removeAllObjects]; // clear to prevent doubles
        
        for (JournalPost *object in objects) {
            if (!object.reviewed) {
                [self.allJournalPosts addObject:object];
            }
        }
        
        //       self.allJournalPosts = objects; // pull all images from Parse
        
        NSLog(@"info fetched from parse: %@", self.allJournalPosts); // test it!
        
        [self.tableView reloadData]; // reload tableView
    }];
    
}

//#pragma  mark - swipe gestures
//
//- (void)setUpSwipeGestures
//{
//    UISwipeGestureRecognizer *swipeLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(userSwipedLeft:)];
//    swipeLeft.direction = UISwipeGestureRecognizerDirectionLeft;
//    [self.view addGestureRecognizer:swipeLeft];
//}
//
//- (void)userSwipedLeft:(UISwipeGestureRecognizer*)swipe
//{
//    if (swipe.direction == UISwipeGestureRecognizerDirectionLeft) {
//
//        [self performSegueWithIdentifier:@"pushToHomeList" sender:self];
//
//        //[self dismissViewControllerAnimated:YES completion:nil];
//    }
//}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.allJournalPosts.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    WishListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WishListTableViewCellIdentifier" forIndexPath:indexPath];
    
    JournalPost *thisEntry = self.allJournalPosts[indexPath.row];
    
    cell.titleLabel.text = thisEntry.title;
    cell.authorArtistDirectorLabel.text = thisEntry.creator;
    
    NSString *imageString = thisEntry.imageForMedia;
    NSURL *imageURL = [NSURL URLWithString:imageString];
    NSData *imageData = [NSData dataWithContentsOfURL:imageURL];
    UIImage *image = [UIImage imageWithData:imageData];
    
    cell.artworkImage.image = image;
    
    cell.preservesSuperviewLayoutMargins = false;
    cell.separatorInset = UIEdgeInsetsZero;
    cell.layoutMargins = UIEdgeInsetsZero;
    
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
