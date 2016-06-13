//
//  UITabBarController.m
//  TestApp
//
//  Created by Orient on 16/6/12.
//  Copyright © 2016年 Orient. All rights reserved.
//

#import "tabBarController.h"
#import "navigationController.h"
#import "VC1.h"
#import "VC2.h"
#import "VC3.h"
#import "VC4.h"


@interface tabBarController ()

@end

@implementation tabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpAllChildViewController];
    
}


- (void)setUpAllChildViewController {
    
    VC1 *vc1 = [[VC1 alloc] init];
    [self setUpOneChildViewController:vc1 image:[UIImage imageNamed:@"tab_home_icon"] title:@"First"];
    
    VC2 *vc2 = [[VC2 alloc] init];
    [self setUpOneChildViewController:vc2 image:[UIImage imageNamed:@"js"] title:@"Second"];
    
    VC3 *vc3 = [[VC3 alloc] init];
    [self setUpOneChildViewController:vc3 image:[UIImage imageNamed:@"qw"] title:@"Third"];
    
    VC4 *vc4 = [[VC4 alloc] init];
    [self setUpOneChildViewController:vc4 image:[UIImage imageNamed:@"user"] title:@"Fourth"];
    
}

- (void)setUpOneChildViewController:(UIViewController *)VC image:(UIImage *)image title:(NSString *)title {
    
    navigationController *naVC = [[navigationController alloc] initWithRootViewController:VC];
    naVC.title = title;
    naVC.tabBarItem.image = image;
    [naVC.navigationBar setBackgroundImage:[UIImage imageNamed:nil] forBarMetrics:UIBarMetricsCompact];
    VC.navigationItem.title = title;
    
    [self addChildViewController:naVC];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
    
}

@end
