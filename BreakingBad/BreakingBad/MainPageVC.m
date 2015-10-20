//
//  MainPageVC.m
//  BreakingBad
//
//  Created by Zoufishan Mehdi on 10/13/15.
//  Copyright © 2015 Zoufishan Mehdi. All rights reserved.
//

#import "MainPageVC.h"
#import "BBUser.h"
#import "Habit.h"
#import "Entry.h"
#import "SharedManager.h"
#import "YALContextMenuTableView.h"
#import "CustomContextTableViewCell.h"
#import "CheckProgressViewController.h"
#import "QuestionDetailVC.h"
#import "MyHabitsTVC.h"
#import "HabitInfoTVC.h"
#import <CoreLocation/CoreLocation.h>
#import <AFNetworking/AFNetworking.h>

NSString const *WEATHERAPIKEY = @"6cc63d13a4dd0826b7383ef753a32";

@interface MainPageVC ()
<
UIPickerViewDataSource,
UIPickerViewDelegate,
UITableViewDataSource,
UITableViewDelegate,
QuestionDetailVCDelegate,
CLLocationManagerDelegate
>

@property (weak, nonatomic) IBOutlet UIPickerView *habitPickerView;
//@property (weak, nonatomic) IBOutlet UIButton *doneButton;

@property (strong, nonatomic) IBOutletCollection(UILabel) NSArray *reply;
@property (nonatomic) YALContextMenuTableView *contextMenuTableView;
@property (nonatomic) NSArray *menuTitles;
@property (nonatomic) NSArray *menuIcons;

@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *questionsArray;
@property (nonatomic) NSArray *habitsArray;

@property (nonatomic) BBUser *user;
@property (nonatomic) Habit *habit;

//@property (weak, nonatomic) IBOutlet UILabel *habitLabel;


////properties to add color to
@property (weak, nonatomic) IBOutlet UIView *habitView;
@property (weak, nonatomic) IBOutlet UIButton *doneButton;
@property (weak, nonatomic) IBOutlet UILabel *habitLabel;
@property (weak, nonatomic) IBOutlet UILabel *habitLftLabel;
@property (weak, nonatomic) IBOutlet UIButton *menuIconButton;
@property (strong, nonatomic) IBOutletCollection(UIView) NSArray *oddViews;
@property (strong, nonatomic) IBOutletCollection(UIView) NSArray *evenViews;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *oddButtons;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *evenButtons;
@property (strong, nonatomic) IBOutletCollection(UILabel) NSArray *oddLabels;
@property (strong, nonatomic) IBOutletCollection(UILabel) NSArray *evenLabels;


@end

@implementation MainPageVC{
    CLLocationManager *locationManager;
}

#pragma mark- viewDidLoad 

- (void)viewDidLoad{
    [super viewDidLoad];
    self.habitPickerView.delegate = self;
    [self answersFromPreviousScreen];
    [self initiateMenuOptions];
    [[self.navigationController navigationBar]setHidden:YES];
    
    self.habitLabel.hidden = YES;
    
    [self addColorsMainPg];
    
    //    self.habitsArray = [NSMutableArray new];
    //    HabitList *hl = [HabitList new];
    //    self.habitsArray = hl.habitsList;
    
    //[self.habitPickerView selectRow:[SharedManager sharedModel].selectedRow inComponent:0 animated:YES];
    
    //    BBUser *currentUser = (BBUser *)[PFUser currentUser];
    //        [currentUser objectForKey:@"habits"];
    //        [currentUser fetchIfNeededInBackgroundWithBlock:^(PFObject * _Nullable object, NSError * _Nullable error) {
    //          NSLog(@"%@",object);
    //        }];
    //    PFQuery *query = [PFUser query];
    //
    //    [query whereKey:@"username" equalTo:[currentUser username]];
    //
    //    [query getFirstObjectInBackgroundWithBlock:^(PFObject * _Nullable object, NSError * _Nullable error) {
    //        NSLog(@"Object: %@", object);
    //        NSLog(@"Habits: %@", [object objectForKey:@"habtis"]);
    //    }];
    
    
    __weak typeof(self) weakSelf = self;
    PFQuery *query = [PFQuery queryWithClassName:@"Habit"];
    [query includeKey:@"entries"];
    [query findObjectsInBackgroundWithBlock:^(NSArray * _Nullable objects, NSError * _Nullable error) {
        weakSelf.habitsArray = objects;
        [weakSelf.habitPickerView reloadAllComponents];
    }];
}



#pragma mark- Add colors

