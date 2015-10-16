//
//  FlappyGame.h
//  InControl
//
//  Created by Diana Elezaj on 10/15/15.
//  Copyright © 2015 Diana Elezaj. All rights reserved.
//

#import <UIKit/UIKit.h>

int BirdFlight;
int RandomTopTunnelPosition;
int RandomBottomTunnelPosition;
int ScoreNumber;
NSInteger HighScoreNumberLabel;


@interface FlappyGame : UIViewController

{
IBOutlet UIImageView *Bird;
IBOutlet UIButton *StartGame;
IBOutlet UIImageView *TunnelTop;
IBOutlet UIImageView *TunnelBottom;
IBOutlet UIImageView *Top;
IBOutlet UIImageView *Bottom;
IBOutlet UIButton *Exit;
IBOutlet UILabel *ScoreLabel;

NSTimer *BirdMovement;
NSTimer *TunnelMovement;
}

-(IBAction)StartGame:(id)sender;
-(void)BirdMoving;
-(void)TunnelMoving;
-(void)PlaceTunnels;
-(void)Score;
-(void)GameOver;

@end
