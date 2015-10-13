//
//  FoodViewController.m
//  InControl
//
//  Created by Xiulan Shi on 10/13/15.
//  Copyright © 2015 Diana Elezaj. All rights reserved.
//

#import "FoodViewController.h"
#import "APIManager.h"
#import "Venue.h"

@interface FoodViewController ()
<
UITableViewDataSource,
UITableViewDelegate
>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic) NSMutableArray *searchResults;

@end

@implementation FoodViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    [self makeNewAPIRequestWithSearchTerm:@"food" andLocation:@"Flushing" callbackBlock:^{
        [self.tableView reloadData];
    }];
    
}


- (void) makeNewAPIRequestWithSearchTerm:(NSString*)searchTerm andLocation:(NSString*)location
                           callbackBlock:(void(^)())block{
    
    NSString *urlString = [NSString stringWithFormat:@"https://api.foursquare.com/v2/venues/search?near=%@&query=%@&client_id=SVBBDTUHT5WOBDQ5NINYVTLNDNTHGD0XGRRE0LMB304VMWG1&client_secret=ZHPO4GOAGH3YSPQNQZAYC13YJ420Q2IPXAI0CRHQ0I3SB0HL&v=20150925", location, searchTerm];
    
    NSString *encodedString = [urlString stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    
    NSURL *url = [NSURL URLWithString:encodedString];
    
    [APIManager GETRequestWithURL:url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        
        if (data != nil) {
            NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
            
            NSArray *results = json[@"response"][@"venues"];
            
            self.searchResults =[[NSMutableArray alloc] init];
            
            for (NSDictionary *result in results) {
                
                NSString *name = result[@"name"];
                NSString *address = result[@"location"][@"address"];
                NSString *city = result[@"location"][@"city"];
                NSString *state = result[@"location"][@"state"];
                NSString *postCode = result[@"location"][@"postalCode"];
                
                Venue *venueObject = [[Venue alloc] init];
                venueObject.name = name;
                venueObject.address = [NSString stringWithFormat:@"%@, %@, %@ %@", address, city, state, postCode];
                [self.searchResults addObject:venueObject];
            }
            block();
        }
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
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FoodCellIdentifier" forIndexPath:indexPath];
    Venue *result = [self.searchResults objectAtIndex:indexPath.row];
    cell.textLabel.text = result.name;
    cell.detailTextLabel.text = result.address;
    return cell;
}
@end
