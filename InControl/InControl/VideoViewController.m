//
//  VideoViewController.m
//  InControl
//
//  Created by Diana Elezaj on 10/12/15.
//  Copyright © 2015 Diana Elezaj. All rights reserved.
//

#import "VideoViewController.h"
#import <XCDYouTubeKit/XCDYouTubeKit.h>
#import "APIManager.h"
#import "ViewController.h"
#import "Youtube.h"

@interface VideoViewController ()
<UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

//comment
@end

@implementation VideoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"str %@", self.str);
    
    
 }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
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
