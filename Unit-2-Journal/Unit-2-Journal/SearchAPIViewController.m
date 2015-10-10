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

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)mediaButtonTypeSelected:(id)sender {
}

- (IBAction)mediaButtonOther:(id)sender {
}

- (IBAction)createJournalEntryButtonTapped:(id)sender {
}

- (IBAction)addToWishListButtonTapped:(id)sender {
}

@end
