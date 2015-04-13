//
//  IWBaseParam.m
//  微博
//
//  Created by haoliqiang on 15/4/12.
//  Copyright (c) 2015年 itcast. All rights reserved.
//

#import "IWBaseParam.h"
#import "HQAccount.h"
#import "HQAccountTool.h"
@implementation IWBaseParam

-(id)init
{
    if (self==[super init]) {
        self.access_token =[HQAccountTool account].
        access_token;
    }
    return self;
}

+(instancetype)param
{
    return [[self alloc] init];
}
@end
