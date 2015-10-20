//
//  EntryLogsTableViewController.h
//  BreakingBad
//
//  Created by Zoufishan Mehdi on 10/16/15.
//  Copyright © 2015 Zoufishan Mehdi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Habit.h"
#import "FetchWeatherData.h"

@interface EntryLogsTableViewController : UITableViewController

@property (nonatomic) Habit *habit;

@property (nonatomic) FetchWeatherData *weatherData;
@end
