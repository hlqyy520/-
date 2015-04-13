//
//  HQSystemSettingViewController.m
//  示例-HQWeibo
//
//  Created by MJ Lee on 15-2-4.
//  Copyright (c) 2014年 HaoLiqiang All rights reserved.
//

#import "HQSystemSettingViewController.h"
#import "HQSettingArrowItem.h"
#import "HQSettingGroup.h"
#import "HQThemeBgViewController.h"
#import "HQGeneralViewController.h"

@interface HQSystemSettingViewController ()

@end

@implementation HQSystemSettingViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"设置";
    
    [self setupGroup0];
    [self setupGroup1];
    [self setupGroup2];
    [self setupGroup3];
    
    [self setupFooter];
}

- (void)setupFooter
{
    // 按钮
    UIButton *logoutButton = [[UIButton alloc] init];
    CGFloat logoutX = HQStatusTableBorder + 2;
    CGFloat logoutY = 0;
    CGFloat logoutW = self.tableView.frame.size.width - 2 * logoutX;
    CGFloat logoutH = 44;
    logoutButton.frame = CGRectMake(logoutX, logoutY, logoutW, logoutH);
    
    // 背景和文字
    [logoutButton setBackgroundImage:[UIImage resizedImageWithName:@"common_button_red"] forState:UIControlStateNormal];
    [logoutButton setBackgroundImage:[UIImage resizedImageWithName:@"common_button_red_highlighted"] forState:UIControlStateHighlighted];
    [logoutButton setTitle:@"退出当前帐号" forState:UIControlStateNormal];
    logoutButton.titleLabel.font = [UIFont systemFontOfSize:14];
    [logoutButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    // footer
    UIView *footer = [[UIView alloc] init];
    CGFloat footerH = logoutH + HQStatusCellBorder;
    footer.frame = CGRectMake(0, 0, 0, footerH);
    self.tableView.tableFooterView = footer;
    [footer addSubview:logoutButton];
}

- (void)setupGroup0
{
    HQSettingGroup *group = [self addGroup];
    
    HQSettingArrowItem *account = [HQSettingArrowItem itemWithTitle:@"帐号管理"];
    group.items = @[account];
}

- (void)setupGroup1
{
    HQSettingGroup *group = [self addGroup];
    
    HQSettingArrowItem *theme = [HQSettingArrowItem itemWithTitle:@"主题、背景" destVcClass:[HQThemeBgViewController class]];
    group.items = @[theme];
}

- (void)setupGroup2
{
    HQSettingGroup *group = [self addGroup];
    
    HQSettingArrowItem *notice = [HQSettingArrowItem itemWithTitle:@"通知和提醒"];
    HQSettingArrowItem *general = [HQSettingArrowItem itemWithTitle:@"通用设置" destVcClass:[HQGeneralViewController class]];
    HQSettingArrowItem *safe = [HQSettingArrowItem itemWithTitle:@"隐私与安全"];
    group.items = @[notice, general, safe];
}

- (void)setupGroup3
{
    HQSettingGroup *group = [self addGroup];
    
    HQSettingArrowItem *opinion = [HQSettingArrowItem itemWithTitle:@"意见反馈"];
    HQSettingArrowItem *about = [HQSettingArrowItem itemWithTitle:@"关于微博"];
    group.items = @[opinion, about];
}

@end