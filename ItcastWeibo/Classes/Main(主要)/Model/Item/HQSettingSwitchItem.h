//
//  HQSettingSwitchItem.h
//  示例-HQWeibo
//
//  Created by MJ Lee on 15-2-4.
//  Copyright (c) 2014年 HaoLiqiang All rights reserved.
//

#import "HQSettingValueItem.h"

@interface HQSettingSwitchItem : HQSettingValueItem
@property (assign, nonatomic, getter = isOn) BOOL on;
@property (assign, nonatomic, getter = isDefaultOn) BOOL defaultOn;
@end