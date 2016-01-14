//
//  IMArtistListDataManager.m
//  iTunesMusic
//
//  Created by Toni on 14/01/16.
//  Copyright © 2016 Toni. All rights reserved.
//

#import "IMArtistListDataManager.h"
#import "IMCoreDataStore.h"

@interface IMArtistListDataManager ()
@property (nonatomic, strong) IMCoreDataStore *dataStore;
@end

@implementation IMArtistListDataManager

- (instancetype)initWithDataStore:(IMCoreDataStore *)dataStore {
    self = [super init];
    
    if (self) {
        _dataStore = dataStore;
    }
    return self;
}

@end
