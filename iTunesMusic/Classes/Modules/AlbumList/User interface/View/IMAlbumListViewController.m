//
//  IMAlbumListViewController.m
//  iTunesMusic
//
//  Created by Toni on 15/01/16.
//  Copyright © 2016 Toni. All rights reserved.
//

#import "IMAlbumListViewController.h"
#import "IMAlbumViewCell.h"

static NSString * const AlbumViewCellIdentifier = @"AlbumViewCell";
static float const CellHeight = 110;

@interface IMAlbumListViewController ()
@property (nonatomic, strong) NSArray *albumList;
@end

@implementation IMAlbumListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self configureView];
    
    [self.eventHandler updateView];
}

- (void)configureView {
    self.tableView.estimatedRowHeight = CellHeight;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
}

#pragma mark - IMArtistListViewInterface

- (void)showViewTitle:(NSString *)title {
    self.navigationItem.title = title;
}

- (void)showDisplayAlbums:(NSArray *)albums {
    self.albumList = albums;
    
    [self.tableView reloadData];
}

#pragma mark - UITableViewDelegate and DataSource Methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.albumList count];
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewAutomaticDimension;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    IMAlbumViewCell *cell = (IMAlbumViewCell *)[self.tableView dequeueReusableCellWithIdentifier:AlbumViewCellIdentifier];
    
    [cell setupCellWith:[self.albumList objectAtIndex:indexPath.row]];
    
    return cell;
}

@end
