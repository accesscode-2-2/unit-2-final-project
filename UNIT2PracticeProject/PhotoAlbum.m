//
//  PhotoAlbum.m
//  UNIT2PracticeProject
//
//  Created by Bereket  on 10/15/15.
//  Copyright © 2015 Bereket . All rights reserved.
//

#import "PhotoAlbum.h"
#import "AppDelegate.h"
#import <CoreData/CoreData.h>

@implementation PhotoAlbum

+ (PhotoAlbum *)sharedPhotoAlbum {
    static PhotoAlbum *sharedMyManager = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedMyManager = [[self alloc] init];
        sharedMyManager.photoEntries = [[NSMutableArray alloc] init];
        
        AppDelegate *delegate = [UIApplication sharedApplication].delegate;
        
        // 1) create an instance of NSFetchRequest with an entity name
        NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"JournalEntryObject"];
        
        
        // 2) create a sort descriptor
        NSSortDescriptor *sort = [[NSSortDescriptor alloc] initWithKey:@"timeOfEntry" ascending:NO];
        
        // 3) set the sortDescriptors on the fetchRequest
        fetchRequest.sortDescriptors = @[sort];
        
        // 4) create a fetchedResultsController with a fetchRequest and a managedObjectContext,
        NSFetchedResultsController *fetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest managedObjectContext:delegate.managedObjectContext sectionNameKeyPath:nil cacheName:nil];
        
        [fetchedResultsController performFetch:nil];
        
        sharedMyManager.photoEntries = [fetchedResultsController.fetchedObjects mutableCopy];
    });
    
    return sharedMyManager;
}


@end
