//
//  IMArtistListDisplayData.m
//  iTunesMusic
//
//  Created by Toni on 13/01/16.
//  Copyright © 2016 Toni. All rights reserved.
//

#import "IMArtistListDisplayData.h"

@interface IMArtistListDisplayData ()
@property (nonatomic, copy) NSArray *artists;
@end

@implementation IMArtistListDisplayData

+ (instancetype)artistListDisplayDataWithArtists:(NSArray *)artists {
    IMArtistListDisplayData *data = [[IMArtistListDisplayData alloc] init];
    data.artists = artists;
    return data;
}

@end
