//
//  AMSettingsElement+Appearance.h
//  AmazingSettings
//
//  Created by sujian on 16/9/23.
//  Copyright © 2016年 sujian. All rights reserved.
//

#import "AMSettingsElement.h"
#import "AMAppearance.h"

@interface AMSettingsElement (Appearance)

@property (nonatomic, strong) AMAppearance *appearance;
+ (AMAppearance *)appearance;
+ (void)setAppearance:(AMAppearance *)newAppearance;
@end
