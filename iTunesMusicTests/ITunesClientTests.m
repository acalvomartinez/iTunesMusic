//
//  ITunesClientTests.m
//  iTunesMusic
//
//  Created by Toni on 13/01/16.
//  Copyright © 2016 Toni. All rights reserved.
//

#import <XCTest/XCTest.h>

#import <OHHTTPStubs/OHHTTPStubs.h>
#import <OHHTTPStubs/OHPathHelpers.h>

#import "ITunesClient.h"

@interface ITunesClientTests : XCTestCase

@property (strong, nonatomic) ITunesClient *client;

@end

@implementation ITunesClientTests

- (void)setUp {
    [super setUp];
    self.client = [[ITunesClient alloc] init];
}

- (void)tearDown {
    self.client = nil;
    [OHHTTPStubs removeAllStubs];
    [super tearDown];
}

- (void)testArtistInfoRequest {
    NSURLRequest * __block requestSent = nil;
    [OHHTTPStubs stubRequestsPassingTest:^BOOL(NSURLRequest *request) {
        requestSent = request;
        return YES;
    } withStubResponse:^OHHTTPStubsResponse*(NSURLRequest *request) {
        return [OHHTTPStubsResponse responseWithFileAtPath:OHPathForFile(@"ITunesArtistInfo.json",self.class)
                                                statusCode:200 headers:@{@"Content-Type":@"application/json"}];
    }];
    
    XCTestExpectation *completed = [self expectationWithDescription:@"completed"];
    
    NSDictionary __block *response = nil;
    [self.client fetchArtistInfoWithArtistId:909253 limit:10 success:^(NSDictionary * _Nullable responseObject) {
        response = responseObject;
        [completed fulfill];
    } failure:nil];
    
    [self waitForExpectationsWithTimeout:1 handler:nil];
    
    NSURL *expectedURL = [NSURL URLWithString:@"https://itunes.apple.com/lookup?entity=album&id=909253&limit=10&media=music"];
    
    XCTAssertEqualObjects(expectedURL, requestSent.URL);
    XCTAssertEqualObjects(@"GET", requestSent.HTTPMethod);
    XCTAssertTrue([response isKindOfClass:[NSDictionary class]]);
}

@end
