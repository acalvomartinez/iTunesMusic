//
//  IMArtistListInteractor.h
//  iTunesMusic
//
//  Created by Toni on 14/01/16.
//  Copyright © 2016 Toni. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IMArtistListInteractorIO.h"

@class IMArtistListDataManager;

@interface IMArtistListInteractor : NSObject <IMArtistListInteractorInput>

@property (nonatomic, weak) id<IMArtistListInteractorOutput> output;

- (instancetype)initWithDataManager:(IMArtistListDataManager *)dataManager;

@end
