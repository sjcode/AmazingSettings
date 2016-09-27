//
//  AMSettingsViewModel.m
//  AmazingSettings
//
//  Created by sujian on 16/9/23.
//  Copyright © 2016年 sujian. All rights reserved.
//

#import "AMSettingsViewModel.h"

@interface  AMSettingsViewModel()
@property (nonatomic, strong, readwrite) NSMutableArray *dataSource;
@end

@implementation AMSettingsViewModel

- (instancetype)init{
    self = [super init];
    if (self) {
        _dataSource = [[NSMutableArray alloc]init];
    }
    return self;
}

- (void)addSection:(AMSettingsSection*)section{
    [self.dataSource addObject:section];
}
@end
