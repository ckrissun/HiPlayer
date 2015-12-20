//
//  AppDelegate.h
//  HiPlayer
//
//  Created by Paqin on 12/1/15.
//  Copyright © 2015 Neo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CoreDataHelper/CoreDataHelper.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, strong, readonly) CoreDataHelper *coreDataHelper;

@end

