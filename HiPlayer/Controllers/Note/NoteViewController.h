//
//  NoteViewController.h
//  HiPlayer
//
//  Created by Paqin on 12/1/15.
//  Copyright © 2015 Neo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CommentViewController.h"

@class CommentViewController;

//Define the protocol for the delegate

@interface NoteViewController : UIViewController<RemoveViewDelegate>

@property (nonatomic) CommentViewController *commentViewController;
@property (nonatomic) NSMutableArray *commentArray;

@property (nonatomic, weak) IBOutlet UITableView *commentsTable;

@property (nonatomic, readwrite) NSInteger totalCount;
@property (nonatomic, readwrite) NSInteger pageno;
@property (nonatomic, readwrite) NSString *topicID;
@property (nonatomic, assign) BOOL isCanceledOperation;

@end
