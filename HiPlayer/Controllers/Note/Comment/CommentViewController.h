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
@property (nonatomic, assign) id  <RemoveViewDelegate> delegate;
@property (weak, nonatomic) IBOutlet UIView *viewYouTube;
@property (weak, nonatomic) IBOutlet UIView *viewTable;


@property (strong, nonatomic) MPMoviePlayerController *player;
@property (weak, nonatomic) IBOutlet UIView *viewShare;
@property (weak, nonatomic) IBOutlet UIView *viewGrowingTextView;
@property (weak, nonatomic) IBOutlet UITableView *tblView;
@property (weak, nonatomic) IBOutlet UIButton *btnDown;
- (IBAction)btnDownTapAction:(id)sender;
@property (weak, nonatomic) IBOutlet UITextView *txtViewGrowing;
- (IBAction)btnSendAction:(id)sender;


@property(nonatomic)CGRect initialFirstViewFrame;
@property(nonatomic,strong) UIPanGestureRecognizer *panRecognizer;
@property(nonatomic,strong) UITapGestureRecognizer *tapRecognizer;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *btnDownBottomLayout;
-(void)removeView;
@property(nonatomic,strong) UIView *onView;
@end
