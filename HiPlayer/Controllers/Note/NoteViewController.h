//
//  NoteViewController.h
//  HiPlayer
//
//  Created by Paqin on 12/1/15.
//  Copyright © 2015 Neo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CommentViewController.h"

//Define the protocol for the delegate

@interface NoteViewController : UIViewController<RemoveViewDelegate>


@property(strong,nonatomic)CommentViewController *secondViewController;

@property (weak, nonatomic) IBOutlet UITableView *commentsTable;

@property (strong, nonatomic)NSMutableArray *discussionArray;
@property (nonatomic, readwrite)NSInteger totalCount;
@property (nonatomic, readwrite)NSInteger pageno;
@property (nonatomic, readwrite)NSString *topicID;
@property (nonatomic,assign) BOOL isCanceledOperation;

@end
