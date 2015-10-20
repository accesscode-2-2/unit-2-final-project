//
//  DetailMeetUpViewController.m
//  UNIT2PracticeProject
//
//  Created by Christian Maldonado on 10/19/15.
//  Copyright © 2015 Bereket . All rights reserved.
//

#import "DetailMeetUpViewController.h"
#import "MeetUpCVC.h"
#import "ObjectsInMeetUp.h"

@interface DetailMeetUpViewController ()

@property (weak, nonatomic) IBOutlet UILabel *descLabel;
@property (weak, nonatomic) IBOutlet UIScrollView *scroller;

@end

@implementation DetailMeetUpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.descLabel.text = [NSString stringWithFormat:@"%@",self.meetUpData2.desc];
    
    [self.scroller setScrollEnabled:YES];
    [self.scroller setContentSize:CGSizeMake(600, 1000)];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
