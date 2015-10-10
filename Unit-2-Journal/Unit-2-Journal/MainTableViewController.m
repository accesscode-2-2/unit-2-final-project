//
//  MainTableViewController.m
//  Unit-2-Journal
//
//  Created by Brian Blanco on 10/10/15.
//  Copyright © 2015 Jamaal Sedayao. All rights reserved.
//

#import "MainTableViewController.h"
#import <Parse/Parse.h>

@interface MainTableViewController ()

@end

@implementation MainTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    PFObject *testObject = [PFObject objectWithClassName:@"TestObject"];
    testObject[@"foo"] = @"bar";
    [testObject saveInBackground];
    
    [self performSegueWithIdentifier:@"showLogin" sender:self];
}



#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 0;
}


@end
