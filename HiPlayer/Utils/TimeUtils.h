//
//  TimeUtils.h
//  HiPlayer
//
//  Created by Rex on 1/3/16.
//  Copyright © 2016 Sandeep Mukherjee. All rights reserved.
//

#ifndef TimeUtils_h
#define TimeUtils_h

#import <Foundation/Foundation.h>

@interface TimeUtils : NSObject

+ (NSInteger)numberOfDaysByTimestamp:(NSTimeInterval)startTimestamp endTimeStamp:(NSTimeInterval)endTimestamp;

@end

#endif /* TimeUtils_h */
