//
//  HRGKeychainHelper.m
//  HRGameStatistics
//
//  Created by HRG on 17/1/23.
//  Copyright © 2017年 HRG. All rights reserved.
//

#import "HRGKeychainHelpers.h"
#import <Security/Security.h>

@implementation HRGKeychainHelpers

#pragma mark - Private Method Keychain相关
+ (NSMutableDictionary *)getKeychainQuery:(NSString *)service{
    return [NSMutableDictionary dictionaryWithObjectsAndKeys:
            (id)kSecClassGenericPassword, (id)kSecClass,
            service, (id)kSecAttrService,
            service, (id)kSecAttrAccount,
            (id)kSecAttrAccessibleAfterFirstUnlock, (id)kSecAttrAccessible,
            nil];//第一次解锁后可访问，备份
}

#pragma mark - 写入
+ (void)save:(NSString *)service data:(id)data{
    //Get search dictionary
    NSMutableDictionary *keychainQuery = [self getKeychainQuery:service];
    //Delete old item before add new item
    SecItemDelete((CFDictionaryRef)keychainQuery);
    //Add new object to search dictionary(Attention:the data format)
    [keychainQuery setObject:[NSKeyedArchiver archivedDataWithRootObject:data] forKey:(id)kSecValueData];
    //Add item to keychain with the search dictionary
    SecItemAdd((CFDictionaryRef)keychainQuery, NULL);
}

#pragma mark - 读取
+ (id)load:(NSString *)service{
    id result = nil;
    NSMutableDictionary *keychainQuery = [self getKeychainQuery:service];
    //Configure the search setting
    //Since in our simple case we are expecting only a single attribute to be returned (the password) we can set the attribute kSecReturnData to kCFBooleanTrue
    [keychainQuery setObject:(id)kCFBooleanTrue forKey:(id)kSecReturnData];
    [keychainQuery setObject:(id)kSecMatchLimitOne forKey:(id)kSecMatchLimit];
    CFDataRef keyData = NULL;
    if (SecItemCopyMatching((CFDictionaryRef)keychainQuery, (CFTypeRef *)&keyData) == noErr) {
        @try {
            result = [NSKeyedUnarchiver unarchiveObjectWithData:(__bridge NSData *)keyData];
        } @catch (NSException *exception) {
            NSLog(@"Unarchive of %@ failed: %@", service, exception);
        } @finally {
            
        }
    }
    if (keyData) {
        CFRelease(keyData);
    }
    return result;
}

#pragma mark - 删除
+ (void)delete:(NSString *)service{
    NSMutableDictionary *keychainQuery = [self getKeychainQuery:service];
    SecItemDelete((CFDictionaryRef)keychainQuery);
}

@end
