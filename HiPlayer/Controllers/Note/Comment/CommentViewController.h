//
//  CommentViewController.h
//  HiPlayer
//
//  Created by Paqin on 12/1/15.
//  Copyright © 2015 Neo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>

@protocol RemoveViewDelegate

- (void)removeController;

@end

typedef NS_ENUM(NSUInteger, UIPanGestureRecognizerDirection) {
    UIPanGestureRecognizerDirectionUndefined,
    UIPanGestureRecognizerDirectionUp,
    UIPanGestureRecognizerDirectionDown,
    UIPanGestureRecognizerDirectionLeft,
    UIPanGestureRecognizerDirectionRight
};

@interface CommentViewController : UIViewController<UIGestureRecognizerDelegate,UITextViewDelegate>

@property (nonatomic, assign) id<RemoveViewDelegate> delegate;

@property (nonatomic, weak) IBOutlet UIView *viewYouTube;
@property (nonatomic, weak) IBOutlet UIView *viewTable;
@property (nonatomic, weak) IBOutlet UIView *viewShare;
@property (nonatomic, weak) IBOutlet UIView *viewGrowingTextView;
@property (nonatomic, weak) IBOutlet UIButton *btnDown;
@property (nonatomic, weak) IBOutlet UITableView *tblView;
@property (nonatomic, weak) IBOutlet UITextView *txtViewGrowing;
@property (nonatomic, weak) IBOutlet NSLayoutConstraint *btnDownBottomLayout;

- (IBAction)btnDownTapAction:(id)sender;
- (IBAction)btnSendAction:(id)sender;

@property (nonatomic) MPMoviePlayerController *player;
@property (nonatomic) CGRect initialFirstViewFrame;
@property (nonatomic) UIView *onView;
@property (nonatomic) UIPanGestureRecognizer *panRecognizer;
@property (nonatomic) UITapGestureRecognizer *tapRecognizer;
@property (nonatomic) NSMutableArray *comments;

- (void)removeView;

@end // CommentViewController.h