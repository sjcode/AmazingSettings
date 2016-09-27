//
//  UIColor+Util.m
//  QuanDi
//
//  Created by sujian on 16/6/19.
//  Copyright © 2016年 sujian. All rights reserved.
//

#import "UIColor+Util.h"

@implementation UIColor (Util)

- (UIImage*)colorToImage{
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [self CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}
@end
