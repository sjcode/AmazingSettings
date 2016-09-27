//
//  AMNavigationController.m
//  AmazingSettings
//
//  Created by sujian on 16/9/23.
//  Copyright © 2016年 sujian. All rights reserved.
//

#import "AMNavigationController.h"

@interface AMNavigationController ()

@end

@implementation AMNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return self.topViewController.supportedInterfaceOrientations;
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return self.topViewController.preferredStatusBarStyle;
}

@end
