//
//  IMArtistListInteractor.m
//  iTunesMusic
//
//  Created by Toni on 14/01/16.
//  Copyright © 2016 Toni. All rights reserved.
//

#import "IMArtistListInteractor.h"
#import "IMArtistListDataManager.h"

@interface IMArtistListInteractor ()

@property (nonatomic, strong) IMArtistListDataManager *dataManager;

@end

@implementation IMArtistListInteractor

- (instancetype)initWithDataManager:(IMArtistListDataManager *)dataManager {
    self = [super init];
    
    if (self) {
        _dataManager = dataManager;
    }
    return self;
}

- (void)findArtists {
    
}

@end
