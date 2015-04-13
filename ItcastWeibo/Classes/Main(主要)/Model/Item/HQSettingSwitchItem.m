//
//  HQSettingSwitchItem.m
//  示例-HQWeibo
//
//  Created by MJ Lee on 15-2-4.
//  Copyright (c) 2014年 HaoLiqiang All rights reserved.
//

#import "HQSettingSwitchItem.h"

@implementation HQSettingSwitchItem

- (id)init
{
    if (self = [super init]) {
        self.defaultOn = YES;
    }
    return self;
}

- (BOOL)isOn
{
    id value = [HQUserDefaults objectForKey:self.key];
    if (value == nil) {
        return self.isDefaultOn;
    } else {
        return [value boolValue];
    }
}

- (void)setOn:(BOOL)on
{
    [HQUserDefaults setBool:on forKey:self.key];
    [HQUserDefaults synchronize];
}
@end
