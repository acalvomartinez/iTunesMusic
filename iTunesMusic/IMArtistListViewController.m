//
//  IMArtistListViewController.m
//  iTunesMusic
//
//  Created by Toni on 13/01/16.
//  Copyright © 2016 Toni. All rights reserved.
//

#import "IMArtistListViewController.h"
#import "IMArtistViewCell.h"
#import "IMArtistListDisplayArtist.h"

static NSString * const ArtistViewCellIdentifier = @"ArtistViewCell";

@interface IMArtistListViewController ()
@property (nonatomic, strong) NSArray *artistsList;
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

- (void)showDisplayArtists:(NSArray *)artists {
    self.artistsList = artists;
    
    [self.tableView reloadData];
}

#pragma mark - UITableViewDelegate and DataSource Methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.artistsList count];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 90;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    IMArtistViewCell *cell = (IMArtistViewCell *)[self.tableView dequeueReusableCellWithIdentifier:ArtistViewCellIdentifier];
    
    [cell setupCellWith:[self.artistsList objectAtIndex:indexPath.row]];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    IMArtistListDisplayArtist *artist = [self.artistsList objectAtIndex:indexPath.row];
    [self.eventHandler showAlbumsArtistId:artist.artistId];
}

@end
