//
//  CreateJournalEntryViewController.m
//  Unit-2-Journal
//
//  Created by Shena Yoshida on 10/10/15.
//  Copyright © 2015 Jamaal Sedayao. All rights reserved.
//

#import "CreateJournalEntryViewController.h"

@interface CreateJournalEntryViewController () <UITextViewDelegate>

@property (strong, nonatomic) IBOutlet UILabel *movieOrAlbumNameLabel;
@property (strong, nonatomic) IBOutlet UILabel *artistNameLabel;
@property (strong, nonatomic) IBOutlet UIImageView *artworkImageView;
@property (strong, nonatomic) IBOutlet UITextView *textView;
@property (strong, nonatomic) IBOutlet UIButton *doneEditingButton;

@property (strong, nonatomic) IBOutlet UIButton *starButtonOne;
@end

@implementation CreateJournalEntryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
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
