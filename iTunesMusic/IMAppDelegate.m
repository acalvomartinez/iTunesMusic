//
//  AppDelegate.m
//  iTunesMusic
//
//  Created by Toni on 12/01/16.
//  Copyright © 2016 Toni. All rights reserved.
//

#import "IMAppDelegate.h"

#import "IMAppDependencies.h"

@interface IMAppDelegate ()

@property (nonatomic, strong) IMAppDependencies *dependencies;
@end

@implementation IMAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    IMAppDependencies *dependencies = [[IMAppDependencies alloc] init];
    self.dependencies = dependencies;
    
    [self.dependencies installRootViewControllerIntoWindow:self.window];
    
    return YES;
}

@end
