//
//  VisitedViewController.m
//  InControl
//
//  Created by Diana Elezaj on 10/14/15.
//  Copyright © 2015 Diana Elezaj. All rights reserved.
//

#import "VisitedViewController.h"
#import "AppDelegate.h"
#import <CoreData/CoreData.h>
#import "City.h"
#import "DetailVisitedViewController.h"

@interface VisitedViewController ()
<
NSFetchedResultsControllerDelegate,
UITableViewDataSource,
UITableViewDelegate
>

@property (nonatomic) NSFetchedResultsController *fetchedResultsController;

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@end

@implementation VisitedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    AppDelegate *delegate = [UIApplication sharedApplication].delegate;
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"City"];
    
    NSSortDescriptor *sort = [[NSSortDescriptor alloc] initWithKey:@"name" ascending:YES];
    
    fetchRequest.sortDescriptors = @[sort];
    
    self.fetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest managedObjectContext:delegate.managedObjectContext sectionNameKeyPath:nil cacheName:nil];
    
    self.fetchedResultsController.delegate = self;
    
    [self.fetchedResultsController performFetch:nil];
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.tableView reloadData];
}



#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.fetchedResultsController.fetchedObjects.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"VisitedCellIdentifier" forIndexPath:indexPath];
    
    City *city = self.fetchedResultsController.fetchedObjects[indexPath.row];
    cell.textLabel.text = city.name;
    cell.detailTextLabel.text = city.impression;
    cell.imageView.image = [UIImage imageWithData:city.photo];
    
    return cell;
}

- (void)controller:(NSFetchedResultsController *)controller didChangeObject:(id)anObject atIndexPath:(NSIndexPath *)indexPath forChangeType:(NSFetchedResultsChangeType)type newIndexPath:(NSIndexPath *)newIndexPath{
    
    [self.tableView reloadData];
}


#pragma mark - segue

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    if ([segue.identifier isEqualToString:@"showDetail"]){
        
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        
        DetailVisitedViewController *vc = segue.destinationViewController;
        
        City *currentCity = self.fetchedResultsController.fetchedObjects[indexPath.row];
        
        vc.city = currentCity;
    }
    
}







@end
