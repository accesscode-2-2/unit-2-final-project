//
//  FlappyViewController.h
//  InControl
//
//  Created by Diana Elezaj on 10/15/15.
//  Copyright © 2015 Diana Elezaj. All rights reserved.
//

#import <UIKit/UIKit.h>

NSInteger HighScoreNumber;

@interface FlappyViewController : UIViewController
{    
    __weak IBOutlet UILabel *HighScore;
}

@end
