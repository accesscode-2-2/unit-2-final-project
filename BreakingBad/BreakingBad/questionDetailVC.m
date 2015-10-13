//
//  questionDetailVC.m
//  BreakingBad
//
//  Created by Zoufishan Mehdi on 10/12/15.
//  Copyright © 2015 Zoufishan Mehdi. All rights reserved.
//

#import "questionDetailVC.h"
#import "ViewController.h"

@interface questionDetailVC ()
@property (weak, nonatomic) IBOutlet UILabel *questionLabel;
@property (weak, nonatomic) IBOutlet UITextView *answerTextView;

@end


@implementation questionDetailVC


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(UIButton *)sender {
    NSString *title = sender.currentTitle;
    // do what you need with the title
    title = self.questionLabel.text;
}


//for (UIButton* button in _question) {
//    if(button.tag==1){
//        //add text
//        
//        
//    } if(button.tag==2){
//        //add text
//        
//    } if(button.tag==3){
//        
//        //add text
//    } if(button.tag==4){
//        
//        //add text
//    } if(button.tag==5){
//        
//        //add text
//    } if(button.tag==6){
//        
//        //add text
//    }
//    
//}



@end
