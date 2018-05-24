//
//  HRGUtilits.m
//  HRGStaticLib
//
//  Created by HRG on 2017/5/16.
//  Copyright © 2017年 HRG. All rights reserved.
//

#import "HRGUtilit.h"
#import <CommonCrypto/CommonDigest.h>
#import <sys/utsname.h>
#import <UIKit/UIKit.h>

@implementation HRGUtilit

//md5加密
+ (NSString *)md5Encrypt:(NSString*)plaintext{
    if (plaintext == nil) {
        return nil;
    }
    const char *cStr = [plaintext UTF8String];
    unsigned char result[32];
    CC_MD5(cStr, (CC_LONG)strlen(cStr), result);
    NSString *md5Eiphertext = [NSString stringWithFormat:@"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",result[0],result[1],result[2],result[3],result[4],result[5],result[6],result[7],result[8],result[9],result[10],result[11],result[12],result[13],result[14],result[15]];
    return md5Eiphertext;
}

//获取UserDefaults
+ (id)getUserDefaultsForKey:(NSString *)key{
    id userDefaults = [[NSUserDefaults standardUserDefaults] objectForKey:key];
    return userDefaults;
}

//设置UserDefaults
+ (void)setUserDefaults:(id)object forKey:(NSString *)key{
    [[NSUserDefaults standardUserDefaults] setObject:object forKey:key];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

// 邮箱账号的有效性判断
+ (BOOL)isEmailNumber:(NSString *)emailNum{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:emailNum];
}

//匹配密码格式
+ (BOOL)isValidatePassword:(NSString *)password{
    NSString *passwordRegex = @"[a-zA-Z0-9]{6,20}";
    NSPredicate *passwordTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", passwordRegex];
    return [passwordTest evaluateWithObject:password];
}

//验证手机号
+ (BOOL)isValidatePhone:(NSString *)phone{
    NSString *phoneRegex = @"1[3|5|7|8|][0-9]{9}";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", phoneRegex];
    return [phoneTest evaluateWithObject:phone];
}

//获取系统版本号
+ (NSString *)getiPhoneSystemVersion{
    NSString *systemVer = [[UIDevice currentDevice] systemVersion];
    return systemVer;
}

//获取设备型号
+ (NSString *)getiPhoneDeviceVersion{
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString *platform = [NSString stringWithCString:systemInfo.machine encoding:NSASCIIStringEncoding];
    return platform;
}

//获取App版本信息
+ (NSString *)appBundleId{
    NSDictionary *plistDic = [[NSBundle mainBundle] infoDictionary];
    NSString *version = [plistDic objectForKey:@"CFBundleIdentifier"];
    return version;
}

+ (NSString *)appVersion{
    NSDictionary *plistDic = [[NSBundle mainBundle] infoDictionary];
    NSString *version = [plistDic objectForKey:@"CFBundleShortVersionString"];
    return version;
}

+ (NSString *)appBuildVersion{
    NSDictionary *plistDic = [[NSBundle mainBundle] infoDictionary];
    NSString *plistBuild = [plistDic objectForKey:@"CFBundleVersion"];
    return plistBuild;
}

//调用系统邮件发邮件
+ (void)gotoEmail:(NSString *)emailAccount{
    NSString *recipients = [NSString stringWithFormat:@"mailto:%@", emailAccount];
    
    NSString *email = [recipients stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:email]];
}

@end
