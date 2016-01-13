//
//  ArtistJSONParser.h
//  iTunesMusic
//
//  Created by Toni on 13/01/16.
//  Copyright © 2016 Toni. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JSONParser : NSObject

+ (void)artistFromJSONDictionary:(NSDictionary *)jsonDictionary
                              completion:(ActualForecastParseBlock)completionBlock
                                 onError:(ParseErrorBlock)errorBlock;

@end
