//
//  IMArtistViewCell.m
//  iTunesMusic
//
//  Created by Toni on 14/01/16.
//  Copyright © 2016 Toni. All rights reserved.
//

#import "IMArtistViewCell.h"

#import "IMArtistListDisplayArtist.h"
#import <Haneke/Haneke.h>

@interface IMArtistViewCell ()
@property (weak, nonatomic) IBOutlet UIImageView *artworkView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@end

@implementation IMArtistViewCell

- (void)setupCellWith:(IMArtistListDisplayArtist *)displayArtist {
    [self.artworkView hnk_setImageFromURL:[NSURL URLWithString:displayArtist.artworkURL]];
    self.nameLabel.text = displayArtist.name;
}


@end
