//
//  IMAlbumListPresenter.m
//  iTunesMusic
//
//  Created by Toni on 15/01/16.
//  Copyright © 2016 Toni. All rights reserved.
//

#import "IMAlbumListPresenter.h"

@implementation IMAlbumListPresenter

- (void)updateView {
    [self.albumListInteractor findAlbumsArtistID:self.artistId];
}

- (void)foundArtist:(Artist *)artist {
    NSLog(@"%@ %u",artist.name, artist.albums.count);
}

@end
