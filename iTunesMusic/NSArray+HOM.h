//
//  NSArray+HOM.h
//  iTunesMusic
//
//  Created by Toni on 14/01/16.
//  Copyright © 2016 Toni. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (HOM)

- (NSArray *)arrayFromObjectsCollectedWithBlock:(id(^)(id object))block;

@end
