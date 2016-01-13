//
//  Album.h
//  iTunesMusic
//
//  Created by Toni on 13/01/16.
//  Copyright © 2016 Toni. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Album : NSObject

@property (nonatomic, assign) NSInteger albumId;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *artworkURL;
@property (nonatomic, strong) NSDate *releaseDate;

+ (instancetype)albumWithId:(NSInteger)albumId
                      title:(NSString *)title
                 artworkURL:(NSString *)artworkURL
                releaseDate:(NSDate *)releaseDate;

- (instancetype)initWithId:(NSInteger)albumId
                     title:(NSString *)title
                artworkURL:(NSString *)artworkURL
               releaseDate:(NSDate *)releaseDate;

@end
