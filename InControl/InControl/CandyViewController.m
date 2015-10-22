//
//  CandyViewController.m
//  InControl
//
//  Created by Diana Elezaj on 10/22/15.
//  Copyright © 2015 Diana Elezaj. All rights reserved.
//

#import "CandyViewController.h"

@interface CandyViewController ()

@end

@implementation CandyViewController



-(IBAction)Shuffle:(id)sender{
    
    Candy1Type = arc4random() %4;
    Candy2Type = arc4random() %4;
    Candy3Type = arc4random() %4;
    Candy4Type = arc4random() %4;
    Candy5Type = arc4random() %4;
    Candy6Type = arc4random() %4;
    Candy7Type = arc4random() %4;
    Candy8Type = arc4random() %4;
    Candy9Type = arc4random() %4;
    Candy10Type = arc4random() %4;
    Candy11Type = arc4random() %4;
    Candy12Type = arc4random() %4;
    Candy13Type = arc4random() %4;
    Candy14Type = arc4random() %4;
    Candy15Type = arc4random() %4;
    Candy16Type = arc4random() %4;
    
    [self Candy1SelectedType];
    [self Candy2SelectedType];
    [self Candy3SelectedType];
    [self Candy4SelectedType];
    [self Candy5SelectedType];
    [self Candy6SelectedType];
    [self Candy7SelectedType];
    [self Candy8SelectedType];
    [self Candy9SelectedType];
    [self Candy10SelectedType];
    [self Candy11SelectedType];
    [self Candy12SelectedType];
    [self Candy13SelectedType];
    [self Candy14SelectedType];
    [self Candy15SelectedType];
    [self Candy16SelectedType];
    
    MovesLeftNumber = MovesLeftNumber - 2;
    MovesLeft.text = [NSString stringWithFormat:@"Moves Left: %i", MovesLeftNumber];
    
    if (MovesLeftNumber < 3) {
        Shuffle.hidden = YES;
    }
    
    [self performSelector:@selector(CheckConnection) withObject:self afterDelay:0.3];
    
    
    
}


-(void)Move{
    
    MovesLeftNumber = MovesLeftNumber - 1;
    MovesLeft.text = [NSString stringWithFormat:@"Moves Left: %i", MovesLeftNumber];
    
    
    if (MovesLeftNumber < 3) {
        Shuffle.hidden = YES;
    }
    
    if (MovesLeftNumber == 0) {
        Candy1.hidden = YES;
        Candy2.hidden = YES;
        Candy3.hidden = YES;
        Candy4.hidden = YES;
        Candy5.hidden = YES;
        Candy6.hidden = YES;
        Candy7.hidden = YES;
        Candy8.hidden = YES;
        Candy9.hidden = YES;
        Candy10.hidden = YES;
        Candy11.hidden = YES;
        Candy12.hidden = YES;
        Candy13.hidden = YES;
        Candy14.hidden = YES;
        Candy15.hidden = YES;
        Candy16.hidden = YES;
        
        MovesLeft.hidden = YES;
        HighScore.hidden = YES;
        
        Exit.hidden = NO;
        
        GameFinished = YES;
        
        if (candyScoreNumber > candyHighScoreNumber) {
            HighScore.hidden = NO;
            [[NSUserDefaults standardUserDefaults] setInteger:candyScoreNumber forKey:@"HighScoreSaved"];
        }
        
        
    }
}



-(void)Scoring{
    
    candyScoreNumber = candyScoreNumber + AddedScore;
    Score.text = [NSString stringWithFormat:@"Score: %i", candyScoreNumber];
    
    
    if (candyScoreNumber > candyHighScoreNumber) {
        HighScore.text = [NSString stringWithFormat:@"High Score: %i", candyScoreNumber];
    }
    
}




-(void)ReplaceCandies{
    
    [self Candy1SelectedType];
    [self Candy2SelectedType];
    [self Candy3SelectedType];
    [self Candy4SelectedType];
    [self Candy5SelectedType];
    [self Candy6SelectedType];
    [self Candy7SelectedType];
    [self Candy8SelectedType];
    [self Candy9SelectedType];
    [self Candy10SelectedType];
    [self Candy11SelectedType];
    [self Candy12SelectedType];
    [self Candy13SelectedType];
    [self Candy14SelectedType];
    [self Candy15SelectedType];
    [self Candy16SelectedType];
    
    Candy1.hidden = NO;
    Candy2.hidden = NO;
    Candy3.hidden = NO;
    Candy4.hidden = NO;
    Candy5.hidden = NO;
    Candy6.hidden = NO;
    Candy7.hidden = NO;
    Candy8.hidden = NO;
    Candy9.hidden = NO;
    Candy10.hidden = NO;
    Candy11.hidden = NO;
    Candy12.hidden = NO;
    Candy13.hidden = NO;
    Candy14.hidden = NO;
    Candy15.hidden = NO;
    Candy16.hidden = NO;
    
    Candy1Deleted = NO;
    Candy2Deleted = NO;
    Candy3Deleted = NO;
    Candy4Deleted = NO;
    Candy5Deleted = NO;
    Candy6Deleted = NO;
    Candy7Deleted = NO;
    Candy8Deleted = NO;
    Candy9Deleted = NO;
    Candy10Deleted = NO;
    Candy11Deleted = NO;
    Candy12Deleted = NO;
    Candy13Deleted = NO;
    Candy14Deleted = NO;
    Candy15Deleted = NO;
    Candy16Deleted = NO;
    
    if (GameFinished == YES) {
        Candy1.hidden = YES;
        Candy2.hidden = YES;
        Candy3.hidden = YES;
        Candy4.hidden = YES;
        Candy5.hidden = YES;
        Candy6.hidden = YES;
        Candy7.hidden = YES;
        Candy8.hidden = YES;
        Candy9.hidden = YES;
        Candy10.hidden = YES;
        Candy11.hidden = YES;
        Candy12.hidden = YES;
        Candy13.hidden = YES;
        Candy14.hidden = YES;
        Candy15.hidden = YES;
        Candy16.hidden = YES;
    }
    else{
        [self performSelector:@selector(CheckConnection) withObject:self afterDelay:0.1];
    }
}

-(void)GetRidOfCandies{
    
    if (Candy1Deleted == YES) {
        Candy1.hidden = YES;
        Candy1Type = arc4random() %4;
    }
    if (Candy2Deleted == YES) {
        Candy2.hidden = YES;
        Candy2Type = arc4random() %4;
    }
    if (Candy3Deleted == YES) {
        Candy3.hidden = YES;
        Candy3Type = arc4random() %4;
    }
    if (Candy4Deleted == YES) {
        Candy4.hidden = YES;
        Candy4Type = arc4random() %4;
    }
    if (Candy5Deleted == YES) {
        Candy5.hidden = YES;
        Candy5Type = arc4random() %4;
    }
    if (Candy6Deleted == YES) {
        Candy6.hidden = YES;
        Candy6Type = arc4random() %4;
    }
    if (Candy7Deleted == YES) {
        Candy7.hidden = YES;
        Candy7Type = arc4random() %4;
    }
    if (Candy8Deleted == YES) {
        Candy8.hidden = YES;
        Candy8Type = arc4random() %4;
    }
    if (Candy9Deleted == YES) {
        Candy9.hidden = YES;
        Candy9Type = arc4random() %4;
    }
    if (Candy10Deleted == YES) {
        Candy10.hidden = YES;
        Candy10Type = arc4random() %4;
    }
    if (Candy11Deleted == YES) {
        Candy11.hidden = YES;
        Candy11Type = arc4random() %4;
    }
    if (Candy12Deleted == YES) {
        Candy12.hidden = YES;
        Candy12Type = arc4random() %4;
    }
    if (Candy13Deleted == YES) {
        Candy13.hidden = YES;
        Candy13Type = arc4random() %4;
    }
    if (Candy14Deleted == YES) {
        Candy14.hidden = YES;
        Candy14Type = arc4random() %4;
    }
    if (Candy15Deleted == YES) {
        Candy15.hidden = YES;
        Candy15Type = arc4random() %4;
    }
    if (Candy16Deleted == YES) {
        Candy16.hidden = YES;
        Candy16Type = arc4random() %4;
    }
    
    [self performSelector:@selector(ReplaceCandies) withObject:self afterDelay:0.1];
    
    
}



