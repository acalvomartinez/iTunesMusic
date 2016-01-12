//
//  ITunesClientErrors.h
//  iTunesMusic
//
//  Created by Toni on 12/01/16.
//  Copyright © 2016 Toni. All rights reserved.
//

#import <Foundation/Foundation.h>

static NSString * const NetworkingErrorDomain = @"com.unagistudio.itunesmusic.networking.ErrorDomain";

typedef enum networkingErrorTypes {
    NetworkingErrorCode,
    NetworkingConnectionErrorCode,
    NetworkingNotAvailableErrorCode,
    NetworkingNumberOfRetriesExceededErrorCode,
    NetworkingActualWeatherErrorCode,
    NetworkingForecastErrorCode
} NetworkingsErrorTypes;

static NSString * const NetworkingErrorDescription = @"Something about Networking";
static NSString * const NetworkingErrorConnection = @"Connection error";

static NSString * const NetworkingErrorNotAvailable = @"Network not available";
static NSString * const NetworkingErrorNumberOfRetriesExceeded = @"Number of retries exceeded.";

static NSString * const NetworkingErrorArtistInfoRequest = @"Error in Artist Info Request. Check your network connection and try later.";
