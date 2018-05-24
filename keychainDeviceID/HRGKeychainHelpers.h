//
//  HRGKeychainHelper.h
//  HRGameStatistics
//
//  Created by HRG on 17/1/23.
//  Copyright © 2017年 HRG. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HRGKeychainHelpers : NSObject

//保存数据到keychain
+ (void)save:(NSString *)service data:(id)data;

//加载数据到keychain
+ (id)load:(NSString *)service;

//删除keychain的数据
+ (void)delete:(NSString *)service;

@end
