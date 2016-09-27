//
//  AMSettingsTextElement.h
//  AmazingSettings
//
//  Created by sujian on 16/9/23.
//  Copyright © 2016年 sujian. All rights reserved.
//

#import "AMSettingsElement.h"

@interface AMSettingsTextElement : AMSettingsElement

@property (nonatomic, copy) NSString *placeholder;
@property (nonatomic, copy) NSString *value;
@property (nonatomic, assign) NSInteger maxLength;
@property (nonatomic, assign) NSInteger mixLength;

- (instancetype)initWithTitle:(NSString*)title placeholder:(NSString*)placeholder;

@end
