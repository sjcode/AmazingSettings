//
//  AMAppearance.m
//  AmazingSettings
//
//  Created by sujian on 16/9/23.
//  Copyright © 2016年 sujian. All rights reserved.
//

#import "AMAppearance.h"

@interface AMAppearance ()

@end

@implementation AMAppearance

- (instancetype)init{
    self = [super init];
    if (self) {
        [self setAppearanceDefault];
    }
    return self;
}

- (void)setAppearanceDefault{
    _statusBarStyle = UIStatusBarStyleDefault;
}


@end
