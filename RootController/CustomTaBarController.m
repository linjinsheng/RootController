//
//  CustomTaBarController.m
//  Sale_app
//
//  Created by eddy on 2018/1/3.
//  Copyright © 2018年 eddy. All rights reserved.
//

#import "CustomTaBarController.h"
#import "CustomNavigationController.h"
#import "HomeController.h"
#import "MarketController.h"
#import "FinancialController.h"
#import "MineController.h"

@interface CustomTaBarController ()

@end

@implementation CustomTaBarController

+ (instancetype)currentTabBarController
{
    id<UIApplicationDelegate> appDelegate = [UIApplication sharedApplication].delegate;
    
    UIViewController *viewController = appDelegate.window.rootViewController;
    
    if (![viewController isKindOfClass:[UITabBarController class]])
    {
        return nil;
    }
    
    return (CustomTaBarController *)viewController;
}

+ (UIViewController *)viewControllerWithIndex:(NSInteger)index
{
    return [CustomTaBarController currentTabBarController].viewControllers[index];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.tabBar setBackgroundColor:[UIColor whiteColor]];
    [self.tabBar setTranslucent:NO];
    [self setUpChildController];
}

- (void)setUpChildController
{
    HomeController *homeCtl = [[HomeController alloc] init];
    homeCtl.tabBarItem = [[UITabBarItem alloc] initWithTitle:LocalizedString(@"首页")
                                                       image:[[UIImage imageNamed:@"i_mmenu01"]
                                                              imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]
                                               selectedImage:[[UIImage imageNamed:@"i_mmenu01_on"]
                                                              imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    UIViewController *firstNavigationController = [[CustomNavigationController alloc]
                                                   initWithRootViewController:homeCtl];
    
    MarketController *marketCtl = [[MarketController alloc] init];
    marketCtl.tabBarItem = [[UITabBarItem alloc] initWithTitle:LocalizedString(@"行情")
                                                         image:[[UIImage imageNamed:@"i_mmenu02"]
                                                                imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]
                                                 selectedImage:[[UIImage imageNamed:@"i_mmenu02_on"]
                                                                imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    UIViewController *secondNavigationController = [[CustomNavigationController alloc]
                                                    initWithRootViewController:marketCtl];
    
    FinancialController *financialCtl = [[FinancialController alloc] init];
    financialCtl.tabBarItem = [[UITabBarItem alloc] initWithTitle:LocalizedString(@"理财")
                                                            image:[[UIImage imageNamed:@"i_mmenu03"]
                                                                   imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]
                                                    selectedImage:[[UIImage imageNamed:@"i_mmenu03_on"]
                                                                   imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    UIViewController *thirdNavigationController = [[CustomNavigationController alloc]
                                                   initWithRootViewController:financialCtl];
    
    MineController *personCtl = [[MineController alloc] init];
    personCtl.tabBarItem = [[UITabBarItem alloc] initWithTitle:LocalizedString(@"我的")
                                                         image:[[UIImage imageNamed:@"i_mmenu04"]
                                                                imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]
                                                 selectedImage:[[UIImage imageNamed:@"i_mmenu04_on"]
                                                                imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    UIViewController *fourthNavigationController = [[CustomNavigationController alloc]
                                                    initWithRootViewController:personCtl];
    
    [self setViewControllers:@[
                               firstNavigationController,
                               secondNavigationController,
                               thirdNavigationController,
                               fourthNavigationController,
                               ]];
    
    // 普通状态下的文字属性
    NSMutableDictionary *normalAttrs = [NSMutableDictionary dictionary];
    normalAttrs[NSForegroundColorAttributeName] = [UIColor fontGrayColor];
    normalAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:12];
    
    // 选中状态下的文字属性
    NSMutableDictionary *selectedAttrs = [NSMutableDictionary dictionary];
    selectedAttrs[NSForegroundColorAttributeName] = [UIColor fontBlackColor];
    
    // 设置文字属性
    UITabBarItem *tabBarItem = [UITabBarItem appearance];
    [tabBarItem setTitleTextAttributes:normalAttrs forState:UIControlStateNormal];
    [tabBarItem setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
