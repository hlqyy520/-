//
//  HQAccountTool.h
//  HQWeibo
//
//  Created by apple on 15-2-8.
//  Copyright (c) 2014年 HaoLiqiang All rights reserved.
//  账号管理工具类

#import <Foundation/Foundation.h>

@class HQAccount;

@interface HQAccountTool : NSObject
/**
 *  存储账号信息
 *
 *  @param account 需要存储的账号
 */
+ (void)saveAccount:(HQAccount *)account;

/**
 *  返回存储的账号信息
 */
+ (HQAccount *)account;
@end
