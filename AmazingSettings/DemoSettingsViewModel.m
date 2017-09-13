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
#import "AMSettingsOptionElement.h"
#import "AMSettingsImageElement.h"

@interface DemoSettingsViewModel ()
@property (nonatomic, strong) RACCommand *updateTextFieldCommand;
@property (nonatomic, strong) RACCommand *updateConstellationCommand;
@property (nonatomic, strong) RACCommand *updateAvatarCommand;
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
    
    
    
    // Constellation
    AMSettingsOptionElement *constellation = [[AMSettingsOptionElement alloc]initWithTitle:@"Constellation"];
    constellation.indexOfSelected = 1;
    NSArray *array = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"constellation" ofType:@"plist"]];
    __block NSInteger index = 0;
    constellation.options = [array.rac_sequence map:^id(NSString *value) {
        AMSettingsOptionModel *model = [[AMSettingsOptionModel alloc]initWithTitle:value];
        if (index == constellation.indexOfSelected) {
            model.marked = YES;
        }else{
            model.marked = NO;
        }
        index++;
        return model;
    }].array;
    constellation.rac_command = self.updateConstellationCommand;
    
    [section1 addElement:constellation];
    
    // Image
    AMSettingsImageElement *avatar = [[AMSettingsImageElement alloc]initWithTitle:@"Avatar"];
    avatar.imagefile = @"http://www.th7.cn/d/file/p/2016/09/12/a21b1807c3ef1cba781cf10a3d20cafc.jpg";
    avatar.rac_command = self.updateAvatarCommand;
    [section1 addElement:avatar];
    
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
    

    
    self.updateConstellationCommand = [[RACCommand alloc]initWithSignalBlock:^RACSignal *(id input) {
        return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [subscriber sendNext:@YES];
                [subscriber sendCompleted];
            });
            return nil;
        }];
    }];
    
    self.updateAvatarCommand = [[RACCommand alloc]initWithSignalBlock:^RACSignal *(id input) {
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
