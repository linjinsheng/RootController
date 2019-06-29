//
//  CustomTaBarController.h
//  Sale_app
//
//  Created by eddy on 2018/1/3.
//  Copyright © 2018年 eddy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomTaBarController : UITabBarController

+ (instancetype)currentTabBarController;

+ (UIViewController *)viewControllerWithIndex:(NSInteger)index;

@end
