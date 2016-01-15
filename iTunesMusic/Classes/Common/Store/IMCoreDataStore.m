//
//  IMCoreDataStore.m
//  iTunesMusic
//
//  Created by Toni on 14/01/16.
//  Copyright © 2016 Toni. All rights reserved.
//

#import "IMCoreDataStore.h"

#import "NSError+CustomError.h"
#import "IMCoreDataStoreErrors.h"

@import CoreData;

typedef void(^IMArtistListFetchCompletionBlock)(NSArray *results);

@interface IMCoreDataStore ()
@property (nonatomic, strong) NSPersistentStoreCoordinator *persistentStoreCoordinator;
@property (nonatomic, strong) NSManagedObjectModel *managedObjectModel;
@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;
@end

@implementation IMCoreDataStore

- (instancetype)init {
    self = [super init];
    
    if (self) {
        _managedObjectModel = [NSManagedObjectModel mergedModelFromBundles:nil];
        
        _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:self.managedObjectModel];
        
        NSError *error = nil;
        NSURL *applicationDocumentsDirectory = [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
        NSDictionary *options = [NSDictionary dictionaryWithObjectsAndKeys:
                                 [NSNumber numberWithBool:YES], NSMigratePersistentStoresAutomaticallyOption,
                                 [NSNumber numberWithBool:YES], NSInferMappingModelAutomaticallyOption, nil];
        NSURL *storeURL = [applicationDocumentsDirectory URLByAppendingPathComponent:@"itunesmusic.sqlite"];
        
        [_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType
                                                  configuration:nil
                                                            URL:storeURL
                                                        options:options error:&error];
        
        _managedObjectContext = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
        _managedObjectContext.persistentStoreCoordinator = self.persistentStoreCoordinator;
        _managedObjectContext.undoManager = nil;
    }
    
    return self;
}

- (void)updateOrCreateArtistWith:(Artist *)artist completion:(ArtistCompletionBlock)completionBlock error:(ErrorBlock)errorBlock {
    __weak typeof(self) weakSelf = self;
    
    [self fetchArtistWithArtistId:artist.artistId completion:^(ManagedArtist *managedArtist) {
        [weakSelf updateManagedArtist:managedArtist withArtist:artist];
        
        if (completionBlock) {
            completionBlock(managedArtist);
        }
    } error:^(NSError *error) {
        if (error.code == CoreDataStoreArtistNotExists) {
            ManagedArtist *newManagedArtist = [ManagedArtist insertInManagedObjectContext:weakSelf.managedObjectContext];
            
            [weakSelf updateManagedArtist:newManagedArtist withArtist:artist];
            
            if (completionBlock) {
                completionBlock(newManagedArtist);
            }
        }
    }];
}

- (void)fetchArtistWithArtistId:(NSInteger)artistId completion:(ArtistCompletionBlock)completionBlock error:(ErrorBlock)errorBlock {
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:[ManagedArtist entityName]];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"%K=%u",ManagedArtistAttributes.artistId, artistId];
    fetchRequest.predicate = predicate;
    
    __weak typeof(self) weakSelf = self;
    [self.managedObjectContext performBlock:^{
        NSArray *results = [weakSelf.managedObjectContext executeFetchRequest:fetchRequest error:NULL];
        
        if (results.count == 0) {
            if (errorBlock) {
                NSError *error = [NSError errorWithDescription:CoreDataStoreArtistNotExistsDescription
                                                        reason:CoreDataStoreArtistNotExistsReason
                                                        domain:CoreDataStoreErrorDomain
                                                          code:CoreDataStoreArtistNotExists
                                                   parentError:nil];
                
                errorBlock(error);
                return;
            }
        }
        
        if (completionBlock) {
            completionBlock([results firstObject]);
        }
    }];
}

- (void)updateManagedArtist:(ManagedArtist *)managedArtist withArtist:(Artist *)artist {
    managedArtist.artistIdValue = artist.artistId;
    managedArtist.name = artist.name;
    
    [managedArtist.albumsSet removeAllObjects];
    
    for (Album *album in artist.albums) {
        ManagedAlbum *managedAlbum = [self insertManagedAlbumWithAlbum:album];
        managedAlbum.artist = managedArtist;
        
        [managedArtist.albumsSet addObject:managedAlbum];
    }
}

- (ManagedAlbum *)insertManagedAlbumWithAlbum:(Album *)album {
    ManagedAlbum *managedAlbum = [ManagedAlbum insertInManagedObjectContext:self.managedObjectContext];
    
    managedAlbum.albumIdValue = album.albumId;
    managedAlbum.title = album.title;
    managedAlbum.artworkURL = album.artworkURL;
    managedAlbum.releaseDate = album.releaseDate;
    
    return managedAlbum;
}

- (void)saveOnError:(ErrorBlock)errorBlock {
    NSError *error;
    [self.managedObjectContext save:&error];
    
    if (error) {
        errorBlock(error);
    }
}

@end
