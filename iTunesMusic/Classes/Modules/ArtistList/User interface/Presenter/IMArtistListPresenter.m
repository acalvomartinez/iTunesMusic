//
//  IMArtistListPresenter.m
//  iTunesMusic
//
//  Created by Toni on 13/01/16.
//  Copyright © 2016 Toni. All rights reserved.
//

#import "IMArtistListPresenter.h"

#import "IMArtistListWireframe.h"
#import "IMArtistListViewController.h"
#import "IMArtistListDisplayArtist.h"
#import "NSArray+HOM.h"

#import "IMArtistListArtist.h"

@implementation IMArtistListPresenter

- (void)updateView {
    [self.artistListInteractor findArtists];
}

- (void)showAlbumsArtistId:(NSInteger)artistId {
    [self.artistListWireframe presentAlbumListInterfaceForArtistId:artistId];
}

#pragma mark - Artist List Interactor Output

- (void)foundArtists:(NSArray *)artists {
    [self.userInterface showDisplayArtists:[self displayArtistsWithArtists:artists]];
}

- (NSArray *)displayArtistsWithArtists:(NSArray *)artists {
    return [artists arrayFromObjectsCollectedWithBlock:^id(IMArtistListArtist *artist) {
        return [IMArtistListDisplayArtist displayArtistWithId:artist.artistId
                                                         name:artist.name
                                                   artworkURL:artist.artworkURL];
    }];
}

@end
