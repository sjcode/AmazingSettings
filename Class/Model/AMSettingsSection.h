//
//  AMSettingsSection.h
//  AmazingSettings
//
//  Created by sujian on 16/9/23.
//  Copyright © 2016年 sujian. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AMSettingsSection : NSObject

@property (nonatomic, strong, readonly) NSMutableArray *elements;
@property (nonatomic, copy, readonly) NSString *title;

- (instancetype)initWithTitle:(NSString*)title;
- (void)addElement:(AMSettingsElement*)element;
@end
