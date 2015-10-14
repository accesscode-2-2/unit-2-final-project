//
//  ViewController.h
//  InControl
//
//  Created by Diana Elezaj on 10/11/15.
//  Copyright © 2015 Diana Elezaj. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RNFrostedSidebar.h"
#import "VideoViewController.h"

@interface ViewController : UIViewController

<RNFrostedSidebarDelegate>
 
 
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar; 

@end

