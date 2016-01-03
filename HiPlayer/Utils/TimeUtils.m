//
//  TimeUtils.m
//  HiPlayer
//
//  Created by Rex on 1/3/16.
//  Copyright © 2016 Sandeep Mukherjee. All rights reserved.
//

#import "TimeUtils.h"

@implementation TimeUtils

static NSInteger const secondsOfOneday = 24*3600;

+ (NSInteger) numberOfDaysByTimestamp:(NSTimeInterval)startTimestamp endTimeStamp:(NSTimeInterval)endTimestamp {
    NSTimeZone *timeZone = [NSTimeZone systemTimeZone];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setTimeZone:timeZone];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    
    NSDate *endDate = [NSDate dateWithTimeIntervalSince1970:endTimestamp];
    NSDate *zeroClockOfEndDate = [dateFormatter dateFromString:[dateFormatter stringFromDate:endDate]];
    NSInteger zeroTimestampOfEndDate = [zeroClockOfEndDate timeIntervalSince1970];
    
    NSDate *startDate = [NSDate dateWithTimeIntervalSince1970:startTimestamp];
    NSDate *zeroClockOfStartDate = [dateFormatter dateFromString:[dateFormatter stringFromDate:startDate]];
    NSInteger zeroTimestampOfStartDate = [zeroClockOfStartDate timeIntervalSince1970];
    
    return (zeroTimestampOfEndDate - zeroTimestampOfStartDate) / secondsOfOneday;
}

@end
