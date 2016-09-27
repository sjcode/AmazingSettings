//
//  AMSettingsElement+RACCommandSupport.h
//  AmazingSettings
//
//  Created by sujian on 16/8/22.
//  Copyright © 2016年 sujian. All rights reserved.
//

#import "AMSettingsElement.h"
#import <ReactiveCocoa/ReactiveCocoa.h>

@interface AMSettingsElement (RACCommandSupport)
@property (nonatomic, strong) RACCommand *rac_command;
@end
