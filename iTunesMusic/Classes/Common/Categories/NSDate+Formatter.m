//
//  NSString+Fomatter.m
//  Radars
//
//  Created by Toni on 08/10/15.
//  Copyright © 2015 Toni. All rights reserved.
//

#import "NSDate+Formatter.h"

@implementation NSDate (Formatter)

+ (instancetype)dateWithRFC3339String:(NSString *)dateString {
    NSDateFormatter *sRFC3339DateFormatter = [[NSDateFormatter alloc] init];
    NSLocale *enUSPOSIXLocale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US_POSIX"];
    
    [sRFC3339DateFormatter setLocale:enUSPOSIXLocale];
    [sRFC3339DateFormatter setDateFormat:@"yyyy'-'MM'-'dd'T'HH':'mm':'ss'Z'"];
    [sRFC3339DateFormatter setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:0]];
    
    NSDate *dateFromString = [sRFC3339DateFormatter dateFromString:dateString];
    
    return dateFromString;
}

- (NSString *)stringFromDateWithDateFormat:(NSString *)dateFormat {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:dateFormat];
    
    NSString *stringfromDate = [dateFormatter stringFromDate:self];
    
    return stringfromDate;
}

- (NSString *)year {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy"];
    return [dateFormatter stringFromDate:self];
}



@end
