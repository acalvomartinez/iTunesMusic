//
//  IMArtistListInteractor.m
//  iTunesMusic
//
//  Created by Toni on 14/01/16.
//  Copyright © 2016 Toni. All rights reserved.
//

#import "IMArtistListInteractor.h"
#import "IMArtistListDataManager.h"
#import "IMArtistListArtist.h"
#import "NSArray+HOM.h"
#import "Artist.h"

@interface IMArtistListInteractor ()

@property (nonatomic, strong) IMArtistListDataManager *dataManager;

@end

@implementation IMArtistListInteractor

- (instancetype)initWithDataManager:(IMArtistListDataManager *)dataManager {
    self = [super init];
    
    if (self) {
        _dataManager = dataManager;
    }
    return self;
}

- (void)findArtists {
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0);
    dispatch_async(queue, ^{
        __weak typeof(self) weakSelf = self;
        [self.dataManager fetchArtistsOnCompletionBlock:^(NSArray *artists) {
            NSArray *artistList = [weakSelf artistsFromModelArtists:artists];
            dispatch_async(dispatch_get_main_queue(), ^{
                [weakSelf.output foundArtists:artistList];
            });
        }];
    });
}

- (NSArray *)artistsFromModelArtists:(NSArray *)modelArtists {
    
    NSArray *validModelArtists = (modelArtists != nil) ? modelArtists : @[];
    
    return [validModelArtists arrayFromObjectsCollectedWithBlock:^id(Artist *artist) {
        return [IMArtistListArtist artistWithId:artist.artistId
                                           name:artist.name
                                     artworkURL:artist.artworkURL];
    }];
}


@end
