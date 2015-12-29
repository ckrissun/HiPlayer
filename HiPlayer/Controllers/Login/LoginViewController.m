//
//  LoginViewController.m
//  HiPlayer
//
//  Created by Rex on 12/27/15.
//  Copyright © 2015 Sandeep Mukherjee. All rights reserved.
//

#import "LoginViewController.h"
#import "NoteViewController.h"
#import "NSString+MD5.h"

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupSubViews];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    if (_hub) {
        [_hub hide:YES];
    }
}

- (MBProgressHUD *)createHUD {
    UIWindow *window = [[[UIApplication sharedApplication] windows] lastObject];
    MBProgressHUD *hud = [[MBProgressHUD alloc] initWithWindow:window];
    [window addSubview:hud];
    [hud show:YES];
    hud.removeFromSuperViewOnHide = YES;
    return hud;
}

#pragma mark - set subviews

- (void)setupSubViews {
    _accountField.delegate = self;
    _passwordField.delegate = self;
    
    [_accountField addTarget:self action:@selector(returnOnKeyboard:) forControlEvents:UIControlEventEditingDidEndOnExit];
    [_passwordField addTarget:self action:@selector(returnOnKeyboard:) forControlEvents:UIControlEventEditingDidEndOnExit];
    
    // add gesture, so the keyboard will be hidden when somewhere is hit.
    UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideKeyboard)];
    gesture.numberOfTapsRequired = 1;
    gesture.delegate = self;
    [self.view addGestureRecognizer:gesture];
}

#pragma mark - gesture delegate

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch {
    if ([_accountField isFirstResponder] || [_passwordField isFirstResponder]) {
        return YES;
    }
    return NO;
}

- (void)hideKeyboard {
    [_accountField resignFirstResponder];
    [_passwordField resignFirstResponder];
}

- (void)returnOnKeyboard:(UITextField*)sender {
    if (sender == _accountField) {
        [_passwordField becomeFirstResponder];
        return;
    }
    if (sender == _passwordField) {
        [self hideKeyboard];
        if (_loginButton.enabled) {
            [self login];
        }
    }
}

static NSString *const defaultAccountName = @"test";
static NSString *const defaultPassword = @"d8bab9216bb259fb4ffa5445ecfb9c05";

- (void)login {
    _hub = [self createHUD];
    _hub.labelText = @"Login in";
    _hub.userInteractionEnabled = NO;
    
    // TODO
    NSLog(@"Account: %@, Password: %@", _accountField.text, _passwordField.text);
    
    // if login successfully, just go to the NoteView.
    NSString *md5ForPassword = [_passwordField.text getMD5];
    if ([_accountField.text compare:defaultAccountName] || [md5ForPassword compare:defaultPassword]) {
        _hub.labelText = @"Login Fail";
        _hub.labelColor = [UIColor redColor];
        [_hub hide:YES afterDelay:1];
        return;
    }
    
    [self showNoteViewController];
}

- (void)showNoteViewController {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Note" bundle:[NSBundle mainBundle]];
    NoteViewController *noteViewController = [storyboard instantiateViewControllerWithIdentifier:@"NoteViewController"];
    [self presentViewController:noteViewController animated:YES completion:^{
        if (_hub) {
            [_hub hide:YES];
        }
    }];
}

#pragma mark - login from the third party such as QQ/Wechat/Weibo

- (void)loginFromQQ:(id)sender {
    // TODO
}

- (void)loginFromWechat:(id)sender {
    // TODO
}

- (void)loginFromWeibo:(id)sender {
    // TODO
}

@end