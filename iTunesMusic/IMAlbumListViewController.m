//
//  IMAlbumListViewController.m
//  iTunesMusic
//
//  Created by Toni on 15/01/16.
//  Copyright © 2016 Toni. All rights reserved.
//

#import "IMAlbumListViewController.h"

@interface IMAlbumListViewController ()

@end

@implementation IMAlbumListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.eventHandler updateView];
}


- (void)showDisplayAlbums:(NSArray *)albums {
    
}

@end
