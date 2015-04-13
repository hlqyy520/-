//
//  HQHttpTool.h
//  微博
//
//  Created by haoliqiang on 15/4/11.
//  Copyright (c) 2015年 itcast. All rights reserved.
//疯转项目GET\POST请求

#import <Foundation/Foundation.h>

@interface HQHttpTool : NSObject

/**
 * 发送一个Post请求
 */
+(void)postWithURL:(NSString *)url params:(NSDictionary *)params success:(void(^)(id json))sccess failure:(void(^)(NSError *error))failure;

/**
 * 发送一个post请求（上传文件数据）
 */
+(void)postwithUrl:(NSString *)url params:(NSDictionary *)params formDataArray: (NSArray *)formDataArray success:(void(^)(id json))success failure:(void (^)(NSError * error))failure;

/**
 * 发送一个GET请求
 */
+(void)getWithURL:(NSString *)url params:(NSDictionary *)params success:(void(^)(id json)) success failure:(void(^)(NSError *error))failure;
@end


@interface HQFormData : NSObject

/**
 * 文件数据
 */
@property (nonatomic,strong) NSData *data;

/**
 * 参数名
 */
@property (copy, nonatomic) NSString *name;

/**
 * 文件名
 */
@property (copy, nonatomic) NSString *filename;

/**
 * 文件类型
 */
@property (copy, nonatomic) NSString *mimeType;
@end
