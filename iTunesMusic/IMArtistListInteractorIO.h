//
//  IMArtistListInteractorIO.h
//  iTunesMusic
//
//  Created by Toni on 14/01/16.
//  Copyright © 2016 Toni. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol IMArtistListInteractorInput <NSObject>
- (void)findArtists;
@end


@protocol IMArtistListInteractorOutput <NSObject>
- (void)foundArtists:(NSArray *)artists;
@end