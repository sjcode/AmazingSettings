//
//  AMSettingsElement+Appearance.m
//  AmazingSettings
//
//  Created by sujian on 16/9/23.
//  Copyright © 2016年 sujian. All rights reserved.
//

#import "AMSettingsElement+Appearance.h"
#import <objc/runtime.h>

static void * const kAppearanceObject = (void*)&kAppearanceObject;

@implementation AMSettingsElement (Appearance)

+ (AMAppearance*)appearance{
    AMAppearance *appearance = objc_getAssociatedObject(self, kAppearanceObject);
    
    if(appearance == nil && [[self class].superclass respondsToSelector:@selector(appearance)]){
        appearance = [[[self class]superclass]appearance];
    }
    
    if (appearance == nil) {
        appearance = [AMAppearance new];
        [self setAppearance:appearance];
    }
    
    return appearance;
}

+ (void)setAppearance:(AMAppearance*)newAppearance{
    objc_setAssociatedObject(self, kAppearanceObject, newAppearance, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (AMAppearance*)appearance{
    AMAppearance *appearance = objc_getAssociatedObject(self, kAppearanceObject);
    if(appearance == nil){
        appearance = [[self class] appearance];
        self.appearance = appearance;
    }
    
    return appearance;
}

- (void)setAppearance:(AMAppearance*)newAppearance{
    objc_setAssociatedObject(self, kAppearanceObject, newAppearance, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
@end
