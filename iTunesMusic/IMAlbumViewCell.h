//
//  IMAlbumViewCell.h
//  iTunesMusic
//
//  Created by Toni on 15/01/16.
//  Copyright © 2016 Toni. All rights reserved.
//

#import <UIKit/UIKit.h>

@class IMAlbumListDisplayAlbum;

@interface IMAlbumViewCell : UITableViewCell

- (void)setupCellWith:(IMAlbumListDisplayAlbum *)displayAlbum;

@end
