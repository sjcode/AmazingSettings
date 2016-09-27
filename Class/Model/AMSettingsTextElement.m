//
//  AMSettingsTextElement.m
//  AmazingSettings
//
//  Created by sujian on 16/9/23.
//  Copyright © 2016年 sujian. All rights reserved.
//

#import "AMSettingsTextElement.h"

@interface AMSettingsTextElement ()

@end

@implementation AMSettingsTextElement

- (instancetype)initWithTitle:(NSString*)title placeholder:(NSString*)placeholder{
    self = [super initWithTitle:title];
    if (self) {
        _placeholder = placeholder;
    }
    return self;
}
@end
