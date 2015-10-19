//
//  PhotoAlbum.h
//  UNIT2PracticeProject
//
//  Created by Bereket  on 10/15/15.
//  Copyright © 2015 Bereket . All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PhotoAlbum : NSObject


@property (nonatomic) NSMutableArray *photoEntries;

+ (PhotoAlbum *)sharedPhotoAlbum;


@end
