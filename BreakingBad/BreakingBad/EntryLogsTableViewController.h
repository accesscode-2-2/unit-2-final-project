//
//  EntryLogsTableViewController.h
//  BreakingBad
//
//  Created by Zoufishan Mehdi on 10/16/15.
//  Copyright © 2015 Zoufishan Mehdi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Habit.h"

@interface EntryLogsTableViewController : UITableViewController

@property (nonatomic) Habit *habit;


-(void)addColorEntryLog;

@end
