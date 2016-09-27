//
//  AMSettingsElement+RACCommandSupport.m
//  QuanDi
//
//  Created by sujian on 16/8/22.
//  Copyright © 2016年 sujian. All rights reserved.
//

#import "AMSettingsElement+RACCommandSupport.h"
#import <objc/runtime.h>

static void *AMSettingsRacCommandKey = &AMSettingsRacCommandKey;

@implementation AMSettingsElement (RACCommandSupport)


- (RACCommand*)rac_command{
    return objc_getAssociatedObject(self, AMSettingsRacCommandKey);
}

- (void)setRac_command:(RACCommand *)command{
    objc_setAssociatedObject(self, AMSettingsRacCommandKey, command, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
