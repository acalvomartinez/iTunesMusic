//
//  Artist.m
//  iTunesMusic
//
//  Created by Toni on 13/01/16.
//  Copyright © 2016 Toni. All rights reserved.
//

#import "Artist.h"

@implementation Artist

+ (instancetype)artistWithId:(NSInteger)artistId
                        name:(NSString *)name
                      albums:(NSArray *)albums {
    return [[self alloc] initWithId:artistId name:name artworkURL:nil albums:albums];
}

+ (instancetype)artistWithId:(NSInteger)artistId
                        name:(NSString *)name
                  artworkURL:(NSString *)artworkURL {
    return [[self alloc] initWithId:artistId name:name artworkURL:artworkURL albums:nil];
}

+ (instancetype)artistWithId:(NSInteger)artistId
                        name:(NSString *)name
                  artworkURL:(NSString *)artworkURL
                      albums:(NSArray *)albums {
    return [[self alloc] initWithId:artistId name:name artworkURL:artworkURL albums:albums];
}

- (instancetype)initWithId:(NSInteger)artistId
                      name:(NSString *)name
                artworkURL:(NSString *)artworkURL
                    albums:(NSArray *)albums {
    self = [super init];
    
    if (self) {
        _artistId = artistId;
        _name = name;
        _artworkURL = artworkURL;
        _albums = albums;
    }
    return self;
}

@end
