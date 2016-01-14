//
//  IMArtistListArtist.h
//  iTunesMusic
//
//  Created by Toni on 14/01/16.
//  Copyright © 2016 Toni. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface IMArtistListArtist : NSObject

@property (nonatomic, assign) NSInteger artistId;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *artworkURL;

+ (instancetype)artistWithId:(NSInteger)artistId name:(NSString *)name artworkURL:(NSString *)artworkURL;

@end
