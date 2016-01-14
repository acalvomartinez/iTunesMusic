//
//  IMArtistListPresenter.h
//  iTunesMusic
//
//  Created by Toni on 13/01/16.
//  Copyright © 2016 Toni. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "IMArtistListModuleInterface.h"
#import "IMArtistListInteractorIO.h"

@class IMArtistListViewController;
@class IMArtistListWireframe;

@interface IMArtistListPresenter : NSObject <IMArtistListModuleInterface, IMArtistListInteractorOutput>

@property (nonatomic, strong) id<IMArtistListInteractorInput> artistListInteractor;
@property (nonatomic, strong) IMArtistListViewController *userInterface;
@property (nonatomic, strong) IMArtistListWireframe *artistListWireframe;

@end
