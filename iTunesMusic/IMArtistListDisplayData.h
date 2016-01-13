//
//  IMArtistListDisplayData.h
//  iTunesMusic
//
//  Created by Toni on 13/01/16.
//  Copyright © 2016 Toni. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface IMArtistListDisplayData : NSObject

@property (nonatomic, readonly, copy) NSArray *artists;

+ (instancetype)artistListDisplayDataWithArtists:(NSArray *)artists;

@end
