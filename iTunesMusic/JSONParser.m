//
//  ArtistJSONParser.m
//  iTunesMusic
//
//  Created by Toni on 13/01/16.
//  Copyright © 2016 Toni. All rights reserved.
//

#import "JSONParser.h"
#import "JSONParserErrors.h"
#import "JSONParserIndetifiers.h"

#import "Artist.h"
#import "Album.h"

#import "NSDate+Formatter.h"
#import "NSError+CustomError.h"



@implementation JSONParser

+ (void)artistFromJSONDictionary:(NSDictionary *)jsonDictionary
                      completion:(ArtistParseBlock)completionBlock
                         onError:(ParseErrorBlock)errorBlock {
    if (jsonDictionary.count == 0) {
        
        NSError *parseError = [NSError errorWithDescription:ParserErrorEmptyJSONDescription
                                                     reason:ParserErrorEmptyJSONReasonError
                                                     domain:ParserErrorDomain
                                                       code:ParserErrorEmptyJSONFile
                                                parentError:nil];
        if (errorBlock != nil) errorBlock(parseError);
        return;
    }
    
    Artist *artist = [self artistFromJSONDictionary:jsonDictionary];
    
    if (completionBlock != nil) {
        completionBlock(artist);
    }
}


#pragma mark - Private


+ (Artist *)artistFromJSONDictionary:(NSDictionary *)dictionary {
    
    NSInteger resultCount = [[dictionary valueForKey:resultCountKey] integerValue];
    
    if (resultCount == 0) {
        return nil;
    }
    
    NSArray *results = [dictionary objectForKey:resultsKey];
    
    NSArray *albums = nil;
    if (results.count > 1) {
        albums = [self albumsFromJSONArray:[results subarrayWithRange:NSMakeRange(1,results.count-1)]];
    }
    
    NSDictionary *artisDictionary = [results firstObject];
    
    NSInteger artistId = [[artisDictionary valueForKey:artistIdKey] integerValue];
    NSString *artistName = [artisDictionary objectForKey:artistNameKey];
    
    Artist *artist = [Artist artistWithId:artistId name:artistName albums:albums];
    
    return artist;
}

+ (NSArray *)albumsFromJSONArray:(NSArray *)jsonArray {
    
    NSMutableArray *albums = [NSMutableArray arrayWithCapacity:jsonArray.count];
    
    for (NSDictionary *dictionary in jsonArray) {
        NSInteger albumId = [[dictionary valueForKey:albumIdKey] integerValue];
        NSString *albumTitle = [dictionary objectForKey:albumTitleKey];
        NSString *albumArtworkURL = [dictionary objectForKey:albumArtworkURLKey];
        NSDate *albumReleaseDate = [NSDate dateWithRFC3339String:[dictionary objectForKey:albumReleaseDateKey]];
        
        Album *album = [Album albumWithId:albumId title:albumTitle artworkURL:albumArtworkURL releaseDate:albumReleaseDate];
        
        [albums addObject:album];
    }
    
    return albums;
}

@end
