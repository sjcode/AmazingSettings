//
//  AMSettingsTextCell.m
//  AmazingSettings
//
//  Created by sujian on 16/9/23.
//  Copyright © 2016年 sujian. All rights reserved.
//

#import "AMSettingsTextCell.h"
#import "AMSettingsElement.h"
#import "AMSettingsTextElement.h"
#import "AMSettingsOptionElement.h"

@interface AMSettingsTextCell ()
@property (nonatomic, strong) UILabel *value;
@end

@implementation AMSettingsTextCell

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
    [super setupUI];
    
    [self.contentView addSubview:self.value];
    [self.contentView addConstraint:
     [NSLayoutConstraint constraintWithItem:self.value
                                  attribute:NSLayoutAttributeCenterY
                                  relatedBy:NSLayoutRelationEqual
                                     toItem:self.contentView
                                  attribute:NSLayoutAttributeCenterY
                                 multiplier:1
                                   constant:0]];
    [self.contentView addConstraint:
     [NSLayoutConstraint constraintWithItem:self.value
                                  attribute:NSLayoutAttributeRight
                                  relatedBy:NSLayoutRelationEqual
                                     toItem:self.contentView
                                  attribute:NSLayoutAttributeRight
                                 multiplier:1
                                   constant:0]];
    
    [self.contentView addConstraint:
     [NSLayoutConstraint constraintWithItem:self.value
                                  attribute:NSLayoutAttributeWidth
                                  relatedBy:NSLayoutRelationLessThanOrEqual
                                     toItem:self.contentView
                                  attribute:NSLayoutAttributeWidth
                                 multiplier:.5
                                   constant:-5]];
    
    
}

- (UILabel*)value{
    if (!_value) {
        _value = [[UILabel alloc]init];
        _value.font = [UIFont systemFontOfSize:12];
        _value.textColor = [UIColor grayColor];
        _value.textAlignment = NSTextAlignmentRight;
        _value.lineBreakMode = NSLineBreakByTruncatingTail;
        _value.translatesAutoresizingMaskIntoConstraints = NO;
    }
    return _value;
}

- (void)configCell:(id)item{
    [super configCell:item];
    if ([item isKindOfClass:[AMSettingsTextElement class]]) {
        self.value.text = ((AMSettingsTextElement*)item).value;
    }else if([item isKindOfClass:[AMSettingsOptionElement class]]){
        AMSettingsOptionElement *element = (AMSettingsOptionElement*)item;
        AMSettingsOptionModel *model = element.options[element.indexOfSelected];
        self.value.text = model.title;
        
    }else{
        
    }
}
@end

@interface AMTextEntryTableViewCell ()<UITextFieldDelegate>
@property (nonatomic, strong) UIButton *clearButton;
@end

@implementation AMTextEntryTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        [self addSubview:self.textField];
        
        [self addConstraint:[NSLayoutConstraint constraintWithItem:self.textField attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeft multiplier:1 constant:28]];
        
        [self addConstraint:[NSLayoutConstraint constraintWithItem:self.textField attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeRight multiplier:1 constant:-18]];
        
        [self addConstraint:[NSLayoutConstraint constraintWithItem:self.textField attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterY multiplier:1 constant:0]];
        
        CGSize size = [self.textField.placeholder sizeWithAttributes:@{NSFontAttributeName:self.textField.font}];
        
        [self.textField addConstraint:[NSLayoutConstraint constraintWithItem:self.textField attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute  multiplier:1 constant:size.height+8]];
        
        
        UIButton *clear = [[UIButton alloc]init];
        clear.translatesAutoresizingMaskIntoConstraints = NO;
        [clear setImage:[UIImage imageNamed:@"Clear"] forState:UIControlStateNormal];
        [clear addTarget:self action:@selector(clear:) forControlEvents:UIControlEventTouchUpInside];
        [clear sizeToFit];
        
        [self addSubview:clear];
        self.clearButton = clear;
        
        [self addConstraint:
         [NSLayoutConstraint constraintWithItem:clear attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.textField attribute:NSLayoutAttributeRight multiplier:1 constant:-5]];
        
        [self addConstraint:[NSLayoutConstraint constraintWithItem:clear attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterY multiplier:1 constant:0]];
        
        clear.hidden = YES;
    }
    return self;
}

- (UITextField*)textField{
    if (!_textField) {
        _textField = [[UITextField alloc]init];
        _textField.translatesAutoresizingMaskIntoConstraints = NO;
        _textField.font = [UIFont systemFontOfSize:14];
        _textField.textColor = [UIColor grayColor];
        _textField.placeholder = @"placeholder";
        _textField.tintColor = [UIColor grayColor];
        _textField.delegate = self;
        [_textField addTarget:self
                       action:@selector(textFieldDidChange:)
             forControlEvents:UIControlEventEditingChanged];
    }
    return _textField;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField{
    if (textField.text.length > 0) {
        self.clearButton.hidden = NO;
    }
}

- (void)textFieldDidEndEditing:(UITextField *)textField{
    self.clearButton.hidden = YES;
}

- (void)textFieldDidChange:(UITextField*)textField{
    if (textField.text.length == 0) {
        self.clearButton.hidden = YES;
    }else{
        self.clearButton.hidden = NO;
    }
}

- (void)clear:(id)sender{
    self.textField.text = @"";
}

- (UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}

@end