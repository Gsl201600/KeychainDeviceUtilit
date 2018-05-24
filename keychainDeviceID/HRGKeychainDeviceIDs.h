//
//  HRGKeychainDeviceID.h
//  HRGameStatistics
//
//  Created by HRG on 17/1/13.
//  Copyright © 2017年 HRG. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HRGKeychainDeviceIDs : NSObject

/**
 *  获取UUID作为设备唯一标志符
 *
 */
+ (NSString *)hrgGetUUID;

/**
 *  添加IDFA作为唯一标识
 *
 */
+ (NSString *)hrgGetIDFA;

//获取IDFV作为唯一标识
+ (NSString *)hrgGetIDFV;

/**
 *  从keychain删除DeviceID
 */
+ (void)hrgDeleteDeviceID;

@end
