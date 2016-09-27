//
//  AppDelegate.m
//  AmazingSettings
//
//  Created by sujian on 16/9/23.
//  Copyright © 2016年 sujian. All rights reserved.
//

#import "AppDelegate.h"
#import "DemoSettingsViewModel.h"
#import "DemoSettingsViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
   
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [self configureAppearance];
    
    [self setSettingsAppearance];
    
    DemoSettingsViewModel *viewModel = [[DemoSettingsViewModel alloc]init];
    
    UINavigationController *navigationController = [[UINavigationController alloc]initWithRootViewController:[[DemoSettingsViewController alloc]initWithViewModel:viewModel]];
    
    self.window.rootViewController = navigationController;
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)setSettingsAppearance{
    AMAppearance *appearance = [AMSettingsElement appearance];
    
    appearance.statusBarStyle = UIStatusBarStyleDefault;
}

- (void)configureAppearance {
    
    self.window.backgroundColor = UIColor.whiteColor;
    [UINavigationBar appearance].barTintColor = [UIColor colorWithWhite:0.2272 alpha:1.0];
    [UINavigationBar appearance].barStyle  = UIBarStyleBlack;
    [UINavigationBar appearance].tintColor = [UIColor whiteColor];
    
    [[UINavigationBar appearance] setShadowImage:[[UIImage alloc] init]];
    [UISegmentedControl appearance].tintColor = [UIColor whiteColor];
    [[UINavigationBar appearance] setBackgroundImage:[[UIImage alloc] init]
                                      forBarPosition:UIBarPositionAny
                                          barMetrics:UIBarMetricsDefault];
    [[UINavigationBar appearance] setShadowImage:[[UIImage alloc] init]];
}


@end
