//
//  MyHabitsTVC.m
//  BreakingBad
//
//  Created by Zoufishan Mehdi on 10/16/15.
//  Copyright © 2015 Zoufishan Mehdi. All rights reserved.
//

#import "MyHabitsTVC.h"
#import "Habit.h"
#import "EntryLogsTableViewController.h"
#import <Parse/Parse.h>
#import <AFNetworking/AFNetworking.h>
#import "SharedManager.h"

@interface MyHabitsTVC ()

////properties to add color to
@property (strong, nonatomic) IBOutlet UITableView *myHabitsTableView;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *doneButton;

//animation properties
@property (nonatomic, assign) BOOL animationInProgress;
@property (nonatomic, assign) UIViewAnimationOptions animation1;


@end

@implementation MyHabitsTVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"My Habits";
    NSDictionary *titleAttributes =@{
                                  NSFontAttributeName :[UIFont fontWithName:@"Bariol" size:25.0],
                                  NSForegroundColorAttributeName : [SharedManager sharedModel].brownForest,
                                  //NSBackgroundColorAttributeName : [SharedManager sharedModel].tropicalDream
                                  
                                  };

    self.navigationController.navigationBar.titleTextAttributes = titleAttributes;
    
    
    [self addColorMyHabits];
}

-(void)viewDidAppear:(BOOL)animated {
    
    //
    NSArray *inspQuotesArray = @[
                            @"Nurture your mind with great thoughts. To believe in the heroic makes heroes. - Benjami Disraeli",
                            @"The real opportunity for success lies within the person and not in the job. – Zig Ziglar135",
                            @"Look at the sparrows; they do not know what they will do in the next moment. Let us literally live from moment to moment. – Mahatma Gandhi",
                            @"Luck is a dividend of sweat. The more you sweat, the luckier you get. – Ray Kroc",
                            @"When I let go of what I am, I become what I might be. – Lao Tzu",
                            @"You may find the worst enemy or best friend in yourself. – English Proverb",
                            @"Whoever loves much, performs much, and can accomplish much, and what is done in love is done well. – Vincent Van Gogh",
                            @"Courage is the first of human qualities because it is the quality which guarantees all others. – Winston Churchill",
                            @"The great thing in this world is not so much where you stand, as in what direction you are moving. – Oliver Wendell Holmes",
                            @"Live each day as if your life had just begun. – Johann Wolfgang Von Goethe",
                            @"Every truth passes through three stages before it is recognized. In the first, it is ridiculed. In the second, it is opposed. In the third, it is regarded as self evident. – Arthur Schopenhauer",
                            @"Either you run the day, or the day runs you. – Jim Rohn",
                            @"The difference between a successful person and others is not lack of strength not a lack of knowledge but rather a lack of will. – Vince Lombardi",
                            @"If not us, who? If not now, when? – John F. Kennedy",
                            @"Don’t worry about failures, worry about the chances you miss when you don’t even try. – Jack Canfield"
                            
                            ];
    
  
    



    //                       “Though no one can go back and make a brand new start, anyone can start from now and make a brand new ending.”
    //                       – Carl Bard
    //                       “Life has two rules: #1 Never quit #2 Always remember rule # 1.”
    //                       – Unknown
    //                       “Some men see things as they are and say why – I dream things that never were and say why not.”
    //                       – George Bernard Shaw
    //                       “The only way of finding the limits of the possible is by going beyond them into the impossible.”
    //                       – Arthur C. Clarke
    //                       “I don’t know the key to success, but the key to failure is trying to please everybody.”
    //                       – Bill Cosby
    //                       Ralph Waldo Emerson
    //                       Ralph Waldo Emerson (Photo credit: Wikimedia Commons)
    //                       “Do not go where the path may lead, go instead where there is no path and leave a trail.”
    //                       – Ralph Waldo Emerson
    //                       “Many of life’s failures are experienced by people who did not realize how close they were to success when they gave up.”
    //                       – Thomas Edison
    //                       “Education costs money. But then so does ignorance.”
    //                       – Sir Claus Moser
    //                       “The journey of a thousand miles begins with one step.”
    //                       – Lao Tzu
    //                       “Every noble work is at first impossible.”
    //                       – Thomas Carlyle
    //                       “Do not let what you cannot do interfere with what you can do.”
    //                       – John Wooden
    //                       “Defeat is not bitter unless you swallow it.”
    //                       – Joe Clark
    //                       “Nobody ever wrote down a plan to be broke, fat, lazy, or stupid. Those things are what happen when you don’t have a plan.”
    //                       – Larry Winget
    //                       “Rule #1 of life. Do what makes YOU happy.”
    //                       – Unknown
    //                       “The best revenge is massive success.”
    //                       – Frank Sinatra
    //                       “It is not enough to aim, you must hit.”
    //                       – Italian Proverb
    //                       “Challenges are what make life interesting and overcoming them is what makes life meaningful.”
    //                       – Joshua J. Marine
    //                       “Every strike brings me closer to the next home run.”
    //                       – Babe Ruth
    //                       “Challenges are what make life interesting and overcoming them is what makes life meaningful.”
    //                       – Joshua J. Marine
    //                       “An obstacle is often a stepping stone.”
    //                       – Prescott
    //                       “I am not a product of my circumstances. I am a product of my decisions.”
    //                       – Stephen Covey
    //                       Martin Luther King Jr.
    //                       Martin Luther King Jr.
    //                       “Our lives begin to end the day we become silent about things that matter.”
    //                       – Martin Luther King Jr.
    //                       “Keep away from people who try to belittle your ambitions. Small people always do that, but the really great makes you feel that you, too, can become great.”
    //                       – Mark Twain
    //                       “Eighty percent of success is showing up.”
    //                       – Woody Allen
    //                       “I have never in my life learned anything from any man who agreed with me.”
    //                       – Dudley Field Malone
    //                       “I am thankful for all of those who said NO to me. Its because of them I’m doing it myself.”
    //                       – Albert Einstein
    //                       “We become what we think about.”
    //                       – Earl Nightingale
    //                       “The mind is everything. What you think you become.”
    //                       – Buddha
    //                       
    //              =
    //
    //
    //            ];
    
    
    
    UIView *inspQuoteView = [[UIView alloc] init];
    inspQuoteView.frame = CGRectMake(0, self.view.bounds.size.height-185, self.view.bounds.size.width, 130);
    //CGRectMake(23, 459, 332, 130);
    
    
    inspQuoteView.backgroundColor = [SharedManager sharedModel].colesiumGrey;
    
    UILabel *quotesLabel = [[UILabel alloc] init];
    quotesLabel.frame = inspQuoteView.bounds;
    quotesLabel.textColor = [SharedManager sharedModel].brownForest;
     quotesLabel.frame = CGRectMake(5, 25, self.view.bounds.size.width-5, 80);
    [quotesLabel setLineBreakMode:NSLineBreakByWordWrapping];
    quotesLabel.numberOfLines  = 0;
    
    //NSArray *quotesArray = nil; // self.quotesArray
    if (inspQuotesArray.count > 0) {
        quotesLabel.text = inspQuotesArray[arc4random() % inspQuotesArray.count];
    }
    
    [inspQuoteView addSubview:quotesLabel];
    [self.view addSubview:inspQuoteView];
    
    
    
    //Animation
    
    [UIView animateKeyframesWithDuration:0.5
                                   delay:0.0
                                 options:self.animation1
                              animations:^{
                                  inspQuoteView.frame = CGRectMake(inspQuoteView.frame.origin.x + 200, inspQuoteView.frame.origin.y, inspQuoteView.frame.size.width, inspQuoteView.frame.size.height);
                              }
                              completion:^(BOOL finished) {
                                  [UIView animateKeyframesWithDuration:0.5
                                                                 delay:0.0
                                                               options:self.animation1
                                                            animations:^{
                                                                inspQuoteView.frame = CGRectMake(inspQuoteView.frame.origin.x - 200, inspQuoteView.frame.origin.y, inspQuoteView.frame.size.width, inspQuoteView.frame.size.height);
                                                            }
                                                            completion:^(BOOL finished) {
                                                                self.animationInProgress = NO;
                                                            }];
                              }];
}


-(void)addColorMyHabits {
    
   self.myHabitsTableView.backgroundColor = [SharedManager sharedModel].icyNight;
    
}


#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.habitsArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"myHabitsCell" forIndexPath:indexPath];
    Habit *habit = self.habitsArray[indexPath.row];
    cell.textLabel.text = habit.name;
    cell.textLabel.textColor = [SharedManager sharedModel].brownForest;
    cell.textLabel.font = [UIFont fontWithName:@"Bariol" size:22.0];
    cell.backgroundColor = [SharedManager sharedModel].icyNight;
    
    return cell;
}


- (IBAction)doneButtonTapped:(UIBarButtonItem *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    EntryLogsTableViewController *eltvc = (EntryLogsTableViewController *)[self.storyboard instantiateViewControllerWithIdentifier:@"entryLogsID"];
    
    eltvc.habit = self.habitsArray[indexPath.row];
    [self.navigationController pushViewController:eltvc animated:YES];
    
}



@end
