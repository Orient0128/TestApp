//
//  navigationController.m
//  TestApp
//
//  Created by Orient on 16/6/12.
//  Copyright © 2016年 Orient. All rights reserved.
//

#import "navigationController.h"

@interface navigationController ()

@end

@implementation navigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    //第二个子视图
    if (self.childViewControllers.count > 1) {
        
        viewController.hidesBottomBarWhenPushed = YES;//Hide tabBar
    
    }
    
    [super pushViewController:viewController animated:animated];
}

@end
