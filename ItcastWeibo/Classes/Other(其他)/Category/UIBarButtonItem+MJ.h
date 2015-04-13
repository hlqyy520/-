//
//  UIBarButtonItem+MJ.h
//  HQWeibo
//
//  Created by apple on 15-2-6.
//  Copyright (c) 2014年 HaoLiqiang All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (MJ)
/**
 *  快速创建一个显示图片的item
 *
 *  @param action   监听方法
 */
+ (UIBarButtonItem *)itemWithIcon:(NSString *)icon highIcon:(NSString *)highIcon target:(id)target action:(SEL)action;
@end
