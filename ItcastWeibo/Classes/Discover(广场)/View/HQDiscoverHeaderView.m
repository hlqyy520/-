//
//  HQDiscoverHeaderView.m
//  微博
//
//  Created by MJ Lee on 15-2-6.
//  Copyright (c) 2014年 HaoLiqiang All rights reserved.
//

#import "HQDiscoverHeaderView.h"
#import "HQDiscoverGridView.h"

@interface HQDiscoverHeaderView()
@property (weak, nonatomic) UIImageView *topImageView;
@property (weak, nonatomic) HQDiscoverGridView *gridView;
@end

@implementation HQDiscoverHeaderView
+ (instancetype)headerView
{
    return [[self alloc] init];
}

- (id)initWithFrame:(CGRect)frame
{
    frame.size.height = 180;
    self = [super initWithFrame:frame];
    if (self) {
        // 1.头部图片
        UIImageView *topImageView = [[UIImageView alloc] init];
        topImageView.image = [UIImage imageWithName:@"square_ad"];
        [self addSubview:topImageView];
        self.topImageView = topImageView;
        
        // 2.中间格子内容
        HQDiscoverGridView *gridView = [HQDiscoverGridView gridView];
        gridView.gridData = @[@"世界杯", @"英语退出高考", @"深圳暴雨", @"晚安"];
        [self addSubview:gridView];
        self.gridView = gridView;
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    // 1.头部图片
    CGFloat topX = HQSettingTableBorder + 2;
    CGFloat topY = HQSettingCellMargin;
    CGFloat topW = self.frame.size.width - 2 * topX;
    CGFloat topH = self.topImageView.image.size.height;
    self.topImageView.frame = CGRectMake(topX, topY, topW, topH);
    
    // 2.格子
    CGFloat gridX = HQSettingTableBorder;
    CGFloat gridY = CGRectGetMaxY(self.topImageView.frame) + HQSettingCellMargin;
    CGFloat gridW = self.frame.size.width - 2 * gridX;
    CGFloat gridH = self.frame.size.height - gridY - HQSettingCellMargin;
    self.gridView.frame = CGRectMake(gridX, gridY, gridW, gridH);
}

@end
