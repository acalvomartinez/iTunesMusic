//
//  IMAlbumListPresenter.h
//  iTunesMusic
//
//  Created by Toni on 15/01/16.
//  Copyright © 2016 Toni. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "IMAlbumListModuleInterface.h"
#import "IMAlbumListInteractorIO.h"

@class IMAlbumListWireframe;
@class IMAlbumListViewController;

@interface IMAlbumListPresenter : NSObject <IMAlbumListModuleInterface, IMAlbumListInteractorOutput>

@property (nonatomic, strong) id<IMAlbumListInteractorInput> albumListInteractor;
@property (nonatomic, strong) IMAlbumListViewController *userInterface;
@property (nonatomic, strong) IMAlbumListWireframe *albumListWireframe;
@property (nonatomic, assign) NSInteger artistId;

@end
