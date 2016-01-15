//
//  IMArtistListWireframe.m
//  iTunesMusic
//
//  Created by Toni on 13/01/16.
//  Copyright © 2016 Toni. All rights reserved.
//

#import "IMArtistListWireframe.h"

#import "IMArtistListViewController.h"
#import "IMArtistListPresenter.h"
#import "IMRootWireframe.h"
#import "IMAlbumListWireframe.h"

static NSString *ArtistListViewControllerIdentifier = @"IMArtistListViewController";

@interface IMArtistListWireframe ()

@property (nonatomic, strong) IMArtistListViewController *artisListViewController;

@end

@implementation IMArtistListWireframe

- (void)presentArtistListInterfaceFromWindow:(UIWindow *)window {
    IMArtistListViewController *artistListViewController = [self artistListViewControllerFromStoryboard];
    artistListViewController.eventHandler = self.artistListPresenter;
    self.artistListPresenter.userInterface = artistListViewController;
    self.artisListViewController = artistListViewController;
    
    [self.rootWireframe showRootViewController:artistListViewController
                                      inWindow:window];
}

- (IMArtistListViewController *)artistListViewControllerFromStoryboard
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main"
                                                         bundle:[NSBundle mainBundle]];
    IMArtistListViewController *viewController = [storyboard instantiateViewControllerWithIdentifier:ArtistListViewControllerIdentifier];
    
    return viewController;
}

- (void)presentAlbumListInterfaceForArtistId:(NSInteger)artistId {
    [self.albumListWireframe presentAlbumListInterfaceForArtistId:artistId];
}

@end
