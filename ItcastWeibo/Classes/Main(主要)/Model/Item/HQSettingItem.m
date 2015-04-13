//
//  HQSettingItem.m
//  示例-HQWeibo
//
//  Created by MJ Lee on 15-1-4.
//  Copyright (c) 2014年 HaoLiqiang All rights reserved.
//

#import "HQSettingItem.h"

@implementation HQSettingItem
+ (instancetype)itemWithIcon:(NSString *)icon title:(NSString *)title
{
    HQSettingItem *item = [self item];
    item.icon = icon;
    item.title = title;
    return item;
}

+ (instancetype)itemWithTitle:(NSString *)title
{
    return [self itemWithIcon:nil title:title];
}

+ (instancetype)item
{
    return [[self alloc] init];
}
@end
