//
//  AMSettingsElement.h
//  AmazingSettings
//
//  Created by sujian on 16/9/23.
//  Copyright © 2016年 sujian. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface AMSettingsElement : NSObject
@property (nonatomic, copy, readonly) NSString *title;
@property (nonatomic, strong, readwrite) UIImage *icon;

- (instancetype)initWithTitle:(NSString*)title;
@end
