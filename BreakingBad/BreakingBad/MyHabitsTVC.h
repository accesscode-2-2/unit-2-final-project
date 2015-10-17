//
//  MyHabitsTVC.h
//  BreakingBad
//
//  Created by Zoufishan Mehdi on 10/16/15.
//  Copyright © 2015 Zoufishan Mehdi. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MyHabitsTVC;

@protocol MyHabitsDelegate <NSObject>
- (void)pickedAHabit:(MyHabitsTVC *)tvc withName:(NSString *)name;
@end

@interface MyHabitsTVC : UITableViewController

@property (nonatomic) NSArray *habitsArray;
@property (nonatomic, weak) id<MyHabitsDelegate> delegate;
@end
