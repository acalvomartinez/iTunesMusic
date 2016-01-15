//
//  IMAlbumListInteractorIO.h
//  iTunesMusic
//
//  Created by Toni on 15/01/16.
//  Copyright © 2016 Toni. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Artist.h"

@protocol IMAlbumListInteractorInput <NSObject>
- (void)findAlbumsArtistID:(NSInteger)artistId;
@end


@protocol IMAlbumListInteractorOutput <NSObject>
- (void)foundArtist:(Artist *)artist;
@end