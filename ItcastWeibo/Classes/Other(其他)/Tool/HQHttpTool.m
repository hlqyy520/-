//
//  HQHttpTool.m
//  微博
//
//  Created by haoliqiang on 15/4/11.
//  Copyright (c) 2015年 itcast. All rights reserved.
//  

#import "HQHttpTool.h"
#import "AFNetworking.h"

@implementation HQHttpTool
+(void)postWithURL:(NSString *)url params:(NSDictionary *)params success:(void(^)(id json))sccess failure:(void(^)(NSError *error))failure
{
    //创建请求管理对象
    AFHTTPRequestOperationManager *mgr =[AFHTTPRequestOperationManager manager];
    
    //发送请求
    [mgr POST:url parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (sccess) {
            sccess(responseObject);
        }    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            if (failure) {
                failure(error);
            }
        }];
}

+(void)postwithUrl:(NSString *)url params:(NSDictionary *)params formDataArray: (NSArray *)formDataArray success:(void(^)(id json))success failure:(void (^)(NSError * error))failure
{
    AFHTTPRequestOperationManager *mgr= [AFHTTPRequestOperationManager manager];
   [ mgr POST:url parameters:params constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
       for (HQFormData *forData in formDataArray) {
           [formData appendPartWithFileData:forData.data name:forData.name fileName:forData.filename mimeType:forData.mimeType];
       }
   } success:^(AFHTTPRequestOperation *operation, id responseObject) {
       if (success) {
           success(responseObject);
       }
   } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
       if (failure) {
           failure(error);
       }
   }];
    
}

+(void)getWithURL:(NSString *)url params:(NSDictionary *)params success:(void(^)(id json)) success failure:(void(^)(NSError *error))failure
{
    AFHTTPRequestOperationManager *mgr = [AFHTTPRequestOperationManager manager];
    
    [mgr GET:url parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (success) {
            success(responseObject);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}
@end

/**
 *  用来封装文件数据的模型
 */
@implementation HQFormData

@end
