//
//  IMArtistListModuleInterface.h
//  iTunesMusic
//
//  Created by Toni on 13/01/16.
//  Copyright © 2016 Toni. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol IMArtistListModuleInterface <NSObject>

- (void)updateView;
- (void)showAlbumsArtistId:(NSInteger)artistId;

@end
