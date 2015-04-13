//
//  HQSettingViewController.m
//  示例-HQWeibo
//
//  Created by MJ Lee on 15-2-4.
//  Copyright (c) 2014年 HaoLiqiang All rights reserved.
//

#import "HQSettingViewController.h"
#import "HQSettingViewController.h"
#import "HQSettingGroup.h"
#import "HQSettingCell.h"
#import "HQSettingArrowItem.h"
#import "HQSettingCheckItem.h"
#import "HQSettingCheckGroup.h"

@interface HQSettingViewController ()

@end

@implementation HQSettingViewController

- (NSMutableArray *)groups
{
    if (_groups == nil) {
        _groups = [NSMutableArray array];
    }
    return _groups;
}

- (HQSettingGroup *)addGroup
{
    HQSettingGroup *group = [HQSettingGroup group];
    [self.groups addObject:group];
    return group;
}

- (id)initWithStyle:(UITableViewStyle)style
{
    return [super initWithStyle:UITableViewStyleGrouped];
}

- (id)init
{
    return [super initWithStyle:UITableViewStyleGrouped];
}

- (void)viewDidAppear:(BOOL)animated {}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.backgroundView = nil;
    self.view.backgroundColor = HQGlobalBg;
    
    self.tableView.sectionHeaderHeight = 0; // 每一组的头部高度
    self.tableView.sectionFooterHeight = HQSettingCellMargin; // 每一组的尾部高度
    
    // 底部控件
    UIView *footer = [[UIView alloc] init];
    footer.frame = CGRectMake(0, 0, 0, 1);
    self.tableView.tableFooterView = footer;
    
    if (iOS7) {
        self.tableView.contentInset = UIEdgeInsetsMake(HQSettingCellMargin - 33, 0, 0, 0);
    } else {
        self.tableView.contentInset = UIEdgeInsetsMake(HQSettingCellMargin, 0, 0, 0);
    }
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.groups.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    HQSettingGroup *group = self.groups[section];
    return group.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    HQSettingCell *cell = [HQSettingCell cellWithTableView:tableView];
    cell.indexPath = indexPath;
    HQSettingGroup *group = self.groups[indexPath.section];
    cell.item = group.items[indexPath.row];
    return cell;
}

#pragma mark - 代理
- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    HQSettingGroup *group = self.groups[section];
    return group.footer;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    HQSettingGroup *group = self.groups[section];
    return group.header;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    // 1.取出模型
    HQSettingGroup *group = self.groups[indexPath.section];
    HQSettingItem *item = group.items[indexPath.row];
    
    // 2.操作
    if (item.option) {
        item.option();
    }
    
    // 3.跳转
    if ([item isKindOfClass:[HQSettingArrowItem class]]) {
        HQSettingArrowItem *arrowItem = (HQSettingArrowItem *)item;
        if (arrowItem.destVcClass) {
            UIViewController *destVc = [[arrowItem.destVcClass alloc] init];
            destVc.title = arrowItem.title;
            
            if (arrowItem.readyForDestVc) { // 控制器的准备工作
                arrowItem.readyForDestVc(arrowItem, destVc);
            }
            
            [self.navigationController pushViewController:destVc animated:YES];
        }
    }
    
    // 4.check 打钩
    if ([item isKindOfClass:[HQSettingCheckItem class]]) {
        HQSettingCheckGroup *checkGroup = (HQSettingCheckGroup *)group;
        checkGroup.checkedIndex = indexPath.row;
        
        // 刷新
        [tableView reloadData];
    }
}

@end
