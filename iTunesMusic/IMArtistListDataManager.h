//
//  IMArtistListDataManager.h
//  iTunesMusic
//
//  Created by Toni on 14/01/16.
//  Copyright © 2016 Toni. All rights reserved.
//

#import <Foundation/Foundation.h>

@class IMCoreDataStore;
@class IMConfigurationManager;
@class IMCacheManager;
@class ITunesClient;

typedef void(^IMArtistListDataManagerFetchArtistsBlock)(NSArray *artists);

@interface IMArtistListDataManager : NSObject

@property (nonatomic, strong) ITunesClient *iTunesClient;
@property (nonatomic, strong) IMCoreDataStore *dataStore;
@property (nonatomic, strong) IMConfigurationManager *configurationManager;
@property (nonatomic, strong) IMCacheManager *cacheManager;

- (void)fetchArtistsOnCompletionBlock:(IMArtistListDataManagerFetchArtistsBlock)completionBlock;

@end
