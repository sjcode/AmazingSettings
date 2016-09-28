//
//  AMSettingsOptionCell.m
//  AmazingSettings
//
//  Created by sujian on 16/9/28.
//  Copyright © 2016年 sujian. All rights reserved.
//

#import "AMSettingsOptionCell.h"
#import "AMSettingsOptionElement.h"

@interface AMSettingsOptionCell ()
@property (nonatomic, strong) UILabel *title;
@property (nonatomic, strong) UILabel *value;
@property (nonatomic, strong) UIImageView *mark;
@end

@implementation AMSettingsOptionCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI{
    [self.contentView addSubview:self.title];
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.title
                                                                 attribute:NSLayoutAttributeCenterY
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:self.contentView
                                                                 attribute:NSLayoutAttributeCenterY
                                                                multiplier:1 constant:0]];
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.title
                                                                 attribute:NSLayoutAttributeLeft
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:self.contentView
                                                                 attribute:NSLayoutAttributeLeft
                                                                multiplier:1 constant:18]];
    
    [self.contentView addSubview:self.mark];
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.mark
                                                                 attribute:NSLayoutAttributeCenterY
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:self.contentView
                                                                 attribute:NSLayoutAttributeCenterY
                                                                multiplier:1
                                                                  constant:0]];
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.mark
                                                                 attribute:NSLayoutAttributeRight
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:self.contentView
                                                                 attribute:NSLayoutAttributeRight
                                                                multiplier:1
                                                                  constant:-30]];
    
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

- (UIImageView*)mark{
    if (!_mark) {
        _mark = [[UIImageView alloc]init];
        _mark.translatesAutoresizingMaskIntoConstraints = NO;
    }
    return _mark;
}

- (void)configCell:(AMSettingsOptionModel*)item{
    self.title.text = item.title;
    [self.title sizeToFit];
    if (item.marked) {
        self.mark.image = [UIImage imageNamed:@"icon_settings_marked"];
        [self.mark sizeToFit];
    }else{
        self.mark.image = nil;
    }
}

@end
