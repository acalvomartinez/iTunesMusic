//
//  IMAlbumListViewController.h
//  iTunesMusic
//
//  Created by Toni on 15/01/16.
//  Copyright © 2016 Toni. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "IMAlbumListViewInterface.h"
#import "IMAlbumListModuleInterface.h"

@interface IMAlbumListViewController : UITableViewController <IMAlbumListViewInterface>

@property (nonatomic, strong) id<IMAlbumListModuleInterface> eventHandler;

@end
