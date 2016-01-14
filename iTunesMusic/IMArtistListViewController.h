//
//  IMArtistListViewController.h
//  iTunesMusic
//
//  Created by Toni on 13/01/16.
//  Copyright © 2016 Toni. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "IMArtistListViewInterface.h"
#import "IMArtistListModuleInterface.h"

@interface IMArtistListViewController : UITableViewController <IMArtistListViewInterface>

@property (nonatomic, strong) id<IMArtistListModuleInterface> eventHandler;

@end
