//
//  HQSettingLabelItem.m
//  示例-HQWeibo
//
//  Created by MJ Lee on 15-2-4.
//  Copyright (c) 2014年 HaoLiqiang All rights reserved.
//

#import "HQSettingLabelItem.h"

@implementation HQSettingLabelItem
- (NSString *)text
{
    id value = [HQUserDefaults objectForKey:self.key];
    if (value == nil) {
        return self.defaultText;
    } else {
        return value;
    }
}

- (void)setText:(NSString *)text
{
    [HQUserDefaults setObject:text forKey:self.key];
    [HQUserDefaults synchronize];
}
@end
