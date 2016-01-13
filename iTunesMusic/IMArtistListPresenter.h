//
//  IMArtistListPresenter.h
//  iTunesMusic
//
//  Created by Toni on 13/01/16.
//  Copyright © 2016 Toni. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "IMArtistListModuleInterface.h"

@class IMArtistListViewController;
@class IMArtistListWireframe;

@interface IMArtistListPresenter : NSObject <IMArtistListModuleInterface>

@property (nonatomic, strong) IMArtistListViewController *userInterface;
@property (nonatomic, strong) IMArtistListWireframe *artistListWireframe;

@end
