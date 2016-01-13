//
//  IMArtistListViewController.m
//  iTunesMusic
//
//  Created by Toni on 13/01/16.
//  Copyright © 2016 Toni. All rights reserved.
//

#import "IMArtistListViewController.h"
#import "IMArtistListDisplayData.h"

@interface IMArtistListViewController ()
@property (nonatomic, strong) IMArtistListDisplayData *data;
@end

@implementation IMArtistListViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self configureView];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.eventHandler updateView];
}

- (void)configureView {
    self.navigationItem.title = @"Artists";
    
}

#pragma mark - IMArtistListViewInterface

- (void)showArtistListDisplayData:(IMArtistListDisplayData *)data {
    self.data = data;
    
    NSLog(@"Show: %@",self.data);
}

@end
