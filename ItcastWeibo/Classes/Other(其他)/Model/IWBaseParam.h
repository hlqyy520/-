//
//  IWBaseParam.h
//  微博
//
//  Created by haoliqiang on 15/4/12.
//  Copyright (c) 2015年 itcast. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface IWBaseParam : NSObject

@property (copy, nonatomic) NSString *access_token;;

+(instancetype)param;
@end
