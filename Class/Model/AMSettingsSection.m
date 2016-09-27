//
//  AMSettingsSection.m
//  AmazingSettings
//
//  Created by sujian on 16/9/23.
//  Copyright © 2016年 sujian. All rights reserved.
//

#import "AMSettingsSection.h"

@interface AMSettingsSection()
@property (nonatomic, strong, readwrite) NSMutableArray *elements;
@property (nonatomic, copy, readwrite) NSString *title;
@end

@implementation AMSettingsSection
- (instancetype)init{
    self = [super init];
    if (self) {
        _elements = [[NSMutableArray alloc]init];
    }
    return self;
}

- (instancetype)initWithTitle:(NSString*)title{
    self = [self init];
    if (self) {
        _title = title;
    }
    return self;
}

- (void)addElement:(AMSettingsElement*)element{
    [self.elements addObject:element];
}

@end
