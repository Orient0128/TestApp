//
//  AppDelegate.m
//  TestApp
//
//  Created by Orient on 16/6/12.
//  Copyright © 2016年 Orient. All rights reserved.
//

#import "AppDelegate.h"
#import "tabBarController.h"



@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen]bounds]];
    
    tabBarController *tabBarVC = [[tabBarController alloc] init];
    self.window.rootViewController = tabBarVC;
    
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    

}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    

}

- (void)applicationWillEnterForeground:(UIApplication *)application {
   

}

- (void)applicationDidBecomeActive:(UIApplication *)application {
  

}

- (void)applicationWillTerminate:(UIApplication *)application {
 

}

@end
