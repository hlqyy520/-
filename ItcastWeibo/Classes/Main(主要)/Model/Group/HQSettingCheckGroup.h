//
//  HQSettingCheckGroup.h
//  示例-HQWeibo
//
//  Created by MJ Lee on 15-2-4.
//  Copyright (c) 2014年 HaoLiqiang All rights reserved.
//

#import "HQSettingGroup.h"
@class HQSettingCheckItem, HQSettingLabelItem;

@interface HQSettingCheckGroup : HQSettingGroup
/**
 *  选中的索引
 */
@property (assign, nonatomic) int checkedIndex;

/**
 *  选中的item
 */
@property (strong, nonatomic) HQSettingCheckItem *checkedItem;

/**
 *  来源于哪个item
 */
@property (strong, nonatomic) HQSettingLabelItem *sourceItem;
@end
