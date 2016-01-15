//
//  IMCacheManager.m
//  iTunesMusic
//
//  Created by Toni on 14/01/16.
//  Copyright © 2016 Toni. All rights reserved.
//

#import "IMCacheManager.h"


@interface IMCacheManager ()
@property (nonatomic, strong) dispatch_queue_t chache_q;

@end

@implementation IMCacheManager

- (dispatch_queue_t)chache_q {
    if (!_chache_q) {
        _chache_q = dispatch_queue_create("com.itunesmusic.cache", DISPATCH_QUEUE_SERIAL);
    }
    return _chache_q;
}


-(void)hasChangedDataForArtistId:(NSInteger)artistId andJSONObject:(NSDictionary *)jsonObject completion:(BoolCompletionBlock)completion {
     dispatch_async(self.chache_q, ^{
         if (![self existsJSONObjectAtDiskWithId:artistId]) {
             [self saveToDiskJSONObject:jsonObject withId:artistId];
             dispatch_async(dispatch_get_main_queue(), ^{
                 completion(YES);
             });
         } else {
             [self fetchJSONObjectFromDiskForArtistId:artistId completion:^(NSDictionary *diskJSONObject) {
                 BOOL hasChanged = ![diskJSONObject isEqualToDictionary:jsonObject];
                 
                 if (hasChanged) {
                     [self saveToDiskJSONObject:jsonObject withId:artistId];
                 }
                 dispatch_async(dispatch_get_main_queue(), ^{
                     completion(hasChanged);
                 });
             }];
         }
         
     });
}

- (void)fetchJSONObjectFromDiskForArtistId:(NSInteger)artistId completion:(void (^)(NSDictionary *))completion {
    NSDictionary *jsonObject = [NSKeyedUnarchiver unarchiveObjectWithFile:[self cachePathForArtistFileId:artistId]];
    if (completion) {
        completion(jsonObject);
    }
}

- (void)saveToDiskJSONObject:(NSDictionary *)jsonObject withId:(NSInteger)artistId {
    [NSKeyedArchiver archiveRootObject:jsonObject toFile:[self cachePathForArtistFileId:artistId]];
}

- (BOOL)existsJSONObjectAtDiskWithId:(NSInteger)artistId {
    return [[NSFileManager defaultManager]fileExistsAtPath:[self cachePathForArtistFileId:artistId]];
}

- (NSString *)cachePathForArtistFileId:(NSInteger)artistId {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    return [[paths firstObject] stringByAppendingPathComponent:[NSString stringWithFormat:@"artist-%ld.dat",(long)artistId]];
}

@end
