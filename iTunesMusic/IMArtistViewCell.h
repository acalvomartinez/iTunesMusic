//
//  IMArtistViewCell.h
//  iTunesMusic
//
//  Created by Toni on 14/01/16.
//  Copyright © 2016 Toni. All rights reserved.
//

#import <UIKit/UIKit.h>

@class IMArtistListDisplayArtist;

@interface IMArtistViewCell : UITableViewCell

- (void)setupCellWith:(IMArtistListDisplayArtist *)displayArtist;

@end
