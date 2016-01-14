//
//  IMCacheManager.h
//  iTunesMusic
//
//  Created by Toni on 14/01/16.
//  Copyright © 2016 Toni. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^BoolCompletionBlock)(BOOL);

@interface IMCacheManager : NSObject

- (void)hasChangedDataForArtistId:(NSInteger)artistId
                   andJSONObject:(NSDictionary *)jsonObject
                      completion:(BoolCompletionBlock)completion;

@end
