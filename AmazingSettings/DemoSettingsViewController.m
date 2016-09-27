//
//  DemoSettingsViewController.m
//  AmazingSettings
//
//  Created by sujian on 16/9/23.
//  Copyright © 2016年 sujian. All rights reserved.
//

#import "DemoSettingsViewController.h"
#import "UIColor+Util.h"

@interface DemoSettingsViewController ()

@end

@implementation DemoSettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"AMSettings";
    [self.navigationController.navigationBar setBackgroundImage:[[UIColor colorWithRed:0.8504 green:0.2182 blue:0.1592 alpha:0.8]colorToImage]
                                                  forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.shadowImage = [UIImage new];
    self.navigationController.navigationBar.translucent = YES;
    self.navigationController.view.backgroundColor = [UIColor clearColor];
}

@end
