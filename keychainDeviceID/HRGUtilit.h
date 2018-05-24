//
//  HRGUtilits.h
//  HRGStaticLib
//
//  Created by HRG on 2017/5/16.
//  Copyright © 2017年 HRG. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HRGUtilit : NSObject

//md5加密
+ (NSString *)md5Encrypt:(NSString*)plaintext;

//获取UserDefaults
+ (id)getUserDefaultsForKey:(NSString *)key;

//设置UserDefaults
+ (void)setUserDefaults:(id)object forKey:(NSString *)key;

// 邮箱账号的有效性判断
+ (BOOL)isEmailNumber:(NSString *)emailNum;

//匹配密码格式
+ (BOOL)isValidatePassword:(NSString *)password;

//验证手机号
+ (BOOL)isValidatePhone:(NSString *)phone;

//获取系统版本号
+ (NSString *)getiPhoneSystemVersion;

//获取设备型号
+ (NSString *)getiPhoneDeviceVersion;

//获取App版本信息
+ (NSString *)appBundleId;
+ (NSString *)appVersion;
+ (NSString *)appBuildVersion;

//调用系统邮件发邮件
+ (void)gotoEmail:(NSString *)emailAccount;

@end
