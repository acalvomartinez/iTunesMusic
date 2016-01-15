//
//  IMAlbumViewCell.m
//  iTunesMusic
//
//  Created by Toni on 15/01/16.
//  Copyright © 2016 Toni. All rights reserved.
//

#import "IMAlbumViewCell.h"
#import "IMAlbumListDisplayAlbum.h"
#import <Haneke/Haneke.h>

@interface IMAlbumViewCell ()
@property (weak, nonatomic) IBOutlet UIImageView *artworkView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *releaseYearLabel;
@end

@implementation IMAlbumViewCell

- (void)awakeFromNib {
    
    [self configureView];
}

- (void)configureView {
    // Initialization code
    self.artworkView.layer.borderColor = [[UIColor grayColor] CGColor];
    self.artworkView.layer.borderWidth = 1.0;
    
    self.artworkView.alpha = 0;
    self.titleLabel.alpha = 0;
    self.releaseYearLabel.alpha = 0;
}

- (void)setupCellWith:(IMAlbumListDisplayAlbum *)displayAlbum {
    [self.artworkView hnk_setImageFromURL:[NSURL URLWithString:displayAlbum.artworkURL]];
    self.titleLabel.text = displayAlbum.title;
    self.releaseYearLabel.text = displayAlbum.releaseYear;
    
    [UIView animateWithDuration:0.5 animations:^{
        self.artworkView.alpha = 1;
        self.titleLabel.alpha = 1;
        self.releaseYearLabel.alpha = 1;
    }];
}

@end
