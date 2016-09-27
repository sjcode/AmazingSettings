//
//  AMSettingsViewController.h
//  AmazingSettings
//
//  Created by sujian on 16/9/23.
//  Copyright © 2016年 sujian. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AMSettingsViewModel;

@interface AMSettingsViewController : UIViewController
@property (nonatomic, strong, readonly) AMSettingsViewModel *viewModel;

- (instancetype)initWithViewModel:(id)viewModel;
@end
