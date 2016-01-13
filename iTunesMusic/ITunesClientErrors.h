//
//  ITunesClientErrors.h
//  iTunesMusic
//
//  Created by Toni on 12/01/16.
//  Copyright © 2016 Toni. All rights reserved.
//

#import <Foundation/Foundation.h>

static NSString * const ITunesClientErrorDomain = @"ITunesClientErrorDomain";

typedef enum iTunesClientErrorTypes {
    NetworkingErrorCode,
    NetworkingConnectionErrorCode,
    NetworkingNotAvailableErrorCode,
    NetworkingNumberOfRetriesExceededErrorCode,
    NetworkingArtistInfoErrorCode,
} ITunesClientErrorTypes;

static NSString * const ITunesClientNetworkingErrorDescription = @"Something about Networking";
static NSString * const ITunesClientNetworkingErrorConnection = @"Connection error";

static NSString * const ITunesClientErrorNotAvailable = @"Network not available";
static NSString * const ITunesClientErrorNumberOfRetriesExceeded = @"Number of retries exceeded.";

static NSString * const ITunesClientErrorArtistInfoRequest = @"Error in Artist Info Request. Check your network connection and try later.";
