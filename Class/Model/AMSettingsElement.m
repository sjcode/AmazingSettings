//
//  AMSettingsElement.m
//  AmazingSettings
//
//  Created by sujian on 16/9/23.
//  Copyright © 2016年 sujian. All rights reserved.
//

#import "AMSettingsElement.h"
@interface AMSettingsElement()
@property (nonatomic, copy, readwrite) NSString *title;
@end

@implementation AMSettingsElement

- (instancetype)initWithTitle:(NSString*)title{
    self = [super init];
    if (self) {
        _title = title;
    }
    return self;
}
@end
