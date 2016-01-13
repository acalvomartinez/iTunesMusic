//
//  IMArtistListViewInterface.h
//  iTunesMusic
//
//  Created by Toni on 13/01/16.
//  Copyright © 2016 Toni. All rights reserved.
//

#import <Foundation/Foundation.h>

@class IMArtistListDisplayData;

@protocol IMArtistListViewInterface <NSObject>

- (void)showArtistListDisplayData:(IMArtistListDisplayData *)data;

@end
