//
//  ITunesClient.m
//  iTunesMusic
//
//  Created by Toni on 12/01/16.
//  Copyright © 2016 Toni. All rights reserved.
//

#import "ITunesClient.h"
#import "ITunesClientConstants.h"

#import "NSError+CustomError.h"
#import "ITunesClientErrors.h"

#import <AFNetworking/AFNetworking.h>


@interface ITunesClient ()

@property (strong, nonatomic) AFHTTPSessionManager *sessionManager;

@end

@implementation ITunesClient

- (instancetype)init {
    self = [super init];
    
    if (self) {
        _sessionManager = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:ITunesClientBaseURL]];
    }
    
    return self;
}

- (void)fetchArtistInfoWithArtistId:(NSInteger)artistId
                              limit:(NSInteger)limit
                            success:(CompletionBlock)success
                            failure:(ErrorBlock)failure {
    NSDictionary *parameters = @{ITunesClientIdParameter:@(artistId),
                                 ITunesClientEntityParameter: ITunesClientEntityAlbum,
                                 ITunesClientMediaParameter: ITunesClientMediaMusic,
                                 ITunesClientLimitParameter: @(limit)};
    
    [self fetchDataForPath:ITunesClientLookupPath
                parameters:parameters
                  retrying:ITunesClientNetworkingRetries
                   success:^(NSDictionary * _Nullable responseObject) {
                       if (success) {
                           success(responseObject);
                       }
                   } failure:^(NSError * _Nullable error) {
                       if (failure) {
                           NSError *networkingError = [NSError errorWithDescription:ITunesClientErrorArtistInfoRequest
                                                                             reason:error.localizedFailureReason
                                                                             domain:ITunesClientErrorDomain
                                                                               code:NetworkingNumberOfRetriesExceededErrorCode
                                                                        parentError:error];
                           failure(networkingError);
                       }
                   }];
}


#pragma mark - Private

- (void)fetchDataForPath:(NSString *)path
              parameters:(NSDictionary *)parameters
                retrying:(NSInteger)nTimes
                 success:(CompletionBlock _Nullable)success
                 failure:(ErrorBlock _Nullable)failure {
    if (nTimes <= 0) {
        if (failure) {
            NSError *networkingError = [NSError errorWithDescription:ITunesClientNetworkingErrorDescription
                                                              reason:ITunesClientErrorNumberOfRetriesExceeded
                                                              domain:ITunesClientErrorDomain
                                                                code:NetworkingNumberOfRetriesExceededErrorCode
                                                         parentError:nil];
            failure(networkingError);
        }
    } else {
        [self GET:path parameters:parameters success:^(NSDictionary * _Nullable responseObject) {
            if (success) {
                success(responseObject);
            }
        } failure:^(NSError * _Nullable error) {
            [self fetchDataForPath:path parameters:parameters retrying:nTimes-1 success:success failure:failure];
        }];
        
    }
}


- (void)GET:(NSString *)path
 parameters:(NSDictionary *)parameters
    success:(CompletionBlock _Nullable)success
    failure:(void (^)(NSError * _Nullable))failure {
    
    [self.sessionManager GET:path parameters:parameters progress:nil success:^(NSURLSessionTask *task, id responseObject) {
        if (success) {
            success(responseObject);
        }
    } failure:^(NSURLSessionTask *operation, NSError *error) {
        NSError *networkingError = [NSError errorWithDescription:ITunesClientNetworkingErrorDescription
                                                          reason:error.localizedFailureReason
                                                          domain:ITunesClientErrorDomain
                                                            code:NetworkingErrorCode
                                                     parentError:error];
        if (failure) {
            failure(networkingError);
        }
    }];
}

@end
