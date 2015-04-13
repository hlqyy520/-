//
//  HQSettingValueItem.m
//  示例-HQWeibo
//
//  Created by MJ Lee on 15-2-4.
//  Copyright (c) 2014年 HaoLiqiang All rights reserved.
//

#import "HQSettingValueItem.h"

@implementation HQSettingValueItem
- (NSString *)key
{
    return _key ? _key : self.title;
}
@end