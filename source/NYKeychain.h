//
//  NYKeychain.h
//  test
//
//  Created by NapoleonYoung on 16/5/8.
//  Copyright © 2016年 DoubleWood. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NYKeychain : NSObject

/**
 *  读取保存的密码
 *
 *  @param serviceName serviceName
 *  @param account     account
 *
 *  @return 以string形式的密码
 */
+ (NSString *)passwordForService:(NSString *)serviceName account:(NSString *)account;

/**
 *  删除保存的密码
 *
 *  @param serviceName service name
 *  @param account     account
 *
 *  @return 删除状态：成功：YES；失败：NO
 */
+ (BOOL)deletePasswordForService:(NSString *)serviceName account:(NSString *)account;

/**
 *  保存密码
 *
 *  @param password    password
 *  @param serviceName service name
 *  @param account     account
 *
 *  @return 保存状态：成功：YES；失败：NO
 */
+ (BOOL)setPassword:(NSString *)password forService:(NSString *)serviceName account:(NSString *)account;


@end
