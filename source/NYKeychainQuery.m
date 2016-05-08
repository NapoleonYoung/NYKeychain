//
//  NYKeychainQuery.m
//  test
//
//  Created by NapoleonYoung on 16/5/8.
//  Copyright © 2016年 DoubleWood. All rights reserved.
//

#import "NYKeychainQuery.h"

@implementation NYKeychainQuery

/**
 *  保存密码
 *
 *  @return 保存状态：成功 YES；失败：NO
 */
- (BOOL)save
{
    NSMutableDictionary *query = nil;
    NSMutableDictionary *searchQuery = [self query];
    OSStatus status = SecItemCopyMatching((__bridge CFDictionaryRef)searchQuery, nil);
    if (status == errSecSuccess) {//item 已经存在，更新它
        query = [[NSMutableDictionary alloc] init];
        [query setObject:self.passwordData forKey:(__bridge id)kSecValueData];
        status = SecItemUpdate((__bridge CFDictionaryRef)searchQuery, (__bridge CFDictionaryRef)query);
    } else if (status == errSecItemNotFound) {//item未找到，创建它
        query = [self query];
        [query setObject:self.passwordData forKey:(__bridge id)kSecValueData];
        status = SecItemAdd((__bridge CFDictionaryRef)query, NULL);
    }
    
    return (status == errSecSuccess);
}

/**
 *  删除keychain items
 *
 *  @return 删除状态：成功 YES；失败：NO
 */
- (BOOL)deleteItem
{
    NSMutableDictionary *query = [self query];
    OSStatus status = SecItemDelete((__bridge CFDictionaryRef)query);
    return (status == errSecSuccess);
}

/**
 *  获取存储的密码
 *
 *  @return 获取状态：成功 YES；失败：NO
 */
- (BOOL)fetch
{
    CFTypeRef result = NULL;
    NSMutableDictionary *query = [self query];
    [query setObject:@YES forKey:(__bridge id)kSecReturnData];
    [query setObject:(__bridge id)kSecMatchLimitOne forKey:(__bridge id)kSecMatchLimit];
    OSStatus status = SecItemCopyMatching((__bridge CFDictionaryRef)query, &result);
    
    if (status != errSecSuccess) {
        return NO;
    }
    
    self.passwordData = (__bridge_transfer NSData *)result;
    return YES;
}

#pragma mark - 存取器方法

- (void)setPassword:(NSString *)password
{
    self.passwordData = [password dataUsingEncoding:NSUTF8StringEncoding];
}

- (NSString *)password
{
    if ([self.passwordData length]) {
        return [[NSString alloc] initWithData:self.passwordData encoding:NSUTF8StringEncoding];
    }
    return nil;
}

/**
 *  keychain 需要的dictionary
 *
 *  @return keychain dictionary
 */
- (NSMutableDictionary *)query
{
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionaryWithCapacity:3];
    [dictionary setObject:(__bridge id)kSecClassGenericPassword forKey:(__bridge id)kSecClass];
    
    if (self.service) {
        [dictionary setObject:self.service forKey:(__bridge id)kSecAttrService];
    }
    
    if (self.account) {
        [dictionary setObject:self.account forKey:(__bridge id)kSecAttrAccount];
    }
    
    return dictionary;
}

@end
