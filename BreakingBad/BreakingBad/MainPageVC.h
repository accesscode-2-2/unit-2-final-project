//
//  MainPageVC.h
//  BreakingBad
//
//  Created by Zoufishan Mehdi on 10/13/15.
//  Copyright © 2015 Zoufishan Mehdi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Entry.h"
@interface MainPageVC : UIViewController

@property (nonatomic) Entry *entry;
@property (nonatomic) BOOL readOnly;
@property (nonatomic) NSString *habitName;

@end
