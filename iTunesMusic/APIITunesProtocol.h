//
//  APIWebServiceProtocol.h
//  iTunesMusic
//
//  Created by Toni on 12/01/16.
//  Copyright © 2016 Toni. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^ITunesServiceCompletionBlock)(NSDictionary * _Nullable);
typedef void(^ErrorBlock)(NSError * _Nullable);

@protocol APIITunesProtocol <NSObject>

@required

- (void)fetchArtistInfoWithArtistId:(NSInteger)artistId
                              limit:(NSInteger)limit
                            success:(ITunesServiceCompletionBlock _Nullable)success
                            failure:(ErrorBlock _Nullable)failure;

@end
