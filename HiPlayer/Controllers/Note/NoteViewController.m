//
//  NoteViewController.m
//  HiPlayer
//
//  Created by Paqin on 12/1/15.
//  Copyright © 2015 Neo. All rights reserved.
//

#import "NoteViewController.h"


@interface NoteViewController ()

@end

@implementation NoteViewController

static const NSInteger PAGESIZE = 1;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
    self.pageno = 1;
    _commentArray = [[NSMutableArray alloc]initWithObjects:@"demoContent", @"demoContent", @"demoContent", @"demoContent", @"demoContent", nil];
}

- (void)viewWillDisappear:(BOOL)animated {
    if (self.commentViewController && !self.commentViewController.player.isFullscreen) {
        [self cleanupCommentViewController];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)prefersStatusBarHidden {
    return YES;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
  
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(orientationChanged:)
                                                 name:UIDeviceOrientationDidChangeNotification
                                               object:nil];
}

- (void)orientationChanged:(NSNotification *)notification {
    [self adjustViewsForOrientation:[[UIApplication sharedApplication] statusBarOrientation]];
}

- (void) adjustViewsForOrientation:(UIInterfaceOrientation)orientation {
    switch (orientation) {
        case UIInterfaceOrientationPortrait:
        case UIInterfaceOrientationPortraitUpsideDown: {
            // load the portrait view
            if(self.commentViewController && !self.commentViewController.player.fullscreen) {
                if (UIInterfaceOrientationIsLandscape([[UIApplication sharedApplication] statusBarOrientation])) {
                    [[UIDevice currentDevice] setValue:[NSNumber numberWithInteger: UIInterfaceOrientationPortrait] forKey:@"orientation"];
                }
            }
            break;
        }
        case UIInterfaceOrientationLandscapeLeft:
        case UIInterfaceOrientationLandscapeRight: {
            if(self.commentViewController) {
                 NSLog(@"landscape called;");
               // if(!self.commentViewController.player.fullscreen && self.discussionViewController.viewTable.alpha>=1)
                //{
               
                self.commentViewController.player.controlStyle = MPMovieControlStyleDefault;
                self.commentViewController.player.fullscreen = YES;
                 
                [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(willExitFullscreen:) name:MPMoviePlayerWillExitFullscreenNotification object:nil];
                //}
               /* else if( self.commentViewController.viewTable.alpha<=0)
                {
                    if (UIInterfaceOrientationIsLandscape([[UIApplication sharedApplication] statusBarOrientation]))
                        [[UIDevice currentDevice] setValue:[NSNumber numberWithInteger: UIInterfaceOrientationPortrait] forKey:@"orientation"];
                } */
            }
            break;
        }
        case UIInterfaceOrientationUnknown:
            break;
    }
}

- (void)willExitFullscreen:(NSNotification*)notification {
    if (UIInterfaceOrientationIsLandscape([[UIApplication sharedApplication] statusBarOrientation])) {
        [[UIDevice currentDevice] setValue:[NSNumber numberWithInteger: UIInterfaceOrientationPortrait] forKey:@"orientation"];
    }
    [[NSNotificationCenter defaultCenter] removeObserver:self name:MPMoviePlayerWillExitFullscreenNotification object:nil];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


#pragma mark - UITableViewDataSource & delegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.commentArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 110;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [self tableView:tableView commentCellForAtIndexPath:indexPath];
}

// create comment cell
static NSString *const CellIdentifier = @"songsCell";

-(UITableViewCell *)tableView:(UITableView *)tableView commentCellForAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = (UITableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    
    // create border of the background image
    UIImageView *backgroundImage = [cell.contentView viewWithTag:1];
    backgroundImage.layer.borderColor = [UIColor lightGrayColor].CGColor;
    backgroundImage.layer.borderWidth = 0.5;
    // create rounded player image
    UIImageView *profileImage = [cell.contentView viewWithTag:2];
    profileImage.layer.cornerRadius = profileImage.frame.size.width/2;
    profileImage.layer.masksToBounds = YES;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self cleanupCommentViewController];
    [self showCommentViewController];
}

#pragma mark - Important Methods

- (void)showCommentViewController {
    if (UIInterfaceOrientationIsLandscape([[UIApplication sharedApplication] statusBarOrientation])) {
        [[UIDevice currentDevice] setValue:[NSNumber numberWithInteger: UIInterfaceOrientationPortrait] forKey:@"orientation"];
    }
    
    self.commentViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"CommentViewController"];
    
    //initial frame
    UIView *parentView = self.navigationController.view;
    self.commentViewController.view.frame = CGRectMake(parentView.frame.size.width-50, parentView.frame.size.height-50, parentView.frame.size.width, parentView.frame.size.height);
    self.commentViewController.initialFirstViewFrame = parentView.frame;
    self.commentViewController.view.alpha = 0;
    self.commentViewController.view.transform = CGAffineTransformMakeScale(0.2, 0.2);
    [parentView addSubview:self.commentViewController.view];
    self.commentViewController.onView = parentView;
    
    [UIView animateWithDuration:0.9f animations:^{
        self.commentViewController.view.transform = CGAffineTransformMakeScale(1.0, 1.0);
        self.commentViewController.view.alpha = 1;
        self.commentViewController.view.frame = CGRectMake(parentView.frame.origin.x, parentView.frame.origin.y, parentView.frame.size.width, parentView.frame.size.height);
    }];
}

- (void)cleanupCommentViewController {
    if (!self.commentViewController) {
        return;
    }
    [self.commentViewController removeView];
    [self.commentViewController.view removeFromSuperview];
    self.commentViewController = nil;
}

- (void)removeController {
    [self cleanupCommentViewController];
}

@end // NoteViewController.m