-(void)CheckConnection{
    
    if (Candy1Type == Candy2Type && Candy2Type == Candy3Type && Candy3Type == Candy4Type) {
        Candy1Deleted = YES;
        Candy2Deleted = YES;
        Candy3Deleted = YES;
        Candy4Deleted = YES;
        [self performSelector:@selector(GetRidOfCandies) withObject:self afterDelay:0.1];
        AddedScore = 2;
        [self Scoring];
    }
    
    if (Candy5Type == Candy6Type && Candy6Type == Candy7Type && Candy7Type == Candy8Type) {
        Candy5Deleted = YES;
        Candy6Deleted = YES;
        Candy7Deleted = YES;
        Candy8Deleted = YES;
        [self performSelector:@selector(GetRidOfCandies) withObject:self afterDelay:0.1];
        AddedScore = 2;
        [self Scoring];
    }
    
    if (Candy9Type == Candy10Type && Candy10Type == Candy11Type && Candy11Type == Candy12Type) {
        Candy9Deleted = YES;
        Candy10Deleted = YES;
        Candy11Deleted = YES;
        Candy12Deleted = YES;
        [self performSelector:@selector(GetRidOfCandies) withObject:self afterDelay:0.1];
        AddedScore = 2;
        [self Scoring];
    }
    
    if (Candy13Type == Candy14Type && Candy14Type == Candy15Type && Candy15Type == Candy16Type) {
        Candy13Deleted = YES;
        Candy14Deleted = YES;
        Candy15Deleted = YES;
        Candy16Deleted = YES;
        [self performSelector:@selector(GetRidOfCandies) withObject:self afterDelay:0.1];
        AddedScore = 2;
        [self Scoring];
    }
    if (Candy1Type == Candy5Type && Candy5Type == Candy9Type && Candy9Type == Candy13Type) {
        Candy1Deleted = YES;
        Candy5Deleted = YES;
        Candy9Deleted = YES;
        Candy13Deleted = YES;
        [self performSelector:@selector(GetRidOfCandies) withObject:self afterDelay:0.1];
        AddedScore = 2;
        [self Scoring];
    }
    
    if (Candy2Type == Candy6Type && Candy6Type == Candy10Type && Candy10Type == Candy14Type) {
        Candy2Deleted = YES;
        Candy6Deleted = YES;
        Candy10Deleted = YES;
        Candy14Deleted = YES;
        [self performSelector:@selector(GetRidOfCandies) withObject:self afterDelay:0.1];
        AddedScore = 2;
        [self Scoring];
    }
    if (Candy3Type == Candy7Type && Candy7Type == Candy11Type && Candy11Type == Candy15Type) {
        Candy3Deleted = YES;
        Candy7Deleted = YES;
        Candy11Deleted = YES;
        Candy15Deleted = YES;
        [self performSelector:@selector(GetRidOfCandies) withObject:self afterDelay:0.1];
        AddedScore = 2;
        [self Scoring];
    }
    if (Candy4Type == Candy8Type && Candy8Type == Candy12Type && Candy12Type == Candy16Type) {
        Candy4Deleted = YES;
        Candy8Deleted = YES;
        Candy12Deleted = YES;
        Candy16Deleted = YES;
        [self performSelector:@selector(GetRidOfCandies) withObject:self afterDelay:0.1];
        AddedScore = 2;
        [self Scoring];
    }
    
    if (Candy1Type == Candy2Type && Candy2Type == Candy3Type) {
        Candy1Deleted = YES;
        Candy2Deleted = YES;
        Candy3Deleted = YES;
        [self performSelector:@selector(GetRidOfCandies) withObject:self afterDelay:0.1];
        AddedScore = 1;
        [self Scoring];
    }
    if (Candy2Type == Candy3Type && Candy3Type == Candy4Type) {
        Candy2Deleted = YES;
        Candy3Deleted = YES;
        Candy4Deleted = YES;
        [self performSelector:@selector(GetRidOfCandies) withObject:self afterDelay:0.1];
        AddedScore = 1;
        [self Scoring];
    }
    if (Candy5Type == Candy6Type && Candy6Type == Candy7Type) {
        Candy5Deleted = YES;
        Candy6Deleted = YES;
        Candy7Deleted = YES;
        [self performSelector:@selector(GetRidOfCandies) withObject:self afterDelay:0.1];
        AddedScore = 1;
        [self Scoring];
    }
    if (Candy6Type == Candy7Type && Candy7Type == Candy8Type) {
        Candy6Deleted = YES;
        Candy7Deleted = YES;
        Candy8Deleted = YES;
        [self performSelector:@selector(GetRidOfCandies) withObject:self afterDelay:0.1];
        AddedScore = 1;
        [self Scoring];
    }
    if (Candy9Type == Candy10Type && Candy10Type == Candy11Type) {
        Candy9Deleted = YES;
        Candy10Deleted = YES;
        Candy11Deleted = YES;
        [self performSelector:@selector(GetRidOfCandies) withObject:self afterDelay:0.1];
        AddedScore = 1;
        [self Scoring];
    }
    if (Candy10Type == Candy11Type && Candy11Type == Candy12Type) {
        Candy10Deleted = YES;
        Candy11Deleted = YES;
        Candy12Deleted = YES;
        [self performSelector:@selector(GetRidOfCandies) withObject:self afterDelay:0.1];
        AddedScore = 1;
        [self Scoring];
    }
    if (Candy13Type == Candy14Type && Candy14Type == Candy15Type) {
        Candy13Deleted = YES;
        Candy14Deleted = YES;
        Candy15Deleted = YES;
        [self performSelector:@selector(GetRidOfCandies) withObject:self afterDelay:0.1];
        AddedScore = 1;
        [self Scoring];
    }
    if (Candy14Type == Candy15Type && Candy15Type == Candy16Type) {
        Candy14Deleted = YES;
        Candy15Deleted = YES;
        Candy16Deleted = YES;
        [self performSelector:@selector(GetRidOfCandies) withObject:self afterDelay:0.1];
        AddedScore = 1;
        [self Scoring];
    }
    
    if (Candy1Type == Candy5Type && Candy5Type == Candy9Type) {
        Candy1Deleted = YES;
        Candy5Deleted = YES;
        Candy9Deleted = YES;
        [self performSelector:@selector(GetRidOfCandies) withObject:self afterDelay:0.1];
        AddedScore = 1;
        [self Scoring];
    }
    if (Candy5Type == Candy9Type && Candy9Type == Candy13Type) {
        Candy5Deleted = YES;
        Candy9Deleted = YES;
        Candy13Deleted = YES;
        [self performSelector:@selector(GetRidOfCandies) withObject:self afterDelay:0.1];
        AddedScore = 1;
        [self Scoring];
    }
    if (Candy2Type == Candy6Type && Candy6Type == Candy10Type) {
        Candy2Deleted = YES;
        Candy6Deleted = YES;
        Candy10Deleted = YES;
        [self performSelector:@selector(GetRidOfCandies) withObject:self afterDelay:0.1];
        AddedScore = 1;
        [self Scoring];
    }
    if (Candy6Type == Candy10Type && Candy10Type == Candy14Type) {
        Candy6Deleted = YES;
        Candy10Deleted = YES;
        Candy14Deleted = YES;
        [self performSelector:@selector(GetRidOfCandies) withObject:self afterDelay:0.1];
        AddedScore = 1;
        [self Scoring];
    }
    if (Candy3Type == Candy7Type && Candy7Type == Candy11Type) {
        Candy3Deleted = YES;
        Candy7Deleted = YES;
        Candy11Deleted = YES;
        [self performSelector:@selector(GetRidOfCandies) withObject:self afterDelay:0.1];
        AddedScore = 1;
        [self Scoring];
    }
    if (Candy7Type == Candy11Type && Candy11Type == Candy15Type) {
        Candy7Deleted = YES;
        Candy11Deleted = YES;
        Candy15Deleted = YES;
        [self performSelector:@selector(GetRidOfCandies) withObject:self afterDelay:0.1];
        AddedScore = 1;
        [self Scoring];
    }
    if (Candy4Type == Candy8Type && Candy8Type == Candy12Type) {
        Candy4Deleted = YES;
        Candy8Deleted = YES;
        Candy12Deleted = YES;
        [self performSelector:@selector(GetRidOfCandies) withObject:self afterDelay:0.1];
        AddedScore = 1;
        [self Scoring];
    }
    if (Candy8Type == Candy12Type && Candy12Type == Candy16Type) {
        Candy8Deleted = YES;
        Candy12Deleted = YES;
        Candy16Deleted = YES;
        [self performSelector:@selector(GetRidOfCandies) withObject:self afterDelay:0.1];
        AddedScore = 1;
        [self Scoring];
    }
    
    
}



