//
//  IMAlbumListInteractor.m
//  iTunesMusic
//
//  Created by Toni on 15/01/16.
//  Copyright © 2016 Toni. All rights reserved.
//

#import "IMAlbumListInteractor.h"
#import "IMAlbumListDataManager.h"
#import "IMAlbumListAlbum.h"
#import "Album.h"
#import "NSArray+HOM.h"
#import "Artist.h"

@interface IMAlbumListInteractor ()

@property (nonatomic, strong) IMAlbumListDataManager *dataManager;

@end

@implementation IMAlbumListInteractor

-(instancetype)initWithDataManager:(IMAlbumListDataManager *)dataManager {
    self = [super init];
    
    if (self) {
        _dataManager = dataManager;
    }
    return self;
}

- (void)findAlbumsArtistID:(NSInteger)artistId {
    __weak typeof(self) weakSelf = self;
    
    [self.dataManager fetchArtistWithArtistId:artistId completionBlock:^(Artist *artist) {
        
        [weakSelf.output foundArtist:artist];
    }];
}

- (NSArray *)artistsFromModelAlbums:(NSArray *)modelAlbums {
    
    NSArray *validModelAlbums = (modelAlbums != nil) ? modelAlbums : @[];
    
    return [validModelAlbums arrayFromObjectsCollectedWithBlock:^id(Album *album) {
        return [IMAlbumListAlbum albumWithId:album.albumId title:album.title artworkURL:album.artworkURL releaseDate:album.releaseDate];
    }];
}

@end
