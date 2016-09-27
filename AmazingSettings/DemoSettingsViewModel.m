//
//  DemoSettingsViewModel.m
//  AmazingSettings
//
//  Created by sujian on 16/9/23.
//  Copyright © 2016年 sujian. All rights reserved.
//

#import "DemoSettingsViewModel.h"
#import "ReactiveCocoa.h"
#import "AMSettingsSection.h"
#import "AMSettingsTextElement.h"
#import "AMSettingsElement+RACCommandSupport.h"

@interface DemoSettingsViewModel ()
@property (nonatomic, strong) RACCommand *updateTextFieldCommand;
@end

@implementation DemoSettingsViewModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self initCommand];
        [self initSettings];
    }
    return self;
}

- (void)initSettings{
    
    // Section
    AMSettingsSection *section1 = [[AMSettingsSection alloc]initWithTitle:@"Personal Settings"];
    
    // Nickname
    AMSettingsTextElement *nickname = [[AMSettingsTextElement alloc]initWithTitle:@"Nickname" placeholder:@"Authur"];
    nickname.value = @"Authur Su";
    nickname.icon = [UIImage imageNamed:@"ninja_head"];
    nickname.mixLength = 1;
    nickname.maxLength = 32;
    nickname.rac_command = self.updateTextFieldCommand;
    [section1 addElement:nickname];
    
    // Motto
    AMSettingsTextElement *motto = [[AMSettingsTextElement alloc]initWithTitle:@"Motto" placeholder:@"you known nothing. John Snow."];
    motto.value = @"这家伙很聪明, 什么都没有留下.";
    //motto.icon = [UIImage imageNamed:@"ninja_turtle"];
    nickname.mixLength = 1;
    nickname.maxLength = 32;
    motto.rac_command = self.updateTextFieldCommand;
    [section1 addElement:motto];
    
    [self addSection:section1];
}

- (void)initCommand{
    self.updateTextFieldCommand = [[RACCommand alloc]initWithSignalBlock:^RACSignal *(id input) {
        return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [subscriber sendNext:@YES];
                [subscriber sendCompleted];
            });
            return nil;
        }];
    }];
}
@end
