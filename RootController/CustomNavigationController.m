//
//  BaseNavigationController.m
//  Sale_app
//
//  Created by eddy on 2018/1/2.
//  Copyright © 2018年 eddy. All rights reserved.
//

#import "CustomNavigationController.h"

@interface CustomNavigationController ()

@end

@implementation CustomNavigationController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [[UINavigationBar appearance] setTranslucent:NO];
    [self.navigationBar setShadowImage:[[UIImage alloc] init]]; //去除黑线
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if(self.viewControllers.count > 0)
    {
        [viewController setHidesBottomBarWhenPushed:YES];
    }
    
    [super pushViewController:viewController animated:animated];
}

@end
