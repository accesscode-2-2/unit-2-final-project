//
//  EntryListTableViewController.h
//  UNIT2PracticeProject
//
//  Created by Bereket  on 10/15/15.
//  Copyright © 2015 Bereket . All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NewEntryInputViewController.h"
#import "JournalEntryObject.h"
#import "PhotoAlbum.h"
#import "RootViewController.h"
#import "AppDelegate.h"
@interface EntryListTableViewController : UITableViewController <NSFetchedResultsControllerDelegate>

@property (nonatomic) PhotoAlbum* myAlbum;

@property (nonatomic) NSNumber* count;

@property (nonatomic) NSFetchedResultsController *fetchedResultsController;


@end
