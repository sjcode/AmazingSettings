//
//  RACCommand+MBProgressHUD.m
//  QuanDi
//
//  Created by sujian on 16/9/17.
//  Copyright © 2016年 sujian. All rights reserved.
//

#import "RACCommand+MBProgressHUD.h"
#import "MBProgressHUD.h"

@implementation RACCommand (MBProgressHUD)

- (void)addProgressHUDWithParentView:(UIView*)view
                          processing:(NSString*)processing
                           successed:(NSString*)successed
                              failed:(NSString*)failed
                    successcompleted:(void (^)())successcompleted
                       failcompleted:(void (^)())failcompleted{
    __block MBProgressHUD *progressHUD;
    [self.executing subscribeNext:^(NSNumber *executing) {
        if (executing.boolValue) {
            progressHUD = [MBProgressHUD showHUDAddedTo:view animated:YES];
            progressHUD.labelText = processing;
        }
    }];
    
    [self.executionSignals.flatten.deliverOnMainThread subscribeNext:^(id x) {
        progressHUD.customView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"icon_progress_successed"]];
        progressHUD.mode = MBProgressHUDModeCustomView;
        progressHUD.labelText = successed;
        progressHUD.completionBlock = successcompleted;
        [progressHUD hide:YES afterDelay:1];
    }];
    
    [self.errors subscribeNext:^(id x) {
        progressHUD.customView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"icon_progress_failed"]];
        progressHUD.mode = MBProgressHUDModeCustomView;
        progressHUD.labelText = successed;
        progressHUD.completionBlock = failcompleted;
        [progressHUD hide:YES afterDelay:1];
    }];
}
@end
