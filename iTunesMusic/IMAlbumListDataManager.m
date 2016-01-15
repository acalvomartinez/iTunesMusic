//
//  IMAlbumListDataManager.m
//  iTunesMusic
//
//  Created by Toni on 15/01/16.
//  Copyright © 2016 Toni. All rights reserved.
//

#import "IMAlbumListDataManager.h"

#import "IMCoreDataStore.h"
#import "Artist.h"

#import "NSArray+HOM.h"

@implementation IMAlbumListDataManager

- (void)fetchArtistWithArtistId:(NSInteger)artistId completionBlock:(IMAlbumListDataManagerFetchArtistBlock)completionBlock {
    __weak typeof(self) weakSelf = self;
    
    [self.dataStore fetchArtistWithArtistId:artistId completion:^(ManagedArtist *managedArtist) {
        Artist *artist = [weakSelf artistFromDataStoreArtist:managedArtist];
        
        if (completionBlock) {
            completionBlock(artist);
        }
    } error:^(NSError *error) {
        
    }];
}

- (Artist *)artistFromDataStoreArtist:(ManagedArtist *)managedArtist {
    
    NSArray *albums = [self albumsFromDataStoreEntries:[managedArtist.albums allObjects]];
    
    Artist *artist = [Artist artistWithId:managedArtist.artistIdValue
                                     name:managedArtist.name
                               artworkURL:managedArtist.artworkURL
                                   albums:albums];
    
    return artist;
}

- (NSArray *)albumsFromDataStoreEntries:(NSArray *)entries {
    NSSortDescriptor *sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:ManagedAlbumAttributes.releaseDate ascending:YES];
    NSArray *sortedEntries = [entries sortedArrayUsingDescriptors:@[sortDescriptor]];
    
    return [sortedEntries arrayFromObjectsCollectedWithBlock:^id(ManagedAlbum *managedAlbum) {
        return [Album albumWithId:managedAlbum.albumIdValue title:managedAlbum.title artworkURL:managedAlbum.artworkURL releaseDate:managedAlbum.releaseDate];
    }];
}


@end
