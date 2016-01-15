//
//  IMAlbumListDisplayAlbum.m
//  iTunesMusic
//
//  Created by Toni on 15/01/16.
//  Copyright © 2016 Toni. All rights reserved.
//

#import "IMAlbumListDisplayAlbum.h"
#import "NSDate+Formatter.h"

@implementation IMAlbumListDisplayAlbum

+ (instancetype)displayAlbumWithId:(NSInteger)albumId
                             title:(NSString *)title
                        artworkURL:(NSString *)artworkURL
                       releaseDate:(NSDate *)releaseDate {
    IMAlbumListDisplayAlbum *album = [[IMAlbumListDisplayAlbum alloc] init];
    album.albumId = albumId;
    album.title = title;
    album.artworkURL = artworkURL;
    album.releaseYear = [releaseDate year];
    return album;
}
@end
