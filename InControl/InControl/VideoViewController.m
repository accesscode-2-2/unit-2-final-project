//
//  VideoViewController.m
//  InControl
//
//  Created by Diana Elezaj on 10/12/15.
//  Copyright © 2015 Diana Elezaj. All rights reserved.
//

#import "VideoViewController.h"
#import <XCDYouTubeKit/XCDYouTubeKit.h>
#import "APIManager.h"
#import "ViewController.h"
#import "Youtube.h"
#import <UIKit/UIViewController.h>

@interface VideoViewController ()
<UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic) NSMutableArray *searchedVideos;


//comment
@end

@implementation VideoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [super viewDidLoad];
    [self.tableView setDataSource:self];
    [self.tableView setDelegate:self];
    
    NSLog(@"you searched for %@", self.city);
    [self printResults];

    
}


-(void)printResults {
    NSString * query = @"";
    query = [ query stringByAppendingString: self.city];
    
    [self makeFSAPIRequestWithSearchTerm:query callbackBlock:^{
        
        [self.tableView reloadData];
        
        
    }];
    
}


- (void) makeFSAPIRequestWithSearchTerm:(NSString*) searchTerm callbackBlock:(void(^)())block{
    NSLog(@"%@", searchTerm);
    
    
    //api key AIzaSyDt8qmOMAZJoW3F_q1_BSPW8P4P1fFPduM
    
    
    NSString *urlString = [NSString stringWithFormat:@"https://www.googleapis.com/youtube/v3/search?part=id,snippet&q=%@&maxResults=50&key=AIzaSyDt8qmOMAZJoW3F_q1_BSPW8P4P1fFPduM", searchTerm];
    
    
    
    NSLog(@"hhhhhhh %@", urlString);
    
    NSString *encodedString = [urlString stringByAddingPercentEncodingWithAllowedCharacters: [NSCharacterSet URLQueryAllowedCharacterSet]];
    NSURL *url = [NSURL   URLWithString:encodedString];
    
    NSLog(@"hhhhhhh %@", url);
    
    
    [APIManager GETRequestWithURL:url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (data != nil) {
            NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
            self.searchedVideos = [[NSMutableArray alloc]init];
            
            NSArray *results = [json objectForKey:@"items"];
            
            //NSLog(@"%@", json);
            for (NSDictionary *result in results) {
                
                Youtube *video = [[Youtube alloc] init];
                video.videoTitle = [[result objectForKey:@"snippet"]objectForKey:@"title"];
                
                video.videoDescription = [[result objectForKey:@"snippet"]objectForKey:@"description"];
                video.videoID = [[result objectForKey:@"id"] objectForKey:@"videoId"];
                video.videoImage = [[[[result objectForKey:@"snippet"]objectForKey:@"thumbnails"] objectForKey:@"medium"] objectForKey:@"url"];
                [self.searchedVideos addObject:video];
            }
            block();
        }
        
    }];
    
}

# pragma mark -tableView delegate methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.searchedVideos.count;
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"VideoCellID" forIndexPath:indexPath];
    Youtube * video = [self.searchedVideos objectAtIndex:indexPath.row];
    
    NSURL *imgURL = [NSURL URLWithString:video.videoImage];
    NSData *imageData = [NSData dataWithContentsOfURL:imgURL];
    UIImage *image = [UIImage imageWithData:imageData];
    
    cell.textLabel.text = video.videoTitle;
    cell.detailTextLabel.text = video.videoDescription;
    cell.imageView.image = image;
    
    return cell;
}

 

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"errorrrrr");
    Youtube *video = [self.searchedVideos objectAtIndex:indexPath.row];
    
    NSString *videoString = video.videoID;
    XCDYouTubeVideoPlayerViewController *videoPlayerViewController = [[XCDYouTubeVideoPlayerViewController alloc] initWithVideoIdentifier:videoString];
    
    [self presentViewController:videoPlayerViewController animated:YES completion:^{
        
        
    }]; //presentMoviePlayerViewControllerAnimated:videoPlayerViewController];
    
}

@end
