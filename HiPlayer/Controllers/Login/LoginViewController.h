//
//  LoginViewController.h
//  HiPlayer
//
//  Created by Rex on 12/27/15.
//  Copyright © 2015 Sandeep Mukherjee. All rights reserved.
//

#ifndef LoginViewController_h
#define LoginViewController_h

#import <UIKit/UIKit.h>
#import <MBProgressHUD.h>

@interface LoginViewController : UIViewController <UITextFieldDelegate, UIGestureRecognizerDelegate>

@property (nonatomic, weak) IBOutlet UITextField *accountField;
@property (nonatomic, weak) IBOutlet UITextField *passwordField;
@property (nonatomic, weak) IBOutlet UIButton *loginButton;

@property (nonatomic, weak) IBOutlet UIButton *qqButton;
@property (nonatomic, weak) IBOutlet UIButton *wechatButton;
@property (nonatomic, weak) IBOutlet NSLayoutConstraint *qqButtonRight;
@property (nonatomic, weak) IBOutlet NSLayoutConstraint *qqButtonWidth;
@property (nonatomic, weak) IBOutlet NSLayoutConstraint *wechatButtonRight;
@property (nonatomic, weak) IBOutlet NSLayoutConstraint *wechatButtonWidth;

@property (nonatomic, strong) MBProgressHUD *hub;

@end


#endif /* LoginViewController_h */
