//
//  AMSettingsViewModel.h
//  AmazingSettings
//
//  Created by sujian on 16/9/23.
//  Copyright © 2016年 sujian. All rights reserved.
//

#import <Foundation/Foundation.h>
@class AMSettingsSection;

@interface AMSettingsViewModel : NSObject
@property (nonatomic, strong, readonly) NSMutableArray *dataSource;

- (void)addSection:(AMSettingsSection*)section;
@end
