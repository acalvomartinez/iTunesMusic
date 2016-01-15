//
//  IMArtistListDataManager.m
//  iTunesMusic
//
//  Created by Toni on 14/01/16.
//  Copyright © 2016 Toni. All rights reserved.
//

#import "IMArtistListDataManager.h"
#import "ITunesClient.h"
#import "IMCacheManager.h"
#import "IMCoreDataStore.h"
#import "IMConfigurationManager.h"
#import "JSONParser.h"

#import "NSArray+HOM.h"

@interface IMArtistListDataManager ()
@property (nonatomic, copy) NSArray *artistIdsAndLimits;
@end

@implementation IMArtistListDataManager

- (NSArray *)artistIdsAndLimits {
    if (!_artistIdsAndLimits) {
        _artistIdsAndLimits = [self.configurationManager artistListAndLimitsFromConfigurationFile];
    }
    return _artistIdsAndLimits;
}


- (void)fetchArtistsOnCompletionBlock:(IMArtistListDataManagerFetchArtistsBlock)completionBlock {
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0);
    dispatch_async(queue, ^{
        [self fetchFromPesistenceStoreOnCompletionBlock:^(NSArray *artists) {
            dispatch_async(dispatch_get_main_queue(), ^{
                if (completionBlock) {
                completionBlock(artists);
            }
            });
        }];
    });
    dispatch_async(queue, ^{
        [self fecthFromServiceOnCompletionBlock:^(NSArray *artists) {
            dispatch_async(dispatch_get_main_queue(), ^{
                if (completionBlock) {
                completionBlock(artists);
            }
            });
        }];
    });
}

- (void)fetchFromPesistenceStoreOnCompletionBlock:(IMArtistListDataManagerFetchArtistsBlock)completionBlock {
    __weak typeof(self) weakSelf = self;
    __block NSMutableArray *artistList = [NSMutableArray arrayWithCapacity:[self.artistIdsAndLimits count]];
    
    __block NSInteger batchProcess = [self.artistIdsAndLimits count];
    
    for (NSDictionary *artist in self.artistIdsAndLimits) {
        NSInteger artistId = [[artist objectForKey:artistIdKey] integerValue];
        
        [self.dataStore fetchArtistWithArtistId:artistId
                                     completion:^(ManagedArtist *artist) {
                                         batchProcess--;
                                         [artistList addObject:artist];
                                         
                                         if (batchProcess==0) {
                                             NSArray *sortedArtists = [weakSelf artistsFromDataStoreEntries:artistList];
                                             
                                             if (completionBlock) {
                                                 completionBlock(sortedArtists);
                                             }
                                         }
                                     } error:^(NSError *error) {
                                         
                                         
                                     }];
    }
}

- (void)fecthFromServiceOnCompletionBlock:(IMArtistListDataManagerFetchArtistsBlock)completionBlock {
    __weak typeof(self) weakSelf = self;
    __block NSMutableArray *artistList = [NSMutableArray arrayWithCapacity:[self.artistIdsAndLimits count]];
    
    __block NSInteger batchProcess = [self.artistIdsAndLimits count];
    
    for (NSDictionary *artist in self.artistIdsAndLimits) {
        NSInteger artistId = [[artist objectForKey:artistIdKey] integerValue];
        NSInteger limit = [[artist objectForKey:limitKey] integerValue];
        
        [self.iTunesClient fetchArtistInfoWithArtistId:artistId limit:limit success:^(NSDictionary *jsonObject) {
            [weakSelf.cacheManager hasChangedDataForArtistId:artistId andJSONObject:jsonObject completion:^(BOOL hasChanged) {
                batchProcess--;
                
                if (hasChanged) {
                    [JSONParser artistFromJSONDictionary:jsonObject completion:^(Artist *artist) {
                        [weakSelf.dataStore updateOrCreateArtistWith:artist
                                                          completion:^(ManagedArtist *artist) {
                                                              [artistList addObject:artist];
                                                              
                                                              if (batchProcess==0) {
                                                                  [weakSelf.dataStore saveOnError:nil];
                                                                  
                                                                  NSArray *sortedArtists = [weakSelf artistsFromDataStoreEntries:artistList];
                                                                  
                                                                  if (completionBlock) {
                                                                      completionBlock(sortedArtists);
                                                                  }
                                                              }
                                                          } error:^(NSError *error) {
                                                              
                                                          }];
                    } onError:^(NSError *error) {
                        
                    }];
                }
            }];
        } failure:^(NSError *error) {
            
        }];
    }
    
}

- (NSArray *)artistsFromDataStoreEntries:(NSArray *)entries {
    NSSortDescriptor *sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:ManagedArtistAttributes.name ascending:YES];
    NSArray *sortedEntries = [entries sortedArrayUsingDescriptors:@[sortDescriptor]];
    
    return [sortedEntries arrayFromObjectsCollectedWithBlock:^id(ManagedArtist *managedArtist) {
        return [Artist artistWithId:managedArtist.artistIdValue name:managedArtist.name artworkURL:managedArtist.artworkURL];
    }];
}


@end
