//
//  IMAlbumListWireframe.m
//  iTunesMusic
//
//  Created by Toni on 15/01/16.
//  Copyright © 2016 Toni. All rights reserved.
//

#import "IMAlbumListWireframe.h"
#import "IMAlbumListViewController.h"
#import "IMAlbumListPresenter.h"
#import "IMRootWireframe.h"

static NSString *AlbumListViewControllerIdentifier = @"AlbumListViewController";

@implementation IMAlbumListWireframe

- (void)presentAlbumListInterfaceForArtistId:(NSInteger)artistId {
    IMAlbumListViewController *albumListViewController = [self albumListViewControllerFromStoryboard];
    albumListViewController.eventHandler = self.albumListPresenter;
    self.albumListPresenter.userInterface = albumListViewController;
    self.albumListPresenter.artistId = artistId;
    
    [self.rootWireframe presentViewController:albumListViewController];
}

- (IMAlbumListViewController *)albumListViewControllerFromStoryboard
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main"
                                                         bundle:[NSBundle mainBundle]];
    IMAlbumListViewController *viewController = [storyboard instantiateViewControllerWithIdentifier:AlbumListViewControllerIdentifier];
    
    return viewController;
}


@end