-(void)SwapCandies{
    
    switch (FirstCandyPushed) {
        case 1:
            Candy1Type = SecondCandyTypePushed;
            [self Candy1SelectedType];
            break;
        case 2:
            Candy2Type = SecondCandyTypePushed;
            [self Candy2SelectedType];
            break;
        case 3:
            Candy3Type = SecondCandyTypePushed;
            [self Candy3SelectedType];
            break;
        case 4:
            Candy4Type = SecondCandyTypePushed;
            [self Candy4SelectedType];
            break;
        case 5:
            Candy5Type = SecondCandyTypePushed;
            [self Candy5SelectedType];
            break;
        case 6:
            Candy6Type = SecondCandyTypePushed;
            [self Candy6SelectedType];
            break;
        case 7:
            Candy7Type = SecondCandyTypePushed;
            [self Candy7SelectedType];
            break;
        case 8:
            Candy8Type = SecondCandyTypePushed;
            [self Candy8SelectedType];
            break;
        case 9:
            Candy9Type = SecondCandyTypePushed;
            [self Candy9SelectedType];
            break;
        case 10:
            Candy10Type = SecondCandyTypePushed;
            [self Candy10SelectedType];
            break;
        case 11:
            Candy11Type = SecondCandyTypePushed;
            [self Candy11SelectedType];
            break;
        case 12:
            Candy12Type = SecondCandyTypePushed;
            [self Candy12SelectedType];
            break;
        case 13:
            Candy13Type = SecondCandyTypePushed;
            [self Candy13SelectedType];
            break;
        case 14:
            Candy14Type = SecondCandyTypePushed;
            [self Candy14SelectedType];
            break;
        case 15:
            Candy15Type = SecondCandyTypePushed;
            [self Candy15SelectedType];
            break;
        case 16:
            Candy16Type = SecondCandyTypePushed;
            [self Candy16SelectedType];
            break;
        default:
            break;
    }
    
    
    
    switch (SecondCandyPushed) {
        case 1:
            Candy1Type = FirstCandyTypePushed;
            [self Candy1SelectedType];
            break;
        case 2:
            Candy2Type = FirstCandyTypePushed;
            [self Candy2SelectedType];
            break;
        case 3:
            Candy3Type = FirstCandyTypePushed;
            [self Candy3SelectedType];
            break;
        case 4:
            Candy4Type = FirstCandyTypePushed;
            [self Candy4SelectedType];
            break;
        case 5:
            Candy5Type = FirstCandyTypePushed;
            [self Candy5SelectedType];
            break;
        case 6:
            Candy6Type = FirstCandyTypePushed;
            [self Candy6SelectedType];
            break;
        case 7:
            Candy7Type = FirstCandyTypePushed;
            [self Candy7SelectedType];
            break;
        case 8:
            Candy8Type = FirstCandyTypePushed;
            [self Candy8SelectedType];
            break;
        case 9:
            Candy9Type = FirstCandyTypePushed;
            [self Candy9SelectedType];
            break;
        case 10:
            Candy10Type = FirstCandyTypePushed;
            [self Candy10SelectedType];
            break;
        case 11:
            Candy11Type = FirstCandyTypePushed;
            [self Candy11SelectedType];
            break;
        case 12:
            Candy12Type = FirstCandyTypePushed;
            [self Candy12SelectedType];
            break;
        case 13:
            Candy13Type = FirstCandyTypePushed;
            [self Candy13SelectedType];
            break;
        case 14:
            Candy14Type = FirstCandyTypePushed;
            [self Candy14SelectedType];
            break;
        case 15:
            Candy15Type = FirstCandyTypePushed;
            [self Candy15SelectedType];
            break;
        case 16:
            Candy16Type = FirstCandyTypePushed;
            [self Candy16SelectedType];
            break;
        default:
            break;
    }
    
    
    [self UnselectCandies];
    [self CheckConnection];
    [self performSelector:@selector(Move) withObject:self afterDelay:0.5];
    
    
}

-(void)UnselectCandies{
    
    Candy1Selected.hidden = YES;
    Candy2Selected.hidden = YES;
    Candy3Selected.hidden = YES;
    Candy4Selected.hidden = YES;
    Candy5Selected.hidden = YES;
    Candy6Selected.hidden = YES;
    Candy7Selected.hidden = YES;
    Candy8Selected.hidden = YES;
    Candy9Selected.hidden = YES;
    Candy10Selected.hidden = YES;
    Candy11Selected.hidden = YES;
    Candy12Selected.hidden = YES;
    Candy13Selected.hidden = YES;
    Candy14Selected.hidden = YES;
    Candy15Selected.hidden = YES;
    Candy16Selected.hidden = YES;
    
    FirstCandySelected = NO;
    FirstCandyPushed = 0;
    FirstCandyTypePushed = 0;
    SecondCandyPushed = 0;
    SecondCandyTypePushed = 0;
    
}



-(void)CheckSwap{
    
    
    if (FirstCandyPushed == SecondCandyPushed + 1) {
        if (FirstCandyPushed == 5) {
            [self UnselectCandies];
        }
        else if (FirstCandyPushed == 9){
            [self UnselectCandies];
        }
        else if (FirstCandyPushed == 13){
            [self UnselectCandies];
        }
        else{
            [self SwapCandies];
        }
        
    }
    
    
    
    
    else if (FirstCandyPushed == SecondCandyPushed - 1){
        if (FirstCandyPushed == 4) {
            [self UnselectCandies];
        }
        else if (FirstCandyPushed == 8){
            [self UnselectCandies];
        }
        else if (FirstCandyPushed == 12){
            [self UnselectCandies];
        }
        else{
            [self SwapCandies];
        }
    }
    
    
    
    
    
    else if (FirstCandyPushed == SecondCandyPushed + 4){
        [self SwapCandies];
    }
    else if (FirstCandyPushed == SecondCandyPushed - 4){
        [self SwapCandies];
    }
    else{
        [self UnselectCandies];
    }
    
    
    
}





-(IBAction)Candy1Button:(id)sender{
    NSLog(@"1");
    
    if (FirstCandySelected == NO) {
        Candy1Selected.hidden = NO;
        FirstCandyPushed = 1;
        FirstCandyTypePushed = Candy1Type;
        FirstCandySelected = YES;
    }
    else{
        SecondCandyPushed = 1;
        SecondCandyTypePushed = Candy1Type;
        [self CheckSwap];
    }
    
}

-(IBAction)Candy2Button:(id)sender{
    NSLog(@"2");

    if (FirstCandySelected == NO) {
        Candy2Selected.hidden = NO;
        FirstCandyPushed = 2;
        FirstCandyTypePushed = Candy2Type;
        FirstCandySelected = YES;
    }
    else{
        SecondCandyPushed = 2;
        SecondCandyTypePushed = Candy2Type;
        [self CheckSwap];
    }
    
    
}

-(IBAction)Candy3Button:(id)sender{
    NSLog(@"3");

    if (FirstCandySelected == NO) {
        Candy3Selected.hidden = NO;
        FirstCandyPushed = 3;
        FirstCandyTypePushed = Candy3Type;
        FirstCandySelected = YES;
    }
    else{
        SecondCandyPushed = 3;
        SecondCandyTypePushed = Candy3Type;
        [self CheckSwap];
    }
    
    
}

-(IBAction)Candy4Button:(id)sender{
    NSLog(@"4");

    if (FirstCandySelected == NO) {
        Candy4Selected.hidden = NO;
        FirstCandyPushed = 4;
        FirstCandyTypePushed = Candy4Type;
        FirstCandySelected = YES;
    }
    else{
        SecondCandyPushed = 4;
        SecondCandyTypePushed = Candy4Type;
        [self CheckSwap];
    }
    
    
}

