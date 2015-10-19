//
//  DataViewController.h
//  UNIT2PracticeProject
//
//  Created by Bereket  on 10/12/15.
//  Copyright © 2015 Bereket . All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JournalEntryObject.h"


@interface DataViewController : UIViewController

<UITextViewDelegate>


@property (strong, nonatomic) IBOutlet UILabel *dataLabel; // <----not relevant to the project IGNORE!

//-------------------------------------------------------------------------------------------
@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) IBOutlet UITextView *textView;


@property (strong, nonatomic) id photoDataObject;
@property (strong, nonatomic) id titleDataObject;
@property (strong, nonatomic) id textEntrydataObject;


@property (nonatomic) NSUInteger indexOfSelectedRow;


@end

