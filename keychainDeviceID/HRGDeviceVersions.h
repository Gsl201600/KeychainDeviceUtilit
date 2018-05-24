//
//  HRGDeviceVersion.h
//  TestDemo009
//
//  Created by HRG on 2017/10/17.
//  Copyright © 2017年 HRG. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HRGDeviceVersions : NSObject

//获取系统版本号
+ (NSString *)getiPhoneSystemVersion;

//获取设备型号
+ (NSString *)getiPhoneDeviceVersion;

//获取mac 地址
+ (NSString *)getMacAddress;

//获取IP地址
+ (NSString *)getIPAddresses;

/**
 *  是否越狱
 *
 *  @return YES表示已经越狱，NO表示没有越狱
 */
+ (BOOL)isJailBreak;

/**
 得到当前手机所属运营商名称，如果没有则为nil
 
 @return 返回运营商名称
 */
+ (NSString *)getCurrentPhoneOperatorName;


/**
 得到当前手机号的国家代码,如果没有则为nil
 
 @return 返回国家代码
 */
+ (NSString *)getCurrentISOCountryCode;

/**
 得到移动国家码
 
 @return 返回移动国家码
 */
+ (NSString *)getMobileCountryCode;

@end
