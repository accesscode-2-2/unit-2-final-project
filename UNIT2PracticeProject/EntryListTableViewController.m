//
//  EntryListTableViewController.m
//  UNIT2PracticeProject
//
//  Created by Bereket  on 10/15/15.
//  Copyright © 2015 Bereket . All rights reserved.
//

#import "EntryListTableViewController.h"

@implementation EntryListTableViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    
    [self.tableView reloadData];
    
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}


- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear: YES];
    [self.tableView reloadData];
    // Dispose of any resources that can be recreated.
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [PhotoAlbum sharedPhotoAlbum].photoEntries.count;
}

 - (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    // [self.tableView reloadData];
     UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"EntryCellIdentifier" forIndexPath:indexPath];
     
     JournalEntryObject* journalEntry = [PhotoAlbum sharedPhotoAlbum].photoEntries[indexPath.row];
     cell.textLabel.text = journalEntry.savedTitle; 
     
     
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

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    
    
    
    if ([[segue identifier] isEqualToString:@"SpecificPageIdentifier"])
    {
        NSIndexPath* indexPath = [self.tableView indexPathForSelectedRow];
        
        JournalEntryObject* journalEntry = [PhotoAlbum sharedPhotoAlbum].photoEntries[indexPath.row];

        RootViewController* viewController = [segue destinationViewController];
        viewController.titleSelected = journalEntry.savedTitle;
        viewController.pageViewController = sender;
        
        NSLog(@"title %@ ",viewController.titleSelected);
        
    }
    
    
    
    
}

@end
