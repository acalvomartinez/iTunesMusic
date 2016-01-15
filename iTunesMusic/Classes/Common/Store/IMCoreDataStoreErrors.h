//
//  DataStoreErrors.h
//  openweather
//
//  Created by Toni on 20/12/15.
//  Copyright © 2015 Toni. All rights reserved.
//

#import <Foundation/Foundation.h>

static NSString * const CoreDataStoreErrorDomain = @"iTunesMusicCoreDataDomain";

typedef enum coreDataErrorTypes {
    CoreDataStoreError,
    CoreDataStoreArtistNotExists
} CoreDataErrorTypes;

static NSString * const CoreDataStoreArtistNotExistsDescription = @"Something about Core Data";
static NSString * const CoreDataStoreArtistNotExistsReason = @"Couldn't find artist";
