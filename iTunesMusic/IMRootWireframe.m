//
//  IMRootWireframe.m
//  iTunesMusic
//
//  Created by Toni on 13/01/16.
//  Copyright © 2016 Toni. All rights reserved.
//

#import "IMRootWireframe.h"

@interface IMRootWireframe ()

@property (nonatomic, strong) UINavigationController *navigationController;

@end

@implementation IMRootWireframe

- (void)showRootViewController:(UIViewController *)viewController
                      inWindow:(UIWindow *)window
{
    UINavigationController *navigationController = [self navigationControllerFromWindow:window];
    navigationController.viewControllers = @[viewController];
    
    self.navigationController = navigationController;
}

- (void)presentViewController:(UIViewController *)viewController {
    [self.navigationController pushViewController:viewController animated:YES];
}


- (UINavigationController *)navigationControllerFromWindow:(UIWindow *)window
{
    UINavigationController *navigationController = (UINavigationController *)[window rootViewController];
    
    return navigationController;
}

@end