-(void)addColorsMainPg {
    
   self.habitView.backgroundColor = [SharedManager sharedModel].icyNight;
    
    for (UIView *aquaView in self.oddViews)
    {
        aquaView.backgroundColor = [SharedManager sharedModel].icyNight;
    }
    
    for (UIView *aquaView in self.evenViews)
    {
        aquaView.backgroundColor = [SharedManager sharedModel].blueSky;
    }
    
}

//self.headerBackgroundView.backgroundColor = [PresetTimerData sharedModel].ghostGrey;
//self.lapButton.layer.borderWidth = 2.5;
//self.lapButton.layer.borderColor = [PresetTimerData sharedModel].glacierBlue.CGColor;
//self.lapButton.backgroundColor = [PresetTimerData sharedModel].glacierBlue;
//self.lapButton.layer.cornerRadius = 25;
//self.lapButton.tintColor = [PresetTimerData sharedModel].burntOrange;
//self.timeLabel.textColor = [PresetTimerData sharedModel].eggplant;
//self.timeLabel.layer.borderWidth = 15;
//self.timeLabel.layer.borderColor = [PresetTimerData sharedModel].steelBlueGrey.CGColor;
//self.timeLabel.layer.cornerRadius =10;
//
//self.lapTimeLabel.textColor = [PresetTimerData sharedModel].burntOrange;
//self.lapTableView.backgroundColor = [PresetTimerData sharedModel].ghostGrey;



#pragma Question Buttons Method

- (IBAction)questionButtonTapped:(UIButton *)sender {
    QuestionDetailVC *qvc = (QuestionDetailVC *)[self.storyboard instantiateViewControllerWithIdentifier:@"showQDetailSegue"];
    qvc.question = sender.titleLabel.text;
    qvc.delegate = self;
    qvc.tag = sender.tag;
    
    UILabel *currentAnswerLabel = self.reply[sender.tag];
    if (currentAnswerLabel.text) {
        qvc.answer = currentAnswerLabel.text;
    }
    
    [self presentViewController:qvc animated:YES completion:nil];
}
#pragma mark
#pragma Question Detail View Delegate Method
- (void)finishedAnswering:(QuestionDetailVC *)qvc withAnswer:(NSString *)answer {
    for(int i=0; i < self.questionsArray.count; i++)
    {
        UIButton *currentButton = (UIButton *)self.questionsArray[i];
        if(qvc.tag == currentButton.tag)
        {
            UILabel *currentAnswerLabel = (UILabel *)self.reply[i];
            
            currentAnswerLabel.text = answer;
            
            NSString *tagString = [NSString stringWithFormat:@"%ld",(long)qvc.tag];
            
            [[SharedManager sharedModel].answersDictionary setObject:answer forKey:tagString];
            
            self.entry = [Entry new];
            
            self.entry.entryLog = answer;
            
            [self.habit.entries addObject:self.entry];
        }
    }
}

-(NSString *)formattedDateStringForAPI:(NSDate *)date{
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"YYYY-MM-dd"];
    
    NSString *dateString = [dateFormatter stringFromDate:date];
    
    return dateString;
}

#pragma mark
#pragma Context Menu methods
- (IBAction)menuButtonTapped:(UIButton *)sender {
    if(!self.contextMenuTableView){
        self.contextMenuTableView = [[YALContextMenuTableView alloc] initWithTableViewDelegateDataSource:self];
        self.contextMenuTableView.delegate = self;
        self.contextMenuTableView.animationDuration = 0.15;
        //register nib
        
        UINib *cellNib = [UINib nibWithNibName:@"CustomContextTableViewCell" bundle:nil];
        [self.contextMenuTableView registerNib:cellNib forCellReuseIdentifier:@"contextMenuCellReuseId"];
    }
    // it is better to use this method only for proper animation
    self.contextMenuTableView.animationDuration = 0.15;
    [self.contextMenuTableView showInView:self.view withEdgeInsets:UIEdgeInsetsZero animated:YES];
}

- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation{
    //should be called after rotation animation completed
    [self.contextMenuTableView reloadData];
}

- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration {
    [super willRotateToInterfaceOrientation:toInterfaceOrientation duration:duration];
    
    [self.contextMenuTableView updateAlongsideRotation];
}

- (void)viewWillTransitionToSize:(CGSize)size
       withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator {
    
    [super viewWillTransitionToSize:size withTransitionCoordinator:coordinator];
    
    
    [coordinator animateAlongsideTransition:nil completion:^(id<UIViewControllerTransitionCoordinatorContext> context) {
        //should be called after rotation animation completed
        [self.contextMenuTableView reloadData];
    }];
    [self.contextMenuTableView updateAlongsideRotation];
}

- (void)initiateMenuOptions {
    self.menuTitles = @[@"",
                        @"My Habits",
                        @"Check Progress",
                        @"Set Goals",
                        @"Info",
                        @"Save"];
    
    self.menuIcons = @[[UIImage imageNamed:@"cancel"],
                       [UIImage imageNamed:@"my_habits"],
                       [UIImage imageNamed:@"check_progress"],
                       [UIImage imageNamed:@"goals"],
                       [UIImage imageNamed:@"info"],
                       [UIImage imageNamed:@"save"]];
}

#pragma mark
#pragma Values from Singleton
- (IBAction)doneButtonTapped:(UIButton *)sender {
    
    NSInteger selectedIdx = [self.habitPickerView selectedRowInComponent:0];
    Habit *selectedHabit = self.habitsArray[selectedIdx];
    
    Entry *newEntry = [Entry new];
    
    NSMutableDictionary *entryDictionary = [[NSMutableDictionary alloc] init];
    for(int i=0; i < self.questionsArray.count; i++)
    {
        // UIButton *currentButton = (UIButton *)self.questionsArray[i];
        UILabel *label = (UILabel *)self.reply[i];
        
        NSString *key = [NSString stringWithFormat:@"%d", i];
        NSString *value = label.text;
        
        entryDictionary[key] = value;
    }
    
    newEntry.logs = entryDictionary;
    NSString *dateString = [self formattedDateStringForAPI:newEntry.createdAt];
    
    float latitude = locationManager.location.coordinate.latitude;
    float longitude = locationManager.location.coordinate.longitude;
    
    NSLog(@"lat: %f, long: %f",latitude, longitude);
    
    //@"api.worldweatheronline.com/free/v2/past-weather.ashx?&format=json&date=2015-08-18&tp=24"

    
//    NSString *urlString = [NSString stringWithFormat:@"https://api.worldweatheronline.com/free/v2/past-weather.ashx?q=%20%@%%2C%@&format=json&date=%@&tp=24&key=%@",latString,longString,dateString, WEATHERAPIKEY];
    NSString *urlString = [NSString stringWithFormat:@"https://api.worldweatheronline.com/free/v2/past-weather.ashx?q=%20%f%%2C%f&format=json&date=%@&tp=24&key=%@",latitude,longitude,dateString,WEATHERAPIKEY];
    
    NSLog(@"%@",urlString);
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:urlString parameters:nil success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        
        NSDictionary *data = responseObject[@"data"];
        NSArray *weatherData = data[@"weather"];
        NSLog(@"%@", weatherData);
        
        NSDictionary *dict = weatherData[0];
        NSArray *hourlyDataArray = dict[@"hourly"];
        NSDictionary *hourlyDataDictionary = hourlyDataArray[0];
        NSString *tempF = hourlyDataDictionary[@"tempF"];
        newEntry.temperature = tempF;
        NSLog(@"%@",newEntry);
        
        [selectedHabit.entries addObject:newEntry];
        [selectedHabit saveInBackground];
        
    } failure:^(AFHTTPRequestOperation * _Nonnull operation, NSError * _Nonnull error) {
        NSLog(@"Could not get weather data:-");
        NSLog(@"%@",error.localizedDescription);
    }];
    
    
}

- (void)answersFromPreviousScreen{
    NSArray *allkeys = [[[SharedManager sharedModel] answersDictionary] allKeys];
    for(NSString *key in allkeys)
    {
        NSInteger tag = [key integerValue];
        for(int i=0; i < self.questionsArray.count; i++)
        {
            UIButton *currentQuestionButton = (UIButton *)self.questionsArray[i];
            if(tag == currentQuestionButton.tag)
            {
                UILabel *answerLabel = self.reply[i];
                answerLabel.text = [[SharedManager sharedModel].answersDictionary objectForKey:key];
                break;
            }
        }
    }
}




#pragma mark - YALContextMenuTableViewDelegate

- (void)contextMenuTableView:(YALContextMenuTableView *)contextMenuTableView didDismissWithIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"Menu dismissed with indexpath = %@", indexPath);
}

#pragma mark - UITableViewDataSource, UITableViewDelegate

- (void)tableView:(YALContextMenuTableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    //self.contextMenuTableView.animationDuration = 0.15;
    
    if (indexPath.row == 1) {
        [tableView dismisWithIndexPath:indexPath];
        
        [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(showMyHabits) userInfo:nil repeats:NO];
        
    }
    
    if(indexPath.row == 2){
        CheckProgressViewController *cp = (CheckProgressViewController *)[self.storyboard instantiateViewControllerWithIdentifier:@"checkProgressID"];
        [self presentViewController:cp animated:YES completion:nil];
    }
    
    else if (indexPath.row == 4) {
        
        [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(showHabitsInfo) userInfo:nil repeats:NO];
        
    }
    else if (indexPath.row ==  5){
        [self.user saveInBackground];
    }
    
    [tableView dismisWithIndexPath:indexPath];
    
}

