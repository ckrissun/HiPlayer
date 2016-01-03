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

+ (NSInteger) numberOfDaysByDate:(NSDate *)startDate endDate:(NSDate *)endDate {
    NSInteger unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit;
    NSCalendar *cal = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    
    NSDateComponents *comps = [cal components:unitFlags fromDate:startDate];
    NSDate *newBegin = [cal dateFromComponents:comps];
    
    comps = [cal components:unitFlags fromDate:endDate];
    NSDate *newEnd = [cal dateFromComponents:comps];
    
    NSTimeInterval interval = [newEnd timeIntervalSinceDate:newBegin];
    return ((NSInteger)interval)/(3600*24);
}

@end
