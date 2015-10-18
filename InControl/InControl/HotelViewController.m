//
//  HotelViewController.m
//  InControl
//
//  Created by Xiulan Shi on 10/13/15.
//  Copyright © 2015 Diana Elezaj. All rights reserved.
//

#import "HotelViewController.h"
#import "APIManager.h"
#import "Venue.h"
#import "FoursquareAPIManager.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface HotelViewController ()
<
UITableViewDataSource,
UITableViewDelegate
>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic) NSMutableArray *searchResults;
@end

@implementation HotelViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    [self fetchFoursquareVenues];
    
}


- (void)fetchFoursquareVenues {
    [FoursquareAPIManager fetchResultsWithSearchTerm:@"hotel" location:self.city callbackBlock:^(id json){
        NSArray *results = json[@"response"][@"venues"];
        
        self.searchResults =[[NSMutableArray alloc] init];
        
        for (NSDictionary *result in results) {
            
            NSString *name = result[@"name"];
            NSString *venueID = result[@"id"];
            NSString *address = result[@"location"][@"address"];
            NSString *city = result[@"location"][@"city"];
            NSString *state = result[@"location"][@"state"];
            NSString *postCode = result[@"location"][@"postalCode"];
            
            
            Venue *venueObject = [[Venue alloc] init];
            venueObject.name = name;
            venueObject.address = [NSString stringWithFormat:@"%@, %@, %@ %@", address, city, state, postCode];
            venueObject.venueID = venueID;
            
            [venueObject fetchPhotosWithCallbackBlock:nil];
            
            [self.searchResults addObject:venueObject];
            
        }
        
        [self.tableView reloadData];
        
    }];
}


# pragma mark - tableView delegate methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.searchResults.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HotelCellIdentifier" forIndexPath:indexPath];
    Venue *result = [self.searchResults objectAtIndex:indexPath.row];
    
    result.photoUpdateListener = ^{
        [cell.imageView sd_setImageWithURL:result.photoURL];
    };
    
    [cell.imageView sd_setImageWithURL:result.photoURL placeholderImage:[UIImage imageNamed:@"hotelimg"]];
    if (cell.imageView.image == nil) {
        cell.imageView.image = [UIImage imageNamed:@"hotelimg"];
    }
    
    cell.textLabel.text = result.name;
    cell.detailTextLabel.text = result.address;
    
    return cell;
}

@end
