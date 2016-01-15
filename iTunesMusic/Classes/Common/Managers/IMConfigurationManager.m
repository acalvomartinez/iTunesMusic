//
//  IMConfigurationManager.m
//  iTunesMusic
//
//  Created by Toni on 14/01/16.
//  Copyright © 2016 Toni. All rights reserved.
//

#import "IMConfigurationManager.h"

@implementation IMConfigurationManager

- (NSArray *)artistListAndLimitsFromConfigurationFile {
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"ArtistList" ofType:@"plist"];
    return [[NSArray alloc] initWithContentsOfFile:filePath];
}

@end
