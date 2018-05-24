//
//  HRGKeychainDeviceID.m
//  HRGameStatistics
//
//  Created by HRG on 17/1/13.
//  Copyright © 2017年 HRG. All rights reserved.
//

#import "HRGKeychainDeviceIDs.h"
#import "HRGKeychainHelpers.h"
#import <AdSupport/AdSupport.h>
#import <UIKit/UIKit.h>

//在Keychain中的标识，这里取bundleIdentifier + UUID / OpenUDID
#define KEYCHAIN_IDENTIFIER(a) ([NSString stringWithFormat:@"%@_%@",[[NSBundle mainBundle] bundleIdentifier],a])

#define isNull(a) (a == nil || a== NULL || (NSNull *)(a) == [NSNull null] || ((NSString *)a).length == 0)

@implementation HRGKeychainDeviceIDs

#pragma mark - 获取UUID作为设备唯一标志符
+ (NSString *)hrgGetUUID{
    //读取keychain缓存
    NSString *deviceID = [HRGKeychainHelpers load:KEYCHAIN_IDENTIFIER(@"UUID")];
    //不存在，生成UUID
    if (isNull(deviceID)) {
        CFUUIDRef uuid_ref = CFUUIDCreate(kCFAllocatorDefault);
        CFStringRef uuid_string_ref = CFUUIDCreateString(kCFAllocatorDefault, uuid_ref);
        
        CFRelease(uuid_ref);
        deviceID = [NSString stringWithString:(__bridge NSString *)uuid_string_ref];
        deviceID = [deviceID lowercaseString];
        if (!isNull(deviceID)) {
            [HRGKeychainHelpers save:KEYCHAIN_IDENTIFIER(@"UUID") data:deviceID];
        }
        CFRelease(uuid_string_ref);
    }
    if (isNull(deviceID)) {
        NSLog(@"get deviceID error!");
    }
    return deviceID;
}

#pragma mark - 添加IDFA作为唯一标识
+ (NSString *)hrgGetIDFA{
    //读取keychain缓存
    NSString *deviceID = [HRGKeychainHelpers load:KEYCHAIN_IDENTIFIER(@"IDFA")];
    if (isNull(deviceID)) {
        //不存在，生成IDFA
        //1.取IDFA,可能会取不到,如用户关闭IDFA
        if ([[ASIdentifierManager sharedManager] isAdvertisingTrackingEnabled]) {
            deviceID = [[[ASIdentifierManager sharedManager] advertisingIdentifier] UUIDString];
        }else{
            //2.如果取不到,就生成UUID,当成IDFA
            deviceID = [[NSUUID UUID] UUIDString];
        }
        
        //IDFV
//        deviceID = [[[UIDevice currentDevice] identifierForVendor] UUIDString];
        if (!isNull(deviceID)) {
            [HRGKeychainHelpers save:KEYCHAIN_IDENTIFIER(@"IDFA") data:deviceID];
        }
    }
    if (isNull(deviceID)) {
        NSLog(@"get deviceID error!");
    }
    return deviceID;
}

#pragma mark - 获取IDFV作为唯一标识
+ (NSString *)hrgGetIDFV{
    //读取keychain缓存
    NSString *deviceID = [HRGKeychainHelpers load:KEYCHAIN_IDENTIFIER(@"IDFV")];
    if (isNull(deviceID)) {
        //不存在，生成IDFV
        deviceID = [[[UIDevice currentDevice] identifierForVendor] UUIDString];
        if (!isNull(deviceID)) {
            [HRGKeychainHelpers save:KEYCHAIN_IDENTIFIER(@"IDFV") data:deviceID];
        }
    }
    if (isNull(deviceID)) {
        NSLog(@"get deviceID error!");
    }
    return deviceID;
}

+ (void)hrgDeleteDeviceID{
    [HRGKeychainHelpers delete:KEYCHAIN_IDENTIFIER(@"UUID")];
    [HRGKeychainHelpers delete:KEYCHAIN_IDENTIFIER(@"IDFV")];
    [HRGKeychainHelpers delete:KEYCHAIN_IDENTIFIER(@"IDFA")];
}

@end
