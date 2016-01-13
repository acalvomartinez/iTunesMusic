//
//  NSString+Fomatter.h
//  Radars
//
//  Created by Toni on 08/10/15.
//  Copyright © 2015 Toni. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Formatter)

+ (instancetype)dateWithRFC3339String:(NSString *)stringDate;

- (NSString *)stringFromDateWithDateFormat:(NSString *)dateFormat;


@end