- (void)showHabitsInfo{
    UINavigationController *navigationController = [self.storyboard instantiateViewControllerWithIdentifier:@"HabitInfoNav"];
    
    HabitInfoTVC *hInfo = (HabitInfoTVC *) navigationController.topViewController;
    
    hInfo.habitsArray = self.habitsArray;
    
    [self presentViewController:navigationController animated:YES completion:nil];
}

- (void)showMyHabits{
    
    UINavigationController *navigationController = (UINavigationController *)[self.storyboard instantiateViewControllerWithIdentifier:@"habitsSegue"];
    
    MyHabitsTVC *controller = (MyHabitsTVC *)navigationController.topViewController;
    controller.habitsArray = self.habitsArray;
    
    [self presentViewController:navigationController animated:YES completion:nil];
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.menuTitles.count;
}

- (UITableViewCell *)tableView:(YALContextMenuTableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    CustomContextTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"contextMenuCellReuseId" forIndexPath:indexPath];
    
    if (cell) {
        cell.backgroundColor = [UIColor clearColor];
        cell.menuTitleLabel.text = [self.menuTitles objectAtIndex:indexPath.row];
        cell.menuTitleImage.image = [self.menuIcons objectAtIndex:indexPath.row];
        cell.viewHoldingImageView.backgroundColor =  [SharedManager sharedModel].brickRed;
    }
    
    return cell;
}

#pragma mark
#pragma Life Cycle Methods

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    if (self.readOnly) {
        self.navigationController.navigationBar.hidden = NO;
        self.habitPickerView.hidden = YES;
        self.habitLabel.hidden = NO;
        self.habitLabel.text = self.habitName;
        NSArray *allKeys = [self.entry.logs allKeys];
        
        for(NSString *key in allKeys){
            NSInteger tag = [key integerValue];
            
            for(int i=0; i < self.questionsArray.count; i++)
            {
                UIButton *currentButton = (UIButton *)self.questionsArray[i];
                if(tag == currentButton.tag)
                {
                    UILabel *currentLabel = (UILabel *)self.reply[i];
                    currentLabel.text = [self.entry.logs objectForKey:key];
                }
            }
            
        }
    }
}

- (void)viewDidLoad{
    [super viewDidLoad];
    self.habitPickerView.delegate = self;
    [self answersFromPreviousScreen];
    [self initiateMenuOptions];
    [[self.navigationController navigationBar]setHidden:YES];
    
    self.habitLabel.hidden = YES;
    [self setUpLocationManager];
    
    __weak typeof(self) weakSelf = self;
    PFQuery *query = [PFQuery queryWithClassName:@"Habit"];
    [query includeKey:@"entries"];
    [query findObjectsInBackgroundWithBlock:^(NSArray * _Nullable objects, NSError * _Nullable error) {
        weakSelf.habitsArray = objects;
        [weakSelf.habitPickerView reloadAllComponents];
    }];
}

- (void)locationManager:(CLLocationManager *)manager
    didUpdateToLocation:(CLLocation *)newLocation
           fromLocation:(CLLocation *)oldLocation
{
    [locationManager stopUpdatingLocation];
    
    CLGeocoder * geoCoder = [[CLGeocoder alloc] init];
    [geoCoder reverseGeocodeLocation:newLocation
                   completionHandler:^(NSArray *placemarks, NSError *error) {
                       NSString *locString = placemarks.count ? [placemarks.firstObject locality] : @"Not Found";
                       NSLog(@"This is your city: %@",locString);
                   }];
}

- (void)setUpLocationManager{
    locationManager = [[CLLocationManager alloc] init];
    locationManager.distanceFilter = kCLDistanceFilterNone;
    locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    [locationManager startUpdatingLocation];
    locationManager.delegate = self;
    [locationManager requestWhenInUseAuthorization];
}
#pragma mark
#pragma UIPickerView DataSource Methods

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    
    return self.habitsArray.count;
}

- (nullable NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    return ((Habit *)self.habitsArray[row]).name;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    
    for(int i=0; i<self.questionsArray.count;i++){
        UILabel *currentLabel = self.reply[i];
        if(!(currentLabel.text == nil)){
            currentLabel.text = @" ";
        }
    }
}

-(void)prepareForSegue:(nonnull UIStoryboardSegue *)segue sender:(nullable id)sender {
    
}

@end
