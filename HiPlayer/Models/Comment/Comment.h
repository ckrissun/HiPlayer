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

@property NSInteger noteId;
@property NSInteger commenterId;
@property NSString* commenterName;
@property NSString* content;
@property NSInteger timestamp;

@end

// This protocol enables typed collections. i.e.:
// RLMArray<CommentItem>
RLM_ARRAY_TYPE(Comment)

#endif /* Comment_h */
