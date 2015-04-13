//
//  HQSettingCheckGroup.m
//  示例-HQWeibo
//
//  Created by MJ Lee on 15-2-4.
//  Copyright (c) 2014年 HaoLiqiang All rights reserved.
//

#import "HQSettingCheckGroup.h"
#import "HQSettingCheckItem.h"
#import "HQSettingLabelItem.h"

@implementation HQSettingCheckGroup

- (HQSettingCheckItem *)checkedItem
{
    for (HQSettingCheckItem *item in self.items) {
        if (item.isChecked) return item;
    }
    return nil;
}

- (void)setCheckedItem:(HQSettingCheckItem *)checkedItem
{
    for (HQSettingCheckItem *item in self.items) {
        item.checked = (item == checkedItem);
    }
    self.sourceItem.text = checkedItem.title;
}

- (int)checkedIndex
{
    HQSettingCheckItem *item = self.checkedItem;
    return item ? [self.items indexOfObject:item] : -1;
}

- (void)setCheckedIndex:(int)checkedIndex
{
    if (checkedIndex <0 || checkedIndex >= self.items.count) return;
    
    self.checkedItem = self.items[checkedIndex];
}

- (void)setItems:(NSArray *)items
{
    [super setItems:items];
    
    self.checkedIndex = self.checkedIndex;
    self.checkedItem = self.checkedItem;
    self.sourceItem = self.sourceItem;
}

- (void)setSourceItem:(HQSettingLabelItem *)sourceItem
{
    _sourceItem = sourceItem;
    
    for (HQSettingCheckItem *item in self.items) {
        item.checked = [item.title isEqualToString:sourceItem.text];
    }
}
@end