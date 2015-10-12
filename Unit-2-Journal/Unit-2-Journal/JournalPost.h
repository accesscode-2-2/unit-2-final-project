//
//  JournalPost.h
//  Unit-2-Journal
//
//  Created by Jamaal Sedayao on 10/12/15.
//  Copyright © 2015 Jamaal Sedayao. All rights reserved.
//

#import <Parse/Parse.h>
#import "iTunesSearchResult.h"

@interface JournalPost : PFObject <PFSubclassing>

@property (nonatomic) NSString *postText;
@property (nonatomic) iTunesSearchResult *postSubject;

@end
