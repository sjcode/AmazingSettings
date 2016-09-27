//
//  AMSettingsCell.h
//  AmazingSettings
//
//  Created by sujian on 16/9/23.
//  Copyright © 2016年 sujian. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AMSettingsCell : UITableViewCell

@property (nonatomic, strong) UILabel *title;
@property (nonatomic, strong) UIImageView *icon;

- (void)setupUI;
- (void)configCell:(id)item;
@end
