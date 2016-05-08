//
//  NYKeychainQuery.h
//  test
//
//  Created by NapoleonYoung on 16/5/8.
//  Copyright © 2016年 DoubleWood. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NYKeychainQuery : NSObject

/**
 *  kSecAttrService
 */
@property (nonatomic, copy) NSString *service;

/**
 *  kSecAttrAccount
 */
@property (nonatomic, copy) NSString *account;

/**
 *  passwordData的string形式，与passwordData转换使用UTF－8 string encoding
 */
@property (nonatomic, copy) NSString *password;

/**
 *  要存储的密码
 */
@property (nonatomic, copy) NSData *passwordData;

/**
 *  保存密码
 *
 *  @return 保存状态：成功 YES；失败：NO
 */
- (BOOL)save;

/**
 *  删除keychain items
 *
 *  @return 删除状态：成功 YES；失败：NO
 */
- (BOOL)deleteItem;

/**
 *  获取存储的密码
 *
 *  @return 获取状态：成功 YES；失败：NO
 */
- (BOOL)fetch;

@end