-(IBAction)Candy5Button:(id)sender{
    NSLog(@"5");

    if (FirstCandySelected == NO) {
        Candy5Selected.hidden = NO;
        FirstCandyPushed = 5;
        FirstCandyTypePushed = Candy5Type;
        FirstCandySelected = YES;
    }
    else{
        SecondCandyPushed = 5;
        SecondCandyTypePushed = Candy5Type;
        [self CheckSwap];
    }
    
    
}

-(IBAction)Candy6Button:(id)sender{
    NSLog(@"6");

    if (FirstCandySelected == NO) {
        Candy6Selected.hidden = NO;
        FirstCandyPushed = 6;
        FirstCandyTypePushed = Candy6Type;
        FirstCandySelected = YES;
    }
    else{
        SecondCandyPushed = 6;
        SecondCandyTypePushed = Candy6Type;
        [self CheckSwap];
    }
    
    
}

-(IBAction)Candy7Button:(id)sender{
    NSLog(@"7");

    if (FirstCandySelected == NO) {
        Candy7Selected.hidden = NO;
        FirstCandyPushed = 7;
        FirstCandyTypePushed = Candy7Type;
        FirstCandySelected = YES;
    }
    else{
        SecondCandyPushed = 7;
        SecondCandyTypePushed = Candy7Type;
        [self CheckSwap];
    }
    
    
}

-(IBAction)Candy8Button:(id)sender{
    NSLog(@"8");

    if (FirstCandySelected == NO) {
        Candy8Selected.hidden = NO;
        FirstCandyPushed = 8;
        FirstCandyTypePushed = Candy8Type;
        FirstCandySelected = YES;
    }
    else{
        SecondCandyPushed = 8;
        SecondCandyTypePushed = Candy8Type;
        [self CheckSwap];
    }
    
    
}

-(IBAction)Candy9Button:(id)sender{
    NSLog(@"9");

    if (FirstCandySelected == NO) {
        Candy9Selected.hidden = NO;
        FirstCandyPushed = 9;
        FirstCandyTypePushed = Candy9Type;
        FirstCandySelected = YES;
    }
    else{
        SecondCandyPushed = 9;
        SecondCandyTypePushed = Candy9Type;
        [self CheckSwap];
    }
    
    
}

-(IBAction)Candy10Button:(id)sender{
    NSLog(@"10");

    if (FirstCandySelected == NO) {
        Candy10Selected.hidden = NO;
        FirstCandyPushed = 10;
        FirstCandyTypePushed = Candy10Type;
        FirstCandySelected = YES;
    }
    else{
        SecondCandyPushed = 10;
        SecondCandyTypePushed = Candy10Type;
        [self CheckSwap];
    }
    
    
}

-(IBAction)Candy11Button:(id)sender{
    NSLog(@"11");

    if (FirstCandySelected == NO) {
        Candy11Selected.hidden = NO;
        FirstCandyPushed = 11;
        FirstCandyTypePushed = Candy11Type;
        FirstCandySelected = YES;
    }
    else{
        SecondCandyPushed = 11;
        SecondCandyTypePushed = Candy11Type;
        [self CheckSwap];
    }
    
}

-(IBAction)Candy12Button:(id)sender{
    NSLog(@"12");

    if (FirstCandySelected == NO) {
        Candy12Selected.hidden = NO;
        FirstCandyPushed = 12;
        FirstCandyTypePushed = Candy12Type;
        FirstCandySelected = YES;
    }
    else{
        SecondCandyPushed = 12;
        SecondCandyTypePushed = Candy12Type;
        [self CheckSwap];
    }
    
    
}

-(IBAction)Candy13Button:(id)sender{
    NSLog(@"13");

    if (FirstCandySelected == NO) {
        Candy13Selected.hidden = NO;
        FirstCandyPushed = 13;
        FirstCandyTypePushed = Candy13Type;
        FirstCandySelected = YES;
    }
    else{
        SecondCandyPushed = 13;
        SecondCandyTypePushed = Candy13Type;
        [self CheckSwap];
    }
    
    
}

-(IBAction)Candy14Button:(id)sender{
    NSLog(@"14");

    if (FirstCandySelected == NO) {
        Candy14Selected.hidden = NO;
        FirstCandyPushed = 14;
        FirstCandyTypePushed = Candy14Type;
        FirstCandySelected = YES;
    }
    else{
        SecondCandyPushed = 14;
        SecondCandyTypePushed = Candy14Type;
        [self CheckSwap];
    }
    
    
}

-(IBAction)Candy15Button:(id)sender{
    NSLog(@"15");

    if (FirstCandySelected == NO) {
        Candy15Selected.hidden = NO;
        FirstCandyPushed = 15;
        FirstCandyTypePushed = Candy15Type;
        FirstCandySelected = YES;
    }
    else{
        SecondCandyPushed = 15;
        SecondCandyTypePushed = Candy15Type;
        [self CheckSwap];
    }
    
}

-(IBAction)Candy16Button:(id)sender{
    NSLog(@"16");

    if (FirstCandySelected == NO) {
        Candy16Selected.hidden = NO;
        FirstCandyPushed = 16;
        FirstCandyTypePushed = Candy16Type;
        FirstCandySelected = YES;
    }
    else{
        SecondCandyPushed = 16;
        SecondCandyTypePushed = Candy16Type;
        [self CheckSwap];
    }
    
    
}

-(void)Candy1SelectedType{
    
    switch (Candy1Type) {
        case 0:
        {
            UIImage *buttonImage = [UIImage imageNamed:@"BlueCandy"];
            [Candy1 setImage:buttonImage forState:UIControlStateNormal];
            [self.view addSubview:Candy1];
        }
            break;
        case 1:
        {
            UIImage *buttonImage = [UIImage imageNamed:@"PinkCandy"];
            [Candy1 setImage:buttonImage forState:UIControlStateNormal];
            [self.view addSubview:Candy1];
        }
            break;
        case 2:
        {
            UIImage *buttonImage = [UIImage imageNamed:@"GreenCandy"];
            [Candy1 setImage:buttonImage forState:UIControlStateNormal];
            [self.view addSubview:Candy1];
        }
            break;
        case 3:
        {
            UIImage *buttonImage = [UIImage imageNamed:@"OrangeCandy"];
            [Candy1 setImage:buttonImage forState:UIControlStateNormal];
            [self.view addSubview:Candy1];
        }
            break;
            
        default:
            break;
    }
    
    
    
    
}

