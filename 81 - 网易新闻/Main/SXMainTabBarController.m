//
//  SXMainTabBarController.m
//  81 - 网易新闻
//
//  Created by 董 尚先 on 15/4/9.
//  Copyright (c) 2015年 shangxianDante. All rights reserved.
//

#import "SXMainTabBarController.h"
#import "SXBarButton.h"
#import "SXTabBar.h"
#import "SXMainViewController.h"
#import "SXNavController.h"
#import "SXAdManager.h"


@interface SXMainTabBarController ()<SXTabBarDelegate>

@end

@implementation SXMainTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.tabBar setTintColor:[UIColor redColor]];
    
    self.selectedIndex = 0;
}

#pragma mark - ******************** SXTabBarDelegate代理方法
- (void)ChangSelIndexForm:(NSInteger)from to:(NSInteger)to
{
    self.selectedIndex = to;
}

@end
