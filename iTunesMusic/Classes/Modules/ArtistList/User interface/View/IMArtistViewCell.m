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

- (void)awakeFromNib {
    [self configureView];
}

- (void)configureView {
    // Initialization code
    self.artworkView.layer.borderColor = [[UIColor grayColor] CGColor];
    self.artworkView.layer.borderWidth = 1.0;
    self.artworkView.layer.cornerRadius = self.artworkView.bounds.size.width/2;
    self.artworkView.clipsToBounds = YES;
    
    self.artworkView.alpha = 0;
    self.nameLabel.alpha = 0;
}

- (void)setupCellWith:(IMArtistListDisplayArtist *)displayArtist {
    [self.artworkView hnk_setImageFromURL:[NSURL URLWithString:displayArtist.artworkURL]];
    self.nameLabel.text = displayArtist.name;
    
    [UIView animateWithDuration:0.3 animations:^{
        self.artworkView.alpha = 1;
        self.nameLabel.alpha = 1;
    }];
}


@end
