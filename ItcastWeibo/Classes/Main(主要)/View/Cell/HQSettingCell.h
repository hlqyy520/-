//
//  HQSettingCell.h
//  示例-HQWeibo
//
//  Created by MJ Lee on 15-1-4.
//  Copyright (c) 2014年 HaoLiqiang All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HQBgCell.h"

@class HQSettingItem;

@interface HQSettingCell : HQBgCell
@property (strong, nonatomic) HQSettingItem *item;
@property (strong, nonatomic) NSIndexPath *indexPath;

+ (instancetype)cellWithTableView:(UITableView *)tableView;

@end
