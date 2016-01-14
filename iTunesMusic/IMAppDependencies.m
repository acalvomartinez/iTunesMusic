//
//  IMAppDepedencies.m
//  iTunesMusic
//
//  Created by Toni on 13/01/16.
//  Copyright © 2016 Toni. All rights reserved.
//

#import "IMAppDependencies.h"

#import "IMRootWireframe.h"
#import "ITunesClient.h"
#import "IMCoreDataStore.h"
#import "IMConfigurationManager.h"
#import "IMCacheManager.h"
#import "IMArtistListWireframe.h"
#import "IMArtistListPresenter.h"
#import "IMArtistListInteractor.h"
#import "IMArtistListDataManager.h"

@interface IMAppDependencies ()

@property (nonatomic, strong) IMArtistListWireframe *artistListWireframe;

@end

@implementation IMAppDependencies

- (id)init
{
    if ((self = [super init]))
    {
        [self configureDependencies];
    }
    
    return self;
}

- (void)configureDependencies
{
    // Root Level Classes
    IMRootWireframe *rootWireframe = [[IMRootWireframe alloc] init];
    ITunesClient *iTunesClient = [[ITunesClient alloc] init];
    IMCoreDataStore *dataStore = [[IMCoreDataStore alloc] init];
    IMConfigurationManager *configurationManager = [[IMConfigurationManager alloc] init];
    IMCacheManager *cacheManager = [[IMCacheManager alloc] init];
    
    // Artist List Module Classes
    IMArtistListWireframe *artistListWireframe = [[IMArtistListWireframe alloc] init];
    IMArtistListPresenter *artistListPresenter = [[IMArtistListPresenter alloc] init];
    IMArtistListDataManager *artistListDataManager = [[IMArtistListDataManager alloc] init];
    artistListDataManager.iTunesClient = iTunesClient;
    artistListDataManager.dataStore = dataStore;
    artistListDataManager.configurationManager = configurationManager;
    artistListDataManager.cacheManager = cacheManager;
    IMArtistListInteractor *artistListInteractor = [[IMArtistListInteractor alloc] initWithDataManager:artistListDataManager];
    // Album List Module Clasess
    
    // Artist List Module Classes
    
    // Album List Module Clasess
    artistListInteractor.output = artistListPresenter;
    
    artistListPresenter.artistListWireframe = artistListWireframe;
    artistListPresenter.artistListInteractor = artistListInteractor;
    
    artistListWireframe.rootWireframe = rootWireframe;
    artistListWireframe.artistListPresenter = artistListPresenter;
    
    self.artistListWireframe = artistListWireframe;
}

- (void)installRootViewControllerIntoWindow:(UIWindow *)window
{
    [self.artistListWireframe presentArtistListInterfaceFromWindow:window];
}



@end
