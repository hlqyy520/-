//
//  HQStatusCell.m
//  HQWeibo
//
//  Created by apple on 15-2-9.
//  Copyright (c) 2014年 HaoLiqiang All rights reserved.
//

#import "HQStatusCell.h"
#import "HQStatus.h"
#import "HQStatusFrame.h"
#import "HQUser.h"
#import "UIImageView+WebCache.h"
#import "HQStatusToolbar.h"
#import "HQStatusTopView.h"

@interface HQStatusCell()
/** 顶部的view */
@property (nonatomic, weak) HQStatusTopView *topView;

/** 微博的工具条 */
@property (nonatomic, weak) HQStatusToolbar *statusToolbar;
@end

@implementation HQStatusCell

#pragma mark - 初始化
+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"status";
    HQStatusCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[HQStatusCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    return cell;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // 1.添加顶部的view
        [self setupTopView];
        
        // 2.添加微博的工具条
        [self setupStatusToolbar];
    }
    return self;
}

/**
 *  添加顶部的view
 */
- (void)setupTopView
{
    // 0.设置cell选中时的背景
    self.selectedBackgroundView = [[UIView alloc] init];
    self.backgroundColor = [UIColor clearColor];
    
    /** 1.顶部的view */
    HQStatusTopView *topView = [[HQStatusTopView alloc] init];
    [self.contentView addSubview:topView];
    self.topView = topView;
}

/**
 *  添加微博的工具条
 */
- (void)setupStatusToolbar
{
    /** 微博的工具条 */
    HQStatusToolbar *statusToolbar = [[HQStatusToolbar alloc] init];
    [self.contentView addSubview:statusToolbar];
    self.statusToolbar = statusToolbar;
}

/**
 *  拦截frame的设置
 */
- (void)setFrame:(CGRect)frame
{
    frame.origin.y += HQStatusTableBorder;
    frame.origin.x = HQStatusTableBorder;
    frame.size.width -= 2 * HQStatusTableBorder;
    frame.size.height -= HQStatusTableBorder;
    [super setFrame:frame];
}

#pragma mark - 数据的设置
/**
 *  传递模型数据
 */
- (void)setStatusFrame:(HQStatusFrame *)statusFrame
{
    _statusFrame = statusFrame;
    
    // 1.设置顶部view的数据
    [self setupTopViewData];
    
    // 2.设置微博工具条的数据
    [self setupStatusToolbarData];
}

/**
 *  设置顶部view的数据
 */
- (void)setupTopViewData
{
    // 1.topView
    self.topView.frame = self.statusFrame.topViewF;
    
    // 2.传递模型数据
    self.topView.statusFrame = self.statusFrame;
}

/**
 *  设置微博工具条的数据
 */
- (void)setupStatusToolbarData
{
    self.statusToolbar.frame = self.statusFrame.statusToolbarF;
    self.statusToolbar.status = self.statusFrame.status;
}
@end