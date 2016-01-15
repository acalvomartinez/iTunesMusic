//
//  IMArtistListArtist.m
//  iTunesMusic
//
//  Created by Toni on 14/01/16.
//  Copyright © 2016 Toni. All rights reserved.
//

#import "IMArtistListArtist.h"

@implementation IMArtistListArtist

+ (instancetype)artistWithId:(NSInteger)artistId name:(NSString *)name artworkURL:(NSString *)artworkURL {
    IMArtistListArtist *artist = [[IMArtistListArtist alloc] init];
    
    artist.artistId = artistId;
    artist.name = name;
    artist.artworkURL = artworkURL;
    
    return artist;
}


@end
