//
//  ImageTableViewController.m
//  InControl
//
//  Created by Diana Elezaj on 10/11/15.
//  Copyright © 2015 Diana Elezaj. All rights reserved.
//

#import "ImageTableViewController.h"
#import "APIManager.h"
#import "CustomTableViewCell.h"


@interface ImageTableViewController ()

@property (nonatomic) NSDictionary * imageData;

@end

@implementation ImageTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.dataSource = self;
    
    [self makeApPIRequestWithNewTerm:self.city cityName:self.city callbackBlock:^{
        [self.tableView reloadData];
    }];
}



- (void)makeApPIRequestWithNewTerm:(NSString *)searchTerm cityName:(NSString *)location
                     callbackBlock:(void(^)())block {
    
    NSString *imageURL = [NSString stringWithFormat:@"https://api.flickr.com/services/rest/?&method=flickr.photos.search&api_key=4ef2fe2affcdd6e13218f5ddd0e2500d&tags=%@&per_page=25&format=json&nojsoncallback=1", searchTerm];
    
    
    
    NSString *encodedString = [imageURL stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    
    NSURL *url = [NSURL URLWithString:encodedString];
    
    NSLog(@"%@", url);
    
    [APIManager GETRequestWithURL:url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        self.imageData = [json objectForKey:@"photos"];
        
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



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.imageData.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellIdentifier" forIndexPath:indexPath];
    
    //NSDictionary *currentInstagramItem = self.imageData[indexPath.row];
    NSArray *photos = [self.imageData objectForKey:@"photo"];
    NSDictionary *photo = photos[indexPath.row];
    
    NSString *imageURL = [NSString stringWithFormat:@"https://farm%@.staticflickr.com/%@/%@_%@.jpg",[photo objectForKey:@"farm"] ,[photo objectForKey:@"server"], [photo objectForKey:@"id"], [photo objectForKey:@"secret"]];
    cell.textLabel.text = imageURL;
    
    NSURL *url = [NSURL URLWithString:imageURL];
    NSData *pictureData = [NSData dataWithContentsOfURL:url];
    UIImage *picture = [UIImage imageWithData:pictureData];
    cell.customImage.image = picture;
    
    NSLog(@"%@", picture);
    
    return cell;
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
