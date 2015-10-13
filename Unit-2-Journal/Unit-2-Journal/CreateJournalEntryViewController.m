//
//  CreateJournalEntryViewController.m
//  Unit-2-Journal
//
//  Created by Shena Yoshida on 10/10/15.
//  Copyright © 2015 Jamaal Sedayao. All rights reserved.
//

#import "CreateJournalEntryViewController.h"
#import "JournalPost.h"
#import "TabBarViewController.h"
#import "JournalMainCollectionViewController.h"

@interface CreateJournalEntryViewController () <UITextViewDelegate>

@property (strong, nonatomic) IBOutlet UILabel *movieOrAlbumNameLabel;
@property (strong, nonatomic) IBOutlet UILabel *artistNameLabel;
@property (strong, nonatomic) IBOutlet UIImageView *artworkImageView;
@property (strong, nonatomic) IBOutlet UITextView *textView;
@property (strong, nonatomic) IBOutlet UIButton *doneEditingButton;

@property (strong, nonatomic) IBOutlet UIButton *starButtonOne;
@property (nonatomic) JournalPost *journalPost;
@property (nonatomic) NSMutableArray *journalPostArray;

@end

@implementation CreateJournalEntryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.journalPostArray = [[NSMutableArray alloc]init];
    
    NSLog(@"Data has been passed: %@",self.postSearchResult);
    
    self.doneEditingButton.hidden = YES;
    
    //manage textview
    self.textView.delegate = self;
    self.textView.text = @"Write your thoughts here...";
    self.textView.layer.borderWidth = 1.0f;
    self.textView.layer.cornerRadius = 5.0f;
    self.textView.layer.borderColor = [UIColor grayColor].CGColor;
   
    //populate journal header
    self.movieOrAlbumNameLabel.text = self.postSearchResult.albumOrMovieName;
    self.artistNameLabel.text = self.postSearchResult.artistName;
    NSURL *artworkURL = [NSURL URLWithString:self.postSearchResult.artworkURL];
    NSData *artworkData = [NSData dataWithContentsOfURL:artworkURL];
    UIImage *artworkImage = [UIImage imageWithData:artworkData];
    self.artworkImageView.image = artworkImage;
    
}
- (void) textViewDidBeginEditing:(UITextView *)textView{
    self.textView.text = @"";
    
    self.doneEditingButton.hidden = NO;
}

- (IBAction)doneEditingTapped:(id)sender {
    
    self.doneEditingButton.hidden = YES;
    
    [[[UIApplication sharedApplication] keyWindow] endEditing:YES];

}
- (IBAction)starButtonTapped:(id)sender {
    
    self.starButtonOne.tintColor = [UIColor yellowColor];
    
}

#pragma mark - save items


- (IBAction)logToJournalButtonTapped:(id)sender {
    
    JournalPost *journalPost = [[JournalPost alloc]init];
    
    journalPost.postText = self.textView.text;
    journalPost.postSubject = self.postSearchResult;
    
    self.journalPost = journalPost;
    
    [self.journalPostArray addObject:self.journalPost];
                               
    NSLog(@"Journal Post: %@",self.journalPost);
    
}

 #pragma mark - Navigation
 
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {

     NSLog(@"Segue");
     
//     if ([[segue identifier]isEqualToString:@"logToJournalSegue"]) {
//      
//         NSLog(@"Segue to Tab");
//         JournalMainCollectionViewController *viewController = [[JournalMainCollectionViewController alloc]init];
         TabBarViewController *tabVC = segue.destinationViewController;
         JournalMainCollectionViewController *viewController = [[tabVC viewControllers] objectAtIndex:2];
         //[viewController.allJournalPosts addObjectsFromArray:self.journalPostArray];
     
        viewController.journalPostToAdd = self. journalPost;
        [tabVC setSelectedIndex:2];
 //    }
 }

//locationsHome* vc = [[locationsHome alloc] init];
//UITabBarController* tbc = [segue destinationViewController];
//vc = (locationsHome *)[[tbc customizableViewControllers] objectAtIndex:0];

@end
