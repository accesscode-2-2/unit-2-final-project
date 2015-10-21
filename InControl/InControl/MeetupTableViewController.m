//
//  MeetupTableViewController.m
//  InControl
//
//  Created by Artur Lan on 10/18/15.
//  Copyright © 2015 Diana Elezaj. All rights reserved.
//

#import "MeetupTableViewController.h"
#import "APIManager.h"
#import "MeetupTableViewCell.h"
#import <CoreLocation/CoreLocation.h>

@interface MeetupTableViewController ()

@property (nonatomic) NSMutableArray *meetupData;
@property (nonatomic) CLLocationCoordinate2D location;
@end

@implementation MeetupTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"Meetup";

    [self makeApPIRequestWithNewTerm:self.city callbackBlock:^{
        [self.tableView reloadData];
    }];
}

- (void)makeApPIRequestWithNewTerm:(NSString *)searchTerm
                     callbackBlock:(void(^)())block {
    
    NSString *meetupURL = [NSString stringWithFormat:@"https://api.meetup.com/2/groups?lat=51&lon=-0.1&page=20&key=1f5718c16a7fb3a5452f45193232"];
    
    
    
    NSString *encodedString = [meetupURL stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    
    NSURL *url = [NSURL URLWithString:encodedString];
    
    NSLog(@"%@", url);
    
    [APIManager GETRequestWithURL:url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        self.meetupData = [json objectForKey:@"results"];
        
        NSLog(@"%@", json);

        
        [self.tableView reloadData];
    }];
}

- (void) viewWillAppear:(BOOL)animated
{
    
    [self.navigationController setNavigationBarHidden:NO animated:animated];
    
}


- (void) viewWillDisappear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:YES animated:animated];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.meetupData.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MeetupTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    NSDictionary *eachOrganizer = self.meetupData[indexPath.row];
    NSString *name = [eachOrganizer objectForKey:@"name"];
    NSString *who = [eachOrganizer objectForKey:@"who"];
    NSString *cityCountry = [NSString stringWithFormat:@"%@,%@", [eachOrganizer objectForKey:@"city"], [eachOrganizer objectForKey:@"country"]];

    double rate = [[eachOrganizer objectForKey:@"rating"] doubleValue];
    NSString *descriptionMeetup = [NSString stringWithFormat:@"Rate: %0.2f", rate];
    
    cell.nameLabel.text = name;
    cell.whoLabel.text = who;
    cell.descriptionMeetup.text = descriptionMeetup;
    cell.cityAndCountryLabel.text = cityCountry;
    
    NSLog(@"%@", self.city);
    

    [self getLocationFromAddressString:self.city];

    return cell;
}

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSDictionary *eachOrganizer = self.meetupData[indexPath.row];
    NSString *hyperlinkUrl = [eachOrganizer objectForKey:@"link"];
    NSURL *url = [NSURL URLWithString:hyperlinkUrl];

    
    [[UIApplication sharedApplication]openURL:url];

}

-(CLLocationCoordinate2D) getLocationFromAddressString: (NSString*) addressStr {
    double latitude = 0, longitude = 0;
    NSString *esc_addr =  [addressStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSString *req = [NSString stringWithFormat:@"http://maps.google.com/maps/api/geocode/json?sensor=false&address=%@", esc_addr];
    NSString *result = [NSString stringWithContentsOfURL:[NSURL URLWithString:req] encoding:NSUTF8StringEncoding error:NULL];
    
    NSLog(@"%@", result);
    if (result) {
        NSScanner *scanner = [NSScanner scannerWithString:result];
        if ([scanner scanUpToString:@"\"lat\" :" intoString:nil] && [scanner scanString:@"\"lat\" :" intoString:nil]) {
            [scanner scanDouble:&latitude];
            if ([scanner scanUpToString:@"\"lng\" :" intoString:nil] && [scanner scanString:@"\"lng\" :" intoString:nil]) {
                [scanner scanDouble:&longitude];
            }
        }
    }
    CLLocationCoordinate2D center;
    center.latitude=latitude;
    center.longitude = longitude;
    NSLog(@"View Controller get Location Logitute : %f",center.latitude);
    NSLog(@"View Controller get Location Latitute : %f",center.longitude);
    return center;
    
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
