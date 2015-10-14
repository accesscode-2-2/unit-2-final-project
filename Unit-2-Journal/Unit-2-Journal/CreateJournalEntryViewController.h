//
//  CreateJournalEntryViewController.h
//  Unit-2-Journal
//
//  Created by Shena Yoshida on 10/10/15.
//  Copyright © 2015 Jamaal Sedayao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "iTunesSearchResult.h"
#import "YALTabBarInteracting.h"


@interface CreateJournalEntryViewController : UIViewController <YALTabBarInteracting>

@property (nonatomic) iTunesSearchResult *postSearchResult;

@end
