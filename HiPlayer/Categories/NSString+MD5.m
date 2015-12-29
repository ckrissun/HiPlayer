//
//  NSString+MD5.m
//  HiPlayer
//
//  Created by Rex on 12/29/15.
//  Copyright © 2015 Sandeep Mukherjee. All rights reserved.
//

#import <CommonCrypto/CommonDigest.h>
#import "NSString+MD5.h"

@implementation NSString (MD5)

NSString *const salt = @"hiplayer_salt";

- (NSString *)getMD5 {
    const char* input = [[NSString stringWithFormat:@"%@_%@", self, salt] UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(input, (CC_LONG)strlen(input), result);
    
    NSMutableString *md5 = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH*2];
    for (NSInteger i = 0; i < CC_MD5_DIGEST_LENGTH; i++) {
        [md5 appendFormat:@"%02x", result[i]];
    }
    return md5;
}

@end
