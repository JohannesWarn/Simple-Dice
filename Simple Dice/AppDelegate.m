//
//  AppDelegate.m
//  Simple Dice
//
//  Created by Johannes Warn on 2017-11-04.
//  Copyright © 2017 Johannes Wärn. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    return YES;
}

@end

@implementation UINavigationController (StatusbarStyle)

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

@end
