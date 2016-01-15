//
//  IMArtistListDisplayArtist.m
//  iTunesMusic
//
//  Created by Toni on 13/01/16.
//  Copyright © 2016 Toni. All rights reserved.
//

#import "IMArtistListDisplayArtist.h"

@implementation IMArtistListDisplayArtist

+ (instancetype)displayArtistWithId:(NSInteger)artistId name:(NSString *)name artworkURL:(NSString *)artworkURL {
    IMArtistListDisplayArtist *artist = [[IMArtistListDisplayArtist alloc] init];
    
    artist.artistId = artistId;
    artist.name = name;
    artist.artworkURL = artworkURL;
    
    return artist;
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"%@ %ld %@ - %@", [super description], (long)self.artistId, self.name, self.artworkURL];
}


@end
