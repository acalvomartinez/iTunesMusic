//
//  Album.m
//  iTunesMusic
//
//  Created by Toni on 13/01/16.
//  Copyright © 2016 Toni. All rights reserved.
//

#import "Album.h"

@implementation Album

+ (instancetype)albumWithId:(NSInteger)albumId
                      title:(NSString *)title
                 artworkURL:(NSString *)artworkURL
                releaseDate:(NSDate *)releaseDate {
    return [[self alloc] initWithId:albumId title:title artworkURL:artworkURL releaseDate:releaseDate];
}

- (instancetype)initWithId:(NSInteger)albumId
                     title:(NSString *)title
                artworkURL:(NSString *)artworkURL
               releaseDate:(NSDate *)releaseDate {
    self = [super init];
    
    if (self) {
        _albumId = albumId;
        _title = title;
        _artworkURL = artworkURL;
        _releaseDate = releaseDate;
    }
    return self;
}

@end
