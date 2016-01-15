//
//  IMAlbumListAlbum.m
//  iTunesMusic
//
//  Created by Toni on 15/01/16.
//  Copyright © 2016 Toni. All rights reserved.
//

#import "IMAlbumListAlbum.h"

@implementation IMAlbumListAlbum

+ (instancetype)albumWithId:(NSInteger)albumId title:(NSString *)title artworkURL:(NSString *)artworkURL releaseDate:(NSDate *)releaseDate {
    IMAlbumListAlbum *album = [[IMAlbumListAlbum alloc] init];
    
    album.albumId = albumId;
    album.title = title;
    album.artworkURL = artworkURL;
    album.releaseDate = releaseDate;
    
    return album;
}


@end
