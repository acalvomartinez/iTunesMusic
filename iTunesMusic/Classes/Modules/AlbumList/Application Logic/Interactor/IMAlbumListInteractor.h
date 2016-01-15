//
//  IMAlbumListInteractor.h
//  iTunesMusic
//
//  Created by Toni on 15/01/16.
//  Copyright © 2016 Toni. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "IMAlbumListInteractorIO.h"

@class IMAlbumListDataManager;

@interface IMAlbumListInteractor : NSObject <IMAlbumListInteractorInput>

@property (nonatomic, weak) id<IMAlbumListInteractorOutput> output;

- (instancetype)initWithDataManager:(IMAlbumListDataManager *)dataManager;

@end
