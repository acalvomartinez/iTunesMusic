//
//  IMAlbumListPresenter.m
//  iTunesMusic
//
//  Created by Toni on 15/01/16.
//  Copyright © 2016 Toni. All rights reserved.
//

#import "IMAlbumListPresenter.h"
#import "IMAlbumListAlbum.h"
#import "IMAlbumListDisplayAlbum.h"
#import "IMAlbumListViewController.h"
#import "NSArray+HOM.h"
#import "Artist.h"

@implementation IMAlbumListPresenter

- (void)updateView {
    [self.albumListInteractor findAlbumsArtistID:self.artistId];
}

- (void)foundArtist:(Artist *)artist {
    [self.userInterface showViewTitle:artist.name];
    [self.userInterface showDisplayAlbums:[self displayAlbumsWithAlbums:artist.albums]];
}




- (NSArray *)displayAlbumsWithAlbums:(NSArray *)albums {
    return [albums arrayFromObjectsCollectedWithBlock:^id(IMAlbumListAlbum *album) {
        return [IMAlbumListDisplayAlbum displayAlbumWithId:album.albumId
                                                     title:album.title
                                                artworkURL:album.artworkURL
                                               releaseDate:album.releaseDate];
    }];
}

@end
