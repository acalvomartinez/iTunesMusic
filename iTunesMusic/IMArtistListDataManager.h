//
//  IMArtistListDataManager.h
//  iTunesMusic
//
//  Created by Toni on 14/01/16.
//  Copyright © 2016 Toni. All rights reserved.
//

#import <Foundation/Foundation.h>

@class IMCoreDataStore;

@interface IMArtistListDataManager : NSObject

- (instancetype)initWithDataStore:(IMCoreDataStore *)dataStore;

@end
