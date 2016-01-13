//
//  Artist.h
//  iTunesMusic
//
//  Created by Toni on 13/01/16.
//  Copyright © 2016 Toni. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Album.h"

@interface Artist : NSObject

@property (nonatomic, assign) NSInteger artistId;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, strong) NSArray <Album *> *albums;

+ (instancetype)artistWithId:(NSInteger)artistId
                        name:(NSString *)name
                      albums:(NSArray *)albums;

- (instancetype)initWithId:(NSInteger)artistId
                      name:(NSString *)name
                    albums:(NSArray *)albums;

@end
