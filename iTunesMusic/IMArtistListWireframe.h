//
//  IMArtistListWireframe.h
//  iTunesMusic
//
//  Created by Toni on 13/01/16.
//  Copyright © 2016 Toni. All rights reserved.
//

#import <Foundation/Foundation.h>
@import UIKit;

@class IMArtistListPresenter;
@class IMRootWireframe;

@interface IMArtistListWireframe : NSObject

@property (nonatomic, strong) IMArtistListPresenter *artistListPresenter;
@property (nonatomic, strong) IMRootWireframe *rootWireframe;

- (void)presentArtistListInterfaceFromWindow:(UIWindow *)window;

@end
