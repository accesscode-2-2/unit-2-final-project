//
//  MeetUpCVC.m
//  finalMeetUp
//
//  Created by Christian Maldonado on 10/18/15.
//  Copyright © 2015 Christian Maldonado. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>
#import "MeetUpCVC.h"
#import "ObjectsInMeetUp.h"
#import "CollectionViewCell.h"
#import "DetailMeetUpViewController.h"

@interface MeetUpCVC ()<UITextFieldDelegate>

@property(nonatomic) NSMutableArray *meetUpData;
@property (weak, nonatomic) IBOutlet UITextField *textFieldSearch;

@end

@implementation MeetUpCVC

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.meetUpData = [[NSMutableArray alloc]init];
    
    self.textFieldSearch.delegate = self;
    
    //[self apiRequestForSearchTerm];
    
    // Register cell classes
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    // border
    [self.view.layer setBorderColor:[UIColor lightGrayColor].CGColor];
    [self.view.layer setBorderWidth:1.5f];
    
    [self.view.layer setBorderColor:[UIColor lightGrayColor].CGColor];
    [self.view.layer setBorderWidth:1.5f];
    
    // drop shadow
    [self.view.layer setShadowColor:[UIColor blackColor].CGColor];
    [self.view.layer setShadowOpacity:0.8];
    [self.view.layer setShadowRadius:3.0];
    [self.view.layer setShadowOffset:CGSizeMake(2.0, 2.0)];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"meetUpSegue"]) {
        NSIndexPath *indexPath = [[self.collectionView indexPathsForSelectedItems]firstObject];
        
        DetailMeetUpViewController *vc = segue.destinationViewController;
        vc.meetUpData2 = self.meetUpData[indexPath.row];
    }
    
    
}


-(NSString *) stripHtml:(NSString*) str {
    NSRange r;
    while ((r = [str rangeOfString:@"<[^>]+>" options:NSRegularExpressionSearch]).location != NSNotFound)
        str = [str stringByReplacingCharactersInRange:r withString:@""];
    return str;
}

-(void)apiRequestForSearchTerm:(NSString*)searchTerm {
    
    
    
    NSString *encodingString = [searchTerm stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    
    NSString *urlstring = [NSString stringWithFormat:@"https://api.meetup.com/2/concierge?key=246e57e1d7676522d3d116b106145d&sign=true&photo-host=public&country=%@&city=%@&state=%@",encodingString,encodingString,encodingString];
    
    AFHTTPRequestOperationManager *manager = [[AFHTTPRequestOperationManager alloc]init];
    
    [manager GET:urlstring
      parameters:nil
         success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
             
             NSLog(@"%@",responseObject);
             
             NSArray *results = responseObject[@"results"];
             NSString *name = [[results objectAtIndex:1] objectForKey:@"name"];
             
             NSLog(@"%@",name);
             
             for (NSDictionary *info in results) {
                 ObjectsInMeetUp *meetUpObject = [[ObjectsInMeetUp alloc]init];
                 
                 NSString *name = [NSString stringWithFormat:@"%@",[info objectForKey:@"name"]];
                 meetUpObject.name = name;
                 
                 NSString *description = [NSString stringWithFormat:@"%@",[info objectForKey:@"description"]];
                 meetUpObject.desc = [self stripHtml: description];
                 
                 NSString *fee = [NSString stringWithFormat:@"$%@",[[info objectForKey:@"fee"] objectForKey:@"amount"]];
                 meetUpObject.fee = fee;
                 
                 NSInteger cost = [[info objectForKey:@"fee"] objectForKey:@"amount"];
                 
                 if (cost == 0 ) {
                     meetUpObject.fee = @"free";
                     
                 }else
                     meetUpObject.fee = [NSString stringWithFormat:@"$%@",cost];
                 
                 
                 
                 NSString *yes_rsvp_count = [NSString stringWithFormat:@"%@ attending!",[info objectForKey:@"yes_rsvp_count"]];
                 meetUpObject.yes_rsvp_count = yes_rsvp_count;
                 
                 //NSString *shortame = [NSString stringWithFormat:@"%@",[info objectForKey:@"shortname"]];
                 //meetUpObject.shortname = shortame;
                 NSString *tapMe = [NSString stringWithFormat:@"Tap here for more info"];
                 
                 
                 [self.meetUpData addObject:meetUpObject];
                 [self.collectionView reloadData];
             }
             
             
         } failure:^(AFHTTPRequestOperation * _Nonnull operation, NSError * _Nonnull error) {
             
         }];
    
    [self.collectionView reloadData];
    
}



#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.meetUpData.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"meetUpCell" forIndexPath:indexPath];
    
    ObjectsInMeetUp *secondMeetUpObject = self.meetUpData[indexPath.row];
    cell.nameLabel.text = secondMeetUpObject.name;
    cell.sortNameLabel.text = secondMeetUpObject.fee;
    cell.idLabel.text = secondMeetUpObject.yes_rsvp_count;
    cell.shortNameLabel.text = secondMeetUpObject.shortname;
    
    [cell.layer setCornerRadius:25.0f];
    [cell.layer setBorderWidth:5.0f];
    [cell.layer setBorderColor:[UIColor whiteColor].CGColor];
    
    return cell;
}

#pragma mark - text field delegate

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    [self.view endEditing:YES];
    
    [self apiRequestForSearchTerm:textField.text];
    [self.collectionView reloadData];
    
    return YES;
}


@end
