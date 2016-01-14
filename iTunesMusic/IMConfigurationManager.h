//
//  IMConfigurationManager.h
//  iTunesMusic
//
//  Created by Toni on 14/01/16.
//  Copyright © 2016 Toni. All rights reserved.
//

#import <Foundation/Foundation.h>

static NSString * const artistIdKey = @"artistId";
static NSString * const limitKey = @"limit";

@interface IMConfigurationManager : NSObject

- (NSArray *)artistListAndLimitsFromConfigurationFile;

@end
