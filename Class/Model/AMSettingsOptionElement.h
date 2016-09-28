//
//  AMSettingsOptionElement.h
//  AmazingSettings
//
//  Created by sujian on 16/9/27.
//  Copyright © 2016年 sujian. All rights reserved.
//

#import "AMSettingsElement.h"

@interface AMSettingsOptionModel : NSObject
@property (nonatomic, copy, readonly) NSString *title;
@property (nonatomic, assign, readwrite) BOOL marked;
- (instancetype)initWithTitle:(NSString*)title;
@end

@interface AMSettingsOptionElement : AMSettingsElement
@property (nonatomic, strong) NSArray *options;
@property (nonatomic, assign) NSUInteger indexOfSelected;
@end
