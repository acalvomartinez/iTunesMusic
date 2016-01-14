//
//  IMCoreDataStore.h
//  iTunesMusic
//
//  Created by Toni on 14/01/16.
//  Copyright © 2016 Toni. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ManagedArtist.h"
#import "Artist.h"
#import "ManagedAlbum.h"
#import "Album.h"

typedef void(^ArtistCompletionBlock)(ManagedArtist *);
typedef void(^ErrorBlock)(NSError *);

@interface IMCoreDataStore : NSObject

- (void)updateOrCreateArtistWith:(Artist *)artist completion:(ArtistCompletionBlock)completionBlock error:(ErrorBlock)errorBlock;
- (void)fetchArtistWithArtistId:(NSInteger)artistId completion:(ArtistCompletionBlock)completionBlock error:(ErrorBlock)errorBlock;
- (void)saveOnError:(ErrorBlock)errorBlock ;

@end
