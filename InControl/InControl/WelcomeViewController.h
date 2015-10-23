//
//  WelcomeViewController.h
//  InControl
//
//  Created by Diana Elezaj on 10/11/15.
//  Copyright © 2015 Diana Elezaj. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WelcomeViewController : UIViewController



@end


@protocol EFItemViewDelegate <NSObject>

- (void)didTapped:(NSInteger)index;

@end




@interface EFItemView : UIButton

@property (nonatomic, weak) id <EFItemViewDelegate>delegate;

- (instancetype)initWithNormalImage:(NSString *)normal highlightedImage:(NSString *)highlighted tag:(NSInteger)tag title:(NSString *)title;

@end