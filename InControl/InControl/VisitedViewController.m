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
#import "VisitedTableViewCell.h"

@interface VisitedViewController ()
<
NSFetchedResultsControllerDelegate,
UITableViewDataSource,
UITableViewDelegate
>

@property (nonatomic) NSFetchedResultsController *fetchedResultsController;

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic) NSSortDescriptor *sort;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedControl;

@end

@implementation VisitedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"cc"]];
    
    
    self.navigationController.view.backgroundColor =
    [UIColor colorWithPatternImage:[UIImage imageNamed:@"cc"]];
    self.tableView.backgroundColor = [UIColor clearColor];

    
    
    
    [self sorting];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.tableView reloadData];

}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self sorting];
    [self.tableView reloadData];

}


-(void) sorting {
    AppDelegate *delegate = [UIApplication sharedApplication].delegate;
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"City"];
    
    
    
    
    
    
    if (self.segmentedControl.selectedSegmentIndex == 0)  {
        
        self.sort = [NSSortDescriptor sortDescriptorWithKey:@"name" ascending:YES];
    }
    else if (self.segmentedControl.selectedSegmentIndex == 1)  {
        
        self.sort = [NSSortDescriptor sortDescriptorWithKey:@"rate" ascending:NO];
    }
    
    
    fetchRequest.sortDescriptors = @[self.sort];
    
    self.fetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest managedObjectContext:delegate.managedObjectContext sectionNameKeyPath:nil cacheName:nil];
    
    self.fetchedResultsController.delegate = self;
    
    [self.fetchedResultsController performFetch:nil];
    [self.tableView reloadData];

}
- (IBAction)segmentSelected:(UISegmentedControl *)sender {
    [self sorting];
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
    VisitedTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"VisitedCellIdentifier" forIndexPath:indexPath];
    
    City *city = self.fetchedResultsController.fetchedObjects[indexPath.row];
    cell.cityNameLabel.text = city.name;
    cell.cityRateLabel.text = [NSString stringWithFormat:@"%@", city.rate ];
    cell.cityImageView.image = [UIImage imageWithData:city.photo];
    
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
