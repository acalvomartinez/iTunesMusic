//
//  IMAlbumListDataManager.h
//  iTunesMusic
//
//  Created by Toni on 15/01/16.
//  Copyright © 2016 Toni. All rights reserved.
//

#import <Foundation/Foundation.h>

@class IMCoreDataStore;
@class Artist;

typedef void(^IMAlbumListDataManagerFetchArtistBlock)(Artist *artist);

@interface IMAlbumListDataManager : NSObject

@property (nonatomic, strong) IMCoreDataStore *dataStore;

- (void)fetchArtistWithArtistId:(NSInteger)artistId completionBlock:(IMAlbumListDataManagerFetchArtistBlock)completionBlock;

@end
