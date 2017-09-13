//
//  AMSettingsImageCell.m
//  AmazingSettings
//
//  Created by sujian on 16/9/29.
//  Copyright © 2016年 sujian. All rights reserved.
//

#import "AMSettingsImageCell.h"
#import "AMSettingsImageElement.h"
#import <UIImageView+WebCache.h>

@interface AMSettingsImageCell ()
@property (nonatomic, strong) UIImageView *imageViewOfValue;
@end

@implementation AMSettingsImageCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI{
    [super setupUI];
    
    [self.contentView addSubview:self.imageViewOfValue];
    [self.imageViewOfValue addConstraint:[NSLayoutConstraint constraintWithItem:self.imageViewOfValue
                                                                      attribute:NSLayoutAttributeWidth
                                                                      relatedBy:NSLayoutRelationEqual
                                                                         toItem:nil
                                                                      attribute:NSLayoutAttributeNotAnAttribute
                                                                     multiplier:1
                                                                       constant:60]];
    
    [self.imageViewOfValue addConstraint:[NSLayoutConstraint constraintWithItem:self.imageViewOfValue
                                                                      attribute:NSLayoutAttributeHeight
                                                                      relatedBy:NSLayoutRelationEqual
                                                                         toItem:nil
                                                                      attribute:NSLayoutAttributeNotAnAttribute
                                                                     multiplier:1
                                                                       constant:60]];
    
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.imageViewOfValue
                                                     attribute:NSLayoutAttributeCenterY
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self.contentView
                                                     attribute:NSLayoutAttributeCenterY
                                                    multiplier:1
                                                      constant:0]];
    
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.imageViewOfValue
                                                     attribute:NSLayoutAttributeRight
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self.contentView
                                                     attribute:NSLayoutAttributeRight
                                                    multiplier:1
                                                      constant:0]];
    
}

- (void)configCell:(AMSettingsImageElement*)item{
    [super configCell:item];
    self.imageViewOfValue.image = [UIImage imageNamed:@"bk_pic_placeholder"];
    [self.imageViewOfValue sd_setImageWithURL:[NSURL URLWithString:item.imagefile] placeholderImage:[UIImage imageNamed:@"bk_pic_placeholder"]];
}

- (UIImageView*)imageViewOfValue{
    if (!_imageViewOfValue) {
        _imageViewOfValue = [[UIImageView alloc]init];
        _imageViewOfValue.translatesAutoresizingMaskIntoConstraints = NO;
        _imageViewOfValue.layer.cornerRadius = 3;
        _imageViewOfValue.clipsToBounds = YES;
    }
    return _imageViewOfValue;
}

@end
