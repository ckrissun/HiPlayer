//
//  Comment.h
//  HiPlayer
//
//  Created by Rex on 1/3/16.
//  Copyright © 2016 Sandeep Mukherjee. All rights reserved.
//

#ifndef Comment_h
#define Comment_h

#import <Realm/Realm.h>

// Comment Model
@interface Comment : RLMObject

@property NSString *commenter;
@property NSString *content;
@property NSTimeInterval timestamp;

@end

#endif /* Comment_h */
