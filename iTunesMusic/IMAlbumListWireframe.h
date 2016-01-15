//
//  IMAlbumListWireframe.h
//  iTunesMusic
//
//  Created by Toni on 15/01/16.
//  Copyright © 2016 Toni. All rights reserved.
//

#import <Foundation/Foundation.h>

@class IMAlbumListPresenter;
@class IMRootWireframe;

@interface IMAlbumListWireframe : NSObject

@property (nonatomic, strong) IMAlbumListPresenter *albumListPresenter;
@property (nonatomic, strong) IMRootWireframe *rootWireframe;

- (void)presentAlbumListInterfaceForArtistId:(NSInteger)artistId;

@end
