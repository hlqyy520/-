//
//  HQSettingArrowItem.h
//  示例-HQWeibo
//
//  Created by MJ Lee on 15-1-4.
//  Copyright (c) 2014年 HaoLiqiang All rights reserved.
//

#import "HQSettingItem.h"

@class HQSettingArrowItem;

typedef void (^HQSettingArrowItemReadyForDestVc)(id item, id destVc);

@interface HQSettingArrowItem : HQSettingItem
@property (assign, nonatomic) Class destVcClass;
@property (copy, nonatomic) HQSettingArrowItemReadyForDestVc readyForDestVc;

+ (instancetype)itemWithIcon:(NSString *)icon title:(NSString *)title destVcClass:(Class)destVcClass;
+ (instancetype)itemWithTitle:(NSString *)title destVcClass:(Class)destVcClass;
@end
