//
//  RootViewController.h
//  UNIT2PracticeProject
//
//  Created by Bereket  on 10/12/15.
//  Copyright © 2015 Bereket . All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JournalEntryObject.h"
#import "EntryListTableViewController.h"

@interface RootViewController : UIViewController <UIPageViewControllerDelegate>

@property (strong, nonatomic) UIPageViewController *pageViewController;

//@property (nonatomic) NSMutableArray* pageEntries;

//@property (nonatomic) NSUInteger index;

@property (nonatomic) NSString* titleSelected;


@end

