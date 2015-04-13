//
//  HQStatus.h
//  HQWeibo
//
//  Created by apple on 15-2-8.
//  Copyright (c) 2014年 HaoLiqiang All rights reserved.
//  微博模型(一个HQStatus对象就代表一条微博)

#import <Foundation/Foundation.h>
@class HQUser;

@interface HQStatus : NSObject
/**
 *  微博的内容(文字)
 */
@property (nonatomic, copy) NSString *text;
/**
 *  微博的来源
 */
@property (nonatomic, copy) NSString *source;
/**
 *  微博的时间
 */
@property (nonatomic, copy) NSString *created_at;
/**
 *  微博的ID
 */
@property (nonatomic, copy) NSString *idstr;
/**
 *  微博的配图(数组中装模型:HQPhoto)
 */
@property (nonatomic, strong) NSArray *pic_urls;
//@property (nonatomic, copy) NSString *thumbnail_pic;

/**
 *  微博的转发数
 */
@property (nonatomic, assign) int reposts_count;
/**
 *  微博的评论数
 */
@property (nonatomic, assign) int comments_count;
/**
 *  微博的表态数(被赞数)
 */
@property (nonatomic, assign) int attitudes_count;

/**
 *  微博的作者
 */
@property (nonatomic, strong) HQUser *user;
/**
 *  被转发的微博
 */
@property (nonatomic, strong) HQStatus *retweeted_status;

@end