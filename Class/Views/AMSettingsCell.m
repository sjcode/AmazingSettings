//
//  AMSettingsCell.m
//  AmazingSettings
//
//  Created by sujian on 16/9/23.
//  Copyright © 2016年 sujian. All rights reserved.
//

#import "AMSettingsCell.h"

@interface AMSettingsCell ()
@end

@implementation AMSettingsCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleDefault;
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        [self setupUI];
    }
    return self;
}

- (void)setupUI{
    
    [self.contentView addSubview:self.icon];
    
    [self.contentView addConstraint:
     [NSLayoutConstraint constraintWithItem:self.icon
                                  attribute:NSLayoutAttributeCenterY
                                  relatedBy:NSLayoutRelationEqual
                                     toItem:self.contentView
                                  attribute:NSLayoutAttributeCenterY
                                 multiplier:1
                                   constant:0]];
    
    [self.contentView addConstraint:
     [NSLayoutConstraint constraintWithItem:self.icon
                                  attribute:NSLayoutAttributeLeft
                                  relatedBy:NSLayoutRelationEqual
                                     toItem:self.contentView
                                  attribute:NSLayoutAttributeLeft
                                 multiplier:1
                                   constant:16]];
    
    [self.contentView addSubview:self.title];
    [self.contentView addConstraint:
     [NSLayoutConstraint constraintWithItem:self.title
                                  attribute:NSLayoutAttributeCenterY
                                  relatedBy:NSLayoutRelationEqual
                                     toItem:self.contentView
                                  attribute:NSLayoutAttributeCenterY
                                 multiplier:1
                                   constant:0]];
    
    [self.contentView addConstraint:
     [NSLayoutConstraint constraintWithItem:self.title
                                  attribute:NSLayoutAttributeLeft
                                  relatedBy:NSLayoutRelationEqual
                                     toItem:self.icon
                                  attribute:NSLayoutAttributeRight
                                 multiplier:1
                                   constant:3]];
    
    [self.contentView addConstraint:
     [NSLayoutConstraint constraintWithItem:self.title
                                  attribute:NSLayoutAttributeWidth
                                  relatedBy:NSLayoutRelationLessThanOrEqual
                                     toItem:self.contentView
                                  attribute:NSLayoutAttributeWidth
                                 multiplier:.5
                                   constant:0]];
}

- (UILabel*)title{
    if(!_title){
        _title = [[UILabel alloc]init];
        _title.font = [UIFont systemFontOfSize:14];
        _title.textColor = [UIColor darkGrayColor];
        _title.textAlignment = NSTextAlignmentRight;
        _title.translatesAutoresizingMaskIntoConstraints = NO;
    }
    return _title;
}

- (UIImageView*)icon{
    if (!_icon) {
        _icon = [[UIImageView alloc]initWithFrame:CGRectZero];
        _icon.translatesAutoresizingMaskIntoConstraints = NO;
        _icon.contentMode = UIViewContentModeScaleAspectFit;
        _icon.clipsToBounds = YES;
    }
    return _icon;
}

- (void)configCell:(AMSettingsElement*)item{
    self.icon.image = item.icon ?: nil;
    [self.icon sizeToFit];
    self.title.text = item.title;
    [self.title sizeToFit];
}
@end