-(void)Candy2SelectedType{
    
    switch (Candy2Type) {
        case 0:
        {
            UIImage *buttonImage = [UIImage imageNamed:@"BlueCandy"];
            [Candy2 setImage:buttonImage forState:UIControlStateNormal];
            [self.view addSubview:Candy2];
        }
            break;
        case 1:
        {
            UIImage *buttonImage = [UIImage imageNamed:@"PinkCandy"];
            [Candy2 setImage:buttonImage forState:UIControlStateNormal];
            [self.view addSubview:Candy2];
        }
            break;
        case 2:
        {
            UIImage *buttonImage = [UIImage imageNamed:@"GreenCandy"];
            [Candy2 setImage:buttonImage forState:UIControlStateNormal];
            [self.view addSubview:Candy2];
        }
            break;
        case 3:
        {
            UIImage *buttonImage = [UIImage imageNamed:@"OrangeCandy"];
            [Candy2 setImage:buttonImage forState:UIControlStateNormal];
            [self.view addSubview:Candy2];
        }
            break;
            
        default:
            break;
    }
    
    
}
-(void)Candy3SelectedType{
    
    switch (Candy3Type) {
        case 0:
        {
            UIImage *buttonImage = [UIImage imageNamed:@"BlueCandy"];
            [Candy3 setImage:buttonImage forState:UIControlStateNormal];
            [self.view addSubview:Candy3];
        }
            break;
        case 1:
        {
            UIImage *buttonImage = [UIImage imageNamed:@"PinkCandy"];
            [Candy3 setImage:buttonImage forState:UIControlStateNormal];
            [self.view addSubview:Candy3];
        }
            break;
        case 2:
        {
            UIImage *buttonImage = [UIImage imageNamed:@"GreenCandy"];
            [Candy3 setImage:buttonImage forState:UIControlStateNormal];
            [self.view addSubview:Candy3];
        }
            break;
        case 3:
        {
            UIImage *buttonImage = [UIImage imageNamed:@"OrangeCandy"];
            [Candy3 setImage:buttonImage forState:UIControlStateNormal];
            [self.view addSubview:Candy3];
        }
            break;
            
        default:
            break;
    }
    
    
    
}
-(void)Candy4SelectedType{
    
    switch (Candy4Type) {
        case 0:
        {
            UIImage *buttonImage = [UIImage imageNamed:@"BlueCandy"];
            [Candy4 setImage:buttonImage forState:UIControlStateNormal];
            [self.view addSubview:Candy4];
        }
            break;
        case 1:
        {
            UIImage *buttonImage = [UIImage imageNamed:@"PinkCandy"];
            [Candy4 setImage:buttonImage forState:UIControlStateNormal];
            [self.view addSubview:Candy4];
        }
            break;
        case 2:
        {
            UIImage *buttonImage = [UIImage imageNamed:@"GreenCandy"];
            [Candy4 setImage:buttonImage forState:UIControlStateNormal];
            [self.view addSubview:Candy4];
        }
            break;
        case 3:
        {
            UIImage *buttonImage = [UIImage imageNamed:@"OrangeCandy"];
            [Candy4 setImage:buttonImage forState:UIControlStateNormal];
            [self.view addSubview:Candy4];
        }
            break;
            
        default:
            break;
    }
    
    
    
}
-(void)Candy5SelectedType{
    
    switch (Candy5Type) {
        case 0:
        {
            UIImage *buttonImage = [UIImage imageNamed:@"BlueCandy"];
            [Candy5 setImage:buttonImage forState:UIControlStateNormal];
            [self.view addSubview:Candy5];
        }
            break;
        case 1:
        {
            UIImage *buttonImage = [UIImage imageNamed:@"PinkCandy"];
            [Candy5 setImage:buttonImage forState:UIControlStateNormal];
            [self.view addSubview:Candy5];
        }
            break;
        case 2:
        {
            UIImage *buttonImage = [UIImage imageNamed:@"GreenCandy"];
            [Candy5 setImage:buttonImage forState:UIControlStateNormal];
            [self.view addSubview:Candy5];
        }
            break;
        case 3:
        {
            UIImage *buttonImage = [UIImage imageNamed:@"OrangeCandy"];
            [Candy5 setImage:buttonImage forState:UIControlStateNormal];
            [self.view addSubview:Candy5];
        }
            break;
            
        default:
            break;
    }
    
    
    
}
-(void)Candy6SelectedType{
    
    switch (Candy6Type) {
        case 0:
        {
            UIImage *buttonImage = [UIImage imageNamed:@"BlueCandy"];
            [Candy6 setImage:buttonImage forState:UIControlStateNormal];
            [self.view addSubview:Candy6];
        }
            break;
        case 1:
        {
            UIImage *buttonImage = [UIImage imageNamed:@"PinkCandy"];
            [Candy6 setImage:buttonImage forState:UIControlStateNormal];
            [self.view addSubview:Candy6];
        }
            break;
        case 2:
        {
            UIImage *buttonImage = [UIImage imageNamed:@"GreenCandy"];
            [Candy6 setImage:buttonImage forState:UIControlStateNormal];
            [self.view addSubview:Candy6];
        }
            break;
        case 3:
        {
            UIImage *buttonImage = [UIImage imageNamed:@"OrangeCandy"];
            [Candy6 setImage:buttonImage forState:UIControlStateNormal];
            [self.view addSubview:Candy6];
        }
            break;
            
        default:
            break;
    }
    
    
    
}
-(void)Candy7SelectedType{
    
    switch (Candy7Type) {
        case 0:
        {
            UIImage *buttonImage = [UIImage imageNamed:@"BlueCandy"];
            [Candy7 setImage:buttonImage forState:UIControlStateNormal];
            [self.view addSubview:Candy7];
        }
            break;
        case 1:
        {
            UIImage *buttonImage = [UIImage imageNamed:@"PinkCandy"];
            [Candy7 setImage:buttonImage forState:UIControlStateNormal];
            [self.view addSubview:Candy7];
        }
            break;
        case 2:
        {
            UIImage *buttonImage = [UIImage imageNamed:@"GreenCandy"];
            [Candy7 setImage:buttonImage forState:UIControlStateNormal];
            [self.view addSubview:Candy7];
        }
            break;
        case 3:
        {
            UIImage *buttonImage = [UIImage imageNamed:@"OrangeCandy"];
            [Candy7 setImage:buttonImage forState:UIControlStateNormal];
            [self.view addSubview:Candy7];
        }
            break;
            
        default:
            break;
    }
    
    
    
}
-(void)Candy8SelectedType{
    
    switch (Candy8Type) {
        case 0:
        {
            UIImage *buttonImage = [UIImage imageNamed:@"BlueCandy"];
            [Candy8 setImage:buttonImage forState:UIControlStateNormal];
            [self.view addSubview:Candy8];
        }
            break;
        case 1:
        {
            UIImage *buttonImage = [UIImage imageNamed:@"PinkCandy"];
            [Candy8 setImage:buttonImage forState:UIControlStateNormal];
            [self.view addSubview:Candy8];
        }
            break;
        case 2:
        {
            UIImage *buttonImage = [UIImage imageNamed:@"GreenCandy"];
            [Candy8 setImage:buttonImage forState:UIControlStateNormal];
            [self.view addSubview:Candy8];
        }
            break;
        case 3:
        {
            UIImage *buttonImage = [UIImage imageNamed:@"OrangeCandy"];
            [Candy8 setImage:buttonImage forState:UIControlStateNormal];
            [self.view addSubview:Candy8];
        }
            break;
            
        default:
            break;
    }
    
    
    
}
-(void)Candy9SelectedType{
    
    switch (Candy9Type) {
        case 0:
        {
            UIImage *buttonImage = [UIImage imageNamed:@"BlueCandy"];
            [Candy9 setImage:buttonImage forState:UIControlStateNormal];
            [self.view addSubview:Candy9];
        }
            break;
        case 1:
        {
            UIImage *buttonImage = [UIImage imageNamed:@"PinkCandy"];
            [Candy9 setImage:buttonImage forState:UIControlStateNormal];
            [self.view addSubview:Candy9];
        }
            break;
        case 2:
        {
            UIImage *buttonImage = [UIImage imageNamed:@"GreenCandy"];
            [Candy9 setImage:buttonImage forState:UIControlStateNormal];
            [self.view addSubview:Candy9];
        }
            break;
        case 3:
        {
            UIImage *buttonImage = [UIImage imageNamed:@"OrangeCandy"];
            [Candy9 setImage:buttonImage forState:UIControlStateNormal];
            [self.view addSubview:Candy9];
        }
            break;
            
        default:
            break;
    }
    
    
    
}
-(void)Candy10SelectedType{
    
    switch (Candy10Type) {
        case 0:
        {
            UIImage *buttonImage = [UIImage imageNamed:@"BlueCandy"];
            [Candy10 setImage:buttonImage forState:UIControlStateNormal];
            [self.view addSubview:Candy10];
        }
            break;
        case 1:
        {
            UIImage *buttonImage = [UIImage imageNamed:@"PinkCandy"];
            [Candy10 setImage:buttonImage forState:UIControlStateNormal];
            [self.view addSubview:Candy10];
        }
            break;
        case 2:
        {
            UIImage *buttonImage = [UIImage imageNamed:@"GreenCandy"];
            [Candy10 setImage:buttonImage forState:UIControlStateNormal];
            [self.view addSubview:Candy10];
        }
            break;
        case 3:
        {
            UIImage *buttonImage = [UIImage imageNamed:@"OrangeCandy"];
            [Candy10 setImage:buttonImage forState:UIControlStateNormal];
            [self.view addSubview:Candy10];
        }
            break;
            
        default:
            break;
    }
    
    
    
}
-(void)Candy11SelectedType{
    switch (Candy11Type) {
        case 0:
        {
            UIImage *buttonImage = [UIImage imageNamed:@"BlueCandy"];
            [Candy11 setImage:buttonImage forState:UIControlStateNormal];
            [self.view addSubview:Candy11];
        }
            break;
        case 1:
        {
            UIImage *buttonImage = [UIImage imageNamed:@"PinkCandy"];
            [Candy11 setImage:buttonImage forState:UIControlStateNormal];
            [self.view addSubview:Candy11];
        }
            break;
        case 2:
        {
            UIImage *buttonImage = [UIImage imageNamed:@"GreenCandy"];
            [Candy11 setImage:buttonImage forState:UIControlStateNormal];
            [self.view addSubview:Candy11];
        }
            break;
        case 3:
        {
            UIImage *buttonImage = [UIImage imageNamed:@"OrangeCandy"];
            [Candy11 setImage:buttonImage forState:UIControlStateNormal];
            [self.view addSubview:Candy11];
        }
            break;
            
        default:
            break;
    }
    
    
    
}
-(void)Candy12SelectedType{
    
    switch (Candy12Type) {
        case 0:
        {
            UIImage *buttonImage = [UIImage imageNamed:@"BlueCandy"];
            [Candy12 setImage:buttonImage forState:UIControlStateNormal];
            [self.view addSubview:Candy12];
        }
            break;
        case 1:
        {
            UIImage *buttonImage = [UIImage imageNamed:@"PinkCandy"];
            [Candy12 setImage:buttonImage forState:UIControlStateNormal];
            [self.view addSubview:Candy12];
        }
            break;
        case 2:
        {
            UIImage *buttonImage = [UIImage imageNamed:@"GreenCandy"];
            [Candy12 setImage:buttonImage forState:UIControlStateNormal];
            [self.view addSubview:Candy12];
        }
            break;
        case 3:
        {
            UIImage *buttonImage = [UIImage imageNamed:@"OrangeCandy"];
            [Candy12 setImage:buttonImage forState:UIControlStateNormal];
            [self.view addSubview:Candy12];
        }
            break;
            
        default:
            break;
    }
    
    
    
}
-(void)Candy13SelectedType{
    
    switch (Candy13Type) {
        case 0:
        {
            UIImage *buttonImage = [UIImage imageNamed:@"BlueCandy"];
            [Candy13 setImage:buttonImage forState:UIControlStateNormal];
            [self.view addSubview:Candy13];
        }
            break;
        case 1:
        {
            UIImage *buttonImage = [UIImage imageNamed:@"PinkCandy"];
            [Candy13 setImage:buttonImage forState:UIControlStateNormal];
            [self.view addSubview:Candy13];
        }
            break;
        case 2:
        {
            UIImage *buttonImage = [UIImage imageNamed:@"GreenCandy"];
            [Candy13 setImage:buttonImage forState:UIControlStateNormal];
            [self.view addSubview:Candy13];
        }
            break;
        case 3:
        {
            UIImage *buttonImage = [UIImage imageNamed:@"OrangeCandy"];
            [Candy13 setImage:buttonImage forState:UIControlStateNormal];
            [self.view addSubview:Candy13];
        }
            break;
            
        default:
            break;
    }
    
    
}
-(void)Candy14SelectedType{
    
    switch (Candy14Type) {
        case 0:
        {
            UIImage *buttonImage = [UIImage imageNamed:@"BlueCandy"];
            [Candy14 setImage:buttonImage forState:UIControlStateNormal];
            [self.view addSubview:Candy14];
        }
            break;
        case 1:
        {
            UIImage *buttonImage = [UIImage imageNamed:@"PinkCandy"];
            [Candy14 setImage:buttonImage forState:UIControlStateNormal];
            [self.view addSubview:Candy14];
        }
            break;
        case 2:
        {
            UIImage *buttonImage = [UIImage imageNamed:@"GreenCandy"];
            [Candy14 setImage:buttonImage forState:UIControlStateNormal];
            [self.view addSubview:Candy14];
        }
            break;
        case 3:
        {
            UIImage *buttonImage = [UIImage imageNamed:@"OrangeCandy"];
            [Candy14 setImage:buttonImage forState:UIControlStateNormal];
            [self.view addSubview:Candy14];
        }
            break;
            
        default:
            break;
    }
    
    
}
-(void)Candy15SelectedType{
    
    switch (Candy15Type) {
        case 0:
        {
            UIImage *buttonImage = [UIImage imageNamed:@"BlueCandy"];
            [Candy15 setImage:buttonImage forState:UIControlStateNormal];
            [self.view addSubview:Candy15];
        }
            break;
        case 1:
        {
            UIImage *buttonImage = [UIImage imageNamed:@"PinkCandy"];
            [Candy15 setImage:buttonImage forState:UIControlStateNormal];
            [self.view addSubview:Candy15];
        }
            break;
        case 2:
        {
            UIImage *buttonImage = [UIImage imageNamed:@"GreenCandy"];
            [Candy15 setImage:buttonImage forState:UIControlStateNormal];
            [self.view addSubview:Candy15];
        }
            break;
        case 3:
        {
            UIImage *buttonImage = [UIImage imageNamed:@"OrangeCandy"];
            [Candy15 setImage:buttonImage forState:UIControlStateNormal];
            [self.view addSubview:Candy15];
        }
            break;
            
        default:
            break;
    }
    
    
    
}
-(void)Candy16SelectedType{
    
    switch (Candy16Type) {
        case 0:
        {
            UIImage *buttonImage = [UIImage imageNamed:@"BlueCandy"];
            [Candy16 setImage:buttonImage forState:UIControlStateNormal];
            [self.view addSubview:Candy16];
        }
            break;
        case 1:
        {
            UIImage *buttonImage = [UIImage imageNamed:@"PinkCandy"];
            [Candy16 setImage:buttonImage forState:UIControlStateNormal];
            [self.view addSubview:Candy16];
        }
            break;
        case 2:
        {
            UIImage *buttonImage = [UIImage imageNamed:@"GreenCandy"];
            [Candy16 setImage:buttonImage forState:UIControlStateNormal];
            [self.view addSubview:Candy16];
        }
            break;
        case 3:
        {
            UIImage *buttonImage = [UIImage imageNamed:@"OrangeCandy"];
            [Candy16 setImage:buttonImage forState:UIControlStateNormal];
            [self.view addSubview:Candy16];
        }
            break;
            
        default:
            break;
    }
    
    
    
}





- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    
    candyScoreNumber = 0;
    MovesLeftNumber = 10;
    Score.text = [NSString stringWithFormat:@"Score: 0"];
    MovesLeft.text = [NSString stringWithFormat:@"Moves Left: 10"];
    
    GameFinished = NO;
    
    Exit.hidden = NO;
    
    
    Candy1Selected.hidden = YES;
    Candy2Selected.hidden = YES;
    Candy3Selected.hidden = YES;
    Candy4Selected.hidden = YES;
    Candy5Selected.hidden = YES;
    Candy6Selected.hidden = YES;
    Candy7Selected.hidden = YES;
    Candy8Selected.hidden = YES;
    Candy9Selected.hidden = YES;
    Candy10Selected.hidden = YES;
    Candy11Selected.hidden = YES;
    Candy12Selected.hidden = YES;
    Candy13Selected.hidden = YES;
    Candy14Selected.hidden = YES;
    Candy15Selected.hidden = YES;
    Candy16Selected.hidden = YES;
    
    Candy1Type = arc4random() %4;
    Candy2Type = arc4random() %4;
    Candy3Type = arc4random() %4;
    Candy4Type = arc4random() %4;
    Candy5Type = arc4random() %4;
    Candy6Type = arc4random() %4;
    Candy7Type = arc4random() %4;
    Candy8Type = arc4random() %4;
    Candy9Type = arc4random() %4;
    Candy10Type = arc4random() %4;
    Candy11Type = arc4random() %4;
    Candy12Type = arc4random() %4;
    Candy13Type = arc4random() %4;
    Candy14Type = arc4random() %4;
    Candy15Type = arc4random() %4;
    Candy16Type = arc4random() %4;
    
    [self Candy1SelectedType];
    [self Candy2SelectedType];
    [self Candy3SelectedType];
    [self Candy4SelectedType];
    [self Candy5SelectedType];
    [self Candy6SelectedType];
    [self Candy7SelectedType];
    [self Candy8SelectedType];
    [self Candy9SelectedType];
    [self Candy10SelectedType];
    [self Candy11SelectedType];
    [self Candy12SelectedType];
    [self Candy13SelectedType];
    [self Candy14SelectedType];
    [self Candy15SelectedType];
    [self Candy16SelectedType];
    
    [self performSelector:@selector(CheckConnection) withObject:self afterDelay:0.3];
    
    candyHighScoreNumber = [[NSUserDefaults standardUserDefaults] integerForKey:@"HighScoreSaved"];
    HighScore.text = [NSString stringWithFormat:@"High Score: %li", (long)candyHighScoreNumber];
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}






 

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
