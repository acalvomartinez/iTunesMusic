//
//  ArtistJSONParser.h
//  iTunesMusic
//
//  Created by Toni on 13/01/16.
//  Copyright © 2016 Toni. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Artist;

typedef void(^ArtistParseBlock)(Artist *);
typedef void(^ParseErrorBlock)(NSError *);

@interface JSONParser : NSObject

+ (void)artistFromJSONDictionary:(NSDictionary *)jsonDictionary
                              completion:(ArtistParseBlock)completionBlock
                                 onError:(ParseErrorBlock)errorBlock;

@end
