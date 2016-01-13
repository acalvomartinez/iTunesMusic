//
//  JSONParserTests.m
//  iTunesMusic
//
//  Created by Toni on 13/01/16.
//  Copyright © 2016 Toni. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "StubFileUtil.h"

#import "JSONParser.h"
#import "Artist.h"

@interface JSONParserTests : XCTestCase

@end

@implementation JSONParserTests

- (void)testJSONParserShouldReturnErrorWhenPassedAnEmptyDictionary {
    [JSONParser artistFromJSONDictionary:@{} completion:^(Artist *artist) {
        XCTAssertNil(artist);
    } onError:^(NSError *parseError) {
        XCTAssertNotNil(parseError);
    }];
}

- (void)testJSONParserShouldReturnErrorWhenPassedANoResultDictionary {
    NSDictionary *stub = [StubFileUtil dictionaryWithJSONStubFileNamed:@"NoResult"];
    
    [JSONParser artistFromJSONDictionary:stub completion:^(Artist *artist) {
        XCTAssertNil(artist);
    } onError:^(NSError *parseError) {
        XCTAssertNotNil(parseError);
    }];
}

- (void)testJSONParserShouldReturnErrorWhenPassedAnErrorDictionary {
    NSDictionary *stub = [StubFileUtil dictionaryWithJSONStubFileNamed:@"ErrorMessage"];
    
    [JSONParser artistFromJSONDictionary:stub completion:^(Artist *artist) {
        XCTAssertNil(artist);
    } onError:^(NSError *parseError) {
        XCTAssertNotNil(parseError);
    }];
}

- (void)testJSONParserShouldReturnArtistCompleteWhenPassedAJSONDictinoary {
    NSDictionary *stub = [StubFileUtil dictionaryWithJSONStubFileNamed:@"ITunesArtistInfo"];
    
    [JSONParser artistFromJSONDictionary:stub completion:^(Artist *artist) {
        XCTAssertNotNil(artist);
        XCTAssertEqual(909253, artist.artistId);
        XCTAssertEqualObjects(@"Jack Johnson", artist.name);
        XCTAssertEqual(10, artist.albums.count);
    } onError:^(NSError *parseError) {
        XCTAssertNil(parseError);
    }];
}

@end
