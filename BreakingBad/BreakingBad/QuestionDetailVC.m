//
//  questionDetailVC.m
//  BreakingBad
//
//  Created by Zoufishan Mehdi on 10/12/15.
//  Copyright © 2015 Zoufishan Mehdi. All rights reserved.
//

#import "QuestionDetailVC.h"
#import "ViewController.h"
#import "SharedManager.h"

@interface QuestionDetailVC () <AVSpeechSynthesizerDelegate>


@end


@implementation QuestionDetailVC


- (void)viewDidLoad{
    [super viewDidLoad];
    
    self.questionLabel.text = self.question;
    if (self.answer) {
        self.answerTextView.text = self.answer;
        
        
        AVSpeechSynthesizer *synthesizer = [[AVSpeechSynthesizer alloc] init];
        synthesizer.delegate = self;
        
        AVSpeechUtterance *utterance = [[AVSpeechUtterance alloc] initWithString:self.question];
        utterance.pitchMultiplier = 1.25; // higher pitch
        utterance.voice = [AVSpeechSynthesisVoice voiceWithLanguage:@"fr-FR"];
        
        [synthesizer speakUtterance:utterance];
    }
    
    [self addColorQuestionDetail];
    
    //READ QUESTION
//   [self.questionLabel resignFirstResponder];
//    AVSpeechUtterance *utterance = [[AVSpeechUtterance alloc] initWithString:self.questionLabel.text];
//    //[self.synthesizer speakUtterance:utterance];
//    utterance.rate = AVSpeechUtteranceMinimumSpeechRate*( 10.0);
//    utterance.voice = [AVSpeechSynthesisVoice voiceWithLanguage:@"en-au"];
//    [self.synthesizer speakUtterance:utterance];

}


-(void)addColorQuestionDetail {
    
    self.questionDetailView.backgroundColor = [SharedManager sharedModel].colesiumGrey;
    self.questionLabel.textColor = [SharedManager sharedModel].brickRed;

    self.answerTextView.backgroundColor = [SharedManager sharedModel].blueSky;
    
    self.doneButton.layer.borderWidth = 3.5;
    self.doneButton.layer.borderColor = [SharedManager sharedModel].tropicalDream.CGColor;
    self.doneButton.backgroundColor = [SharedManager sharedModel].brickRed;
    self.doneButton.layer.cornerRadius = 22;
    self.doneButton.tintColor = [SharedManager sharedModel].brownForest;
    
}



-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    [self.answerTextView resignFirstResponder];
}


- (IBAction)doneButtonTapped:(UIButton *)sender {
    [self.delegate finishedAnswering:self withAnswer:self.answerTextView.text];
    [self dismissViewControllerAnimated:YES completion:nil];

}




@end
