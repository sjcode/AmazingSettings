//
//  AMSettingsOptionElement.m
//  AmazingSettings
//
//  Created by sujian on 16/9/27.
//  Copyright © 2016年 sujian. All rights reserved.
//

#import "AMSettingsOptionElement.h"

@interface AMSettingsOptionModel ()
@property (nonatomic, copy, readwrite) NSString *title;
@end

@implementation AMSettingsOptionModel

- (instancetype)initWithTitle:(NSString*)title{
    self = [super init];
    if (self) {
        _title = title;
    }
    return self;
}
@end

@implementation AMSettingsOptionElement

@end
