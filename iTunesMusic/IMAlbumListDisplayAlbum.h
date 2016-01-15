//
//  IMAlbumListDisplayAlbum.h
//  iTunesMusic
//
//  Created by Toni on 15/01/16.
//  Copyright © 2016 Toni. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface IMAlbumListDisplayAlbum : NSObject

@property (nonatomic, assign) NSInteger albumId;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *artworkURL;
@property (nonatomic, copy) NSString *releaseYear;

+ (instancetype)displayAlbumWithId:(NSInteger)albumId
                             title:(NSString *)name
                        artworkURL:(NSString *)artworkURL
                       releaseDate:(NSDate*)releaseDate;

@end
