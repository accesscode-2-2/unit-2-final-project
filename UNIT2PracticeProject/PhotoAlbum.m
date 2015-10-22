//
//  PhotoAlbum.m
//  UNIT2PracticeProject
//
//  Created by Bereket  on 10/15/15.
//  Copyright © 2015 Bereket . All rights reserved.
//

#import "PhotoAlbum.h"

@implementation PhotoAlbum

+ (PhotoAlbum *)sharedPhotoAlbum {
    static PhotoAlbum *sharedMyManager = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedMyManager = [[self alloc] init];
        sharedMyManager.photoEntries = [[NSMutableArray alloc] init];
    });
    
    return sharedMyManager;
}


@end
