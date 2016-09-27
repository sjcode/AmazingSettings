//
//  RACCommand+MBProgressHUD.h
//  QuanDi
//
//  Created by sujian on 16/9/17.
//  Copyright © 2016年 sujian. All rights reserved.
//

#import <ReactiveCocoa/ReactiveCocoa.h>

@interface RACCommand (MBProgressHUD)
- (void)addProgressHUDWithParentView:(UIView*)view
                          processing:(NSString*)processing
                           successed:(NSString*)successed
                              failed:(NSString*)failed
                    successcompleted:(void (^)())successcompleted
                       failcompleted:(void (^)())failcompleted;
@end
