//
//  HRGDeviceVersion.m
//  TestDemo009
//
//  Created by HRG on 2017/10/17.
//  Copyright © 2017年 HRG. All rights reserved.
//

#import "HRGDeviceVersions.h"
#import <sys/utsname.h>
#import <UIkit/UIApplication.h>
#include <stdlib.h>
#import <CoreTelephony/CTTelephonyNetworkInfo.h>
#import <CoreTelephony/CTCarrier.h>
// 下面是获取mac地址需要导入的头文件
#include <sys/socket.h> // Per msqr
#include <sys/sysctl.h>
#include <net/if.h>
#include <net/if_dl.h>
#import <sys/sockio.h>
#import <sys/ioctl.h>
#import <arpa/inet.h>
// 下面是获取ip需要的头文件
#include <ifaddrs.h>

@implementation HRGDeviceVersions

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
    
    if ([platform isEqualToString:@"iPhone1,1"]) return @"iPhone 2G";
    if ([platform isEqualToString:@"iPhone1,2"]) return @"iPhone 3G";
    if ([platform isEqualToString:@"iPhone2,1"]) return @"iPhone 3GS";
    if ([platform isEqualToString:@"iPhone3,1"]) return @"iPhone 4";
    if ([platform isEqualToString:@"iPhone3,2"]) return @"iPhone 4";
    if ([platform isEqualToString:@"iPhone3,3"]) return @"iPhone 4";
    if ([platform isEqualToString:@"iPhone4,1"]) return @"iPhone 4S";
    if ([platform isEqualToString:@"iPhone5,1"]) return @"iPhone 5";
    if ([platform isEqualToString:@"iPhone5,2"]) return @"iPhone 5(GSM+CDMA)";
    if ([platform isEqualToString:@"iPhone5,3"]) return @"iPhone 5c(GSM)";
    if ([platform isEqualToString:@"iPhone5,4"]) return @"iPhone 5c(GSM+CDMA)";
    if ([platform isEqualToString:@"iPhone6,1"]) return @"iPhone 5s(GSM)";
    if ([platform isEqualToString:@"iPhone6,2"]) return @"iPhone 5s(GSM+CDMA)";
    if ([platform isEqualToString:@"iPhone7,1"]) return @"iPhone 6 Plus";
    if ([platform isEqualToString:@"iPhone7,2"]) return @"iPhone 6";
    if ([platform isEqualToString:@"iPhone8,1"]) return @"iPhone 6s";
    if ([platform isEqualToString:@"iPhone8,2"]) return @"iPhone 6s Plus";
    if ([platform isEqualToString:@"iPhone8,4"]) return @"iPhone SE";
    if ([platform isEqualToString:@"iPhone9,1"]) return @"国行、日版、港行iPhone 7";
    if ([platform isEqualToString:@"iPhone9,2"]) return @"港行、国行iPhone 7 Plus";
    if ([platform isEqualToString:@"iPhone9,3"]) return @"美版、台版iPhone 7";
    if ([platform isEqualToString:@"iPhone9,4"]) return @"美版、台版iPhone 7 Plus";
    if ([platform isEqualToString:@"iPhone10,1"])return @"国行(A1863)、日行(A1906)iPhone 8";
    if ([platform isEqualToString:@"iPhone10,4"])return @"美版(Global/A1905)iPhone 8";
    if ([platform isEqualToString:@"iPhone10,2"])return @"国行(A1864)、日行(A1898)iPhone 8 Plus";
    if ([platform isEqualToString:@"iPhone10,5"])return @"美版(Global/A1897)iPhone 8 Plus";
    if ([platform isEqualToString:@"iPhone10,3"])return @"国行(A1865)、日行(A1902)iPhone X";
    if ([platform isEqualToString:@"iPhone10,6"])return @"美版(Global/A1901)iPhone X";
    
    if ([platform isEqualToString:@"iPod1,1"])   return @"iPod Touch 1G";
    if ([platform isEqualToString:@"iPod2,1"])   return @"iPod Touch 2G";
    if ([platform isEqualToString:@"iPod3,1"])   return @"iPod Touch 3G";
    if ([platform isEqualToString:@"iPod4,1"])   return @"iPod Touch 4G";
    if ([platform isEqualToString:@"iPod5,1"])   return @"iPod Touch 5G";
    
    if ([platform isEqualToString:@"iPad1,1"])   return @"iPad 1G";
    if ([platform isEqualToString:@"iPad1,2"])   return @"iPad 3G";
    if ([platform isEqualToString:@"iPad2,1"])   return @"iPad 2(WiFi)";
    if ([platform isEqualToString:@"iPad2,2"])   return @"iPad 2";
    if ([platform isEqualToString:@"iPad2,3"])   return @"iPad 2(CDMA)";
    if ([platform isEqualToString:@"iPad2,4"])   return @"iPad 2";
    if ([platform isEqualToString:@"iPad2,5"])   return @"iPad Mini 1G";
    if ([platform isEqualToString:@"iPad2,6"])   return @"iPad Mini 1G";
    if ([platform isEqualToString:@"iPad2,7"])   return @"iPad Mini (GSM+CDMA)";
    if ([platform isEqualToString:@"iPad3,1"])   return @"iPad 3(WiFi)";
    if ([platform isEqualToString:@"iPad3,2"])   return @"iPad 3(GSM+CDMA)";
    if ([platform isEqualToString:@"iPad3,3"])   return @"iPad 3";
    if ([platform isEqualToString:@"iPad3,4"])   return @"iPad 4(WiFi)";
    if ([platform isEqualToString:@"iPad3,5"])   return @"iPad 4";
    if ([platform isEqualToString:@"iPad3,6"])   return @"iPad 4(GSM+CDMA)";
    if ([platform isEqualToString:@"iPad4,1"])   return @"iPad Air(WiFi)";
    if ([platform isEqualToString:@"iPad4,2"])   return @"iPad Air(Cellular)";
    if ([platform isEqualToString:@"iPad4,3"])   return @"iPad Air";
    if ([platform isEqualToString:@"iPad4,4"])   return @"iPad Mini 2G(WiFi)";
    if ([platform isEqualToString:@"iPad4,5"])   return @"iPad Mini 2G(Cellular)";
    if ([platform isEqualToString:@"iPad4,6"])   return @"iPad Mini 2";
    if ([platform isEqualToString:@"iPad4,7"])   return @"iPad Mini 3";
    if ([platform isEqualToString:@"iPad4,8"])   return @"iPad Mini 3";
    if ([platform isEqualToString:@"iPad4,9"])   return @"iPad Mini 3";
    if ([platform isEqualToString:@"iPad5,1"])   return @"iPad Mini 4 (WiFi)";
    if ([platform isEqualToString:@"iPad5,2"])   return @"iPad Mini 4 (LTE)";
    if ([platform isEqualToString:@"iPad5,3"])   return @"iPad Air 2";
    if ([platform isEqualToString:@"iPad5,4"])   return @"iPad Air 2";
    if ([platform isEqualToString:@"iPad6,3"])   return @"iPad Pro 9.7";
    if ([platform isEqualToString:@"iPad6,4"])   return @"iPad Pro 9.7";
    if ([platform isEqualToString:@"iPad6,7"])   return @"iPad Pro 12.9";
    if ([platform isEqualToString:@"iPad6,8"])   return @"iPad Pro 12.9";
    if ([platform isEqualToString:@"iPad6,11"])  return @"iPad 5 (WiFi)";
    if ([platform isEqualToString:@"iPad6,12"])  return @"iPad 5 (Cellular)";
    if ([platform isEqualToString:@"iPad7,1"])   return @"iPad Pro 12.9 inch 2nd gen (WiFi)";
    if ([platform isEqualToString:@"iPad7,2"])   return @"iPad Pro 12.9 inch 2nd gen (Cellular)";
    if ([platform isEqualToString:@"iPad7,3"])   return @"iPad Pro 10.5 inch (WiFi)";
    if ([platform isEqualToString:@"iPad7,4"])   return @"iPad Pro 10.5 inch (Cellular)";
    
    if ([platform isEqualToString:@"AppleTV2,1"])    return @"Apple TV 2";
    if ([platform isEqualToString:@"AppleTV3,1"])    return @"Apple TV 3";
    if ([platform isEqualToString:@"AppleTV3,2"])    return @"Apple TV 3";
    if ([platform isEqualToString:@"AppleTV5,3"])    return @"Apple TV 4";
    
    if ([platform isEqualToString:@"i386"])      return @"iPhone Simulator";
    if ([platform isEqualToString:@"x86_64"])    return @"iPhone Simulator";
    return platform;
}

//获取mac 地址
+ (NSString *)getMacAddress{
    int mib[6];
    size_t len;
    char *buf;
    unsigned char *ptr;
    struct if_msghdr *ifm;
    struct sockaddr_dl *sdl;
    
    mib[0] = CTL_NET;
    mib[1] = AF_ROUTE;
    mib[2] = 0;
    mib[3] = AF_LINK;
    mib[4] = NET_RT_IFLIST;
    
    if ((mib[5] = if_nametoindex("en0")) == 0) {
        printf("Error: if_nametoindex error/n");
        return NULL;
    }
    
    if (sysctl(mib, 6, NULL, &len, NULL, 0) < 0) {
        printf("Error: sysctl, take 1/n");
        return NULL;
    }
    
    if ((buf = malloc(len)) == NULL) {
        printf("Could not allocate memory. error!/n");
        return NULL;
    }
    
    if (sysctl(mib, 6, buf, &len, NULL, 0) < 0) {
        printf("Error: sysctl, take 2");
        return NULL;
    }
    
    ifm = (struct if_msghdr *)buf;
    sdl = (struct sockaddr_dl *)(ifm + 1);
    ptr = (unsigned char *)LLADDR(sdl);
    
    NSString *outstring = [NSString stringWithFormat:@"%02x%02x%02x%02x%02x%02x", *ptr, *(ptr+1), *(ptr+2), *(ptr+3), *(ptr+4), *(ptr+5)];
    free(buf);
    
    return [outstring uppercaseString];
}

//获取IP地址
+ (NSString *)getIPAddresses{
    int sockfd = socket(AF_INET, SOCK_DGRAM, 0);
    
    NSMutableArray *ips = [NSMutableArray array];
    
    int BUFFERSIZE = 4096;
    
    struct ifconf ifc;
    
    char buffer[BUFFERSIZE], *ptr, lastname[IFNAMSIZ], *cptr;
    
    struct ifreq *ifr, ifrcopy;
    
    ifc.ifc_len = BUFFERSIZE;
    ifc.ifc_buf = buffer;
    
    if (ioctl(sockfd, SIOCGIFCONF, &ifc) >= 0){
        
        for (ptr = buffer; ptr < buffer + ifc.ifc_len; ){
            
            ifr = (struct ifreq *)ptr;
            int len = sizeof(struct sockaddr);
            
            if (ifr->ifr_addr.sa_len > len) {
                len = ifr->ifr_addr.sa_len;
            }
            
            ptr += sizeof(ifr->ifr_name) + len;
            if (ifr->ifr_addr.sa_family != AF_INET) continue;
            if ((cptr = (char *)strchr(ifr->ifr_name, ':')) != NULL) *cptr = 0;
            if (strncmp(lastname, ifr->ifr_name, IFNAMSIZ) == 0) continue;
            
            memcpy(lastname, ifr->ifr_name, IFNAMSIZ);
            ifrcopy = *ifr;
            ioctl(sockfd, SIOCGIFFLAGS, &ifrcopy);
            
            if ((ifrcopy.ifr_flags & IFF_UP) == 0) continue;
            
            NSString *ip = [NSString  stringWithFormat:@"%s", inet_ntoa(((struct sockaddr_in *)&ifr->ifr_addr)->sin_addr)];
            [ips addObject:ip];
        }
    }
    
    close(sockfd);
    NSString *deviceIP = @"";
    
    for (int i=0; i < ips.count; i++) {
        if (ips.count > 0) {
            deviceIP = [NSString stringWithFormat:@"%@",ips.lastObject];
        }
    }
    return deviceIP;
}

//是否越狱
//这里用多个判断方式判断，确保判断更加准确
+ (BOOL)isJailBreak {
    return [self p_judgeByOpenAppFolder] || [self p_judgeByOpenUrl] || [self p_judgeByFolderExists] || [self p_judgeByReadDYLD_INSERT_LIBRARIES];
}

#pragma mark - private method
+ (BOOL)p_judgeByReadDYLD_INSERT_LIBRARIES {
    char *env = getenv("DYLD_INSERT_LIBRARIES");
    if (env) {
        return YES;
    }
    return NO;
}

//通过能否打开软件安装文件夹判断
+ (BOOL)p_judgeByOpenAppFolder {
    NSError *error;
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSRange rang = [path rangeOfString:@"Application/"];
    NSString *appPath = [path substringToIndex:rang.location+ rang.length];
    if ([[NSFileManager defaultManager] fileExistsAtPath:appPath]) {
        NSArray *arr = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:appPath error:&error];
        if (arr && [arr count]!=0) {
            return YES;
        }else {
            return NO;
        }
        
        return YES;
    }
    return NO;
}

//通过能否打开cydia：//来判断，YES说明可以打开，就是越狱的，NO表示不可以打开
+ (BOOL)p_judgeByOpenUrl {
    if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"cydia://"]]) {
        return YES;
    }
    return NO;
}

//通过文件夹判断，如果boo为YES说明有以下的一些文件夹，则说明已经越狱
+ (BOOL)p_judgeByFolderExists {
    __block BOOL boo = NO;
    NSArray *arr = @[@"/Applications/Cydia.app",@"/Library/MobileSubstrate/MobileSubstrate.dylib",@"/bin/bash",@"/usr/sbin/sshd",@"/etc/apt"];
    [arr enumerateObjectsUsingBlock:^(id   obj, NSUInteger idx, BOOL *  stop) {
        if ([[NSFileManager defaultManager] fileExistsAtPath:obj]) {
            boo = YES;
            *stop = YES;
        }
    }];
    return boo;
}

//返回运营商名称
+ (NSString *)getCurrentPhoneOperatorName {
    CTTelephonyNetworkInfo *info = [CTTelephonyNetworkInfo new];
    CTCarrier *carrier = [info subscriberCellularProvider];
    
    if (!carrier.isoCountryCode) {
        return nil;
    }
    return [carrier carrierName];
}

//返回手机号的国家代码
+ (NSString *)getCurrentISOCountryCode {
    CTTelephonyNetworkInfo *info = [CTTelephonyNetworkInfo new];
    CTCarrier *carrier = [info subscriberCellularProvider];
    
    if (!carrier.isoCountryCode) {
        return nil;
    }
    return [carrier isoCountryCode];
}

//返回移动国家码
+ (NSString *)getMobileCountryCode {
    CTTelephonyNetworkInfo *info = [CTTelephonyNetworkInfo new];
    CTCarrier *carrier = [info subscriberCellularProvider];
    
    if (!carrier.isoCountryCode) {
        return nil;
    }
    return [carrier mobileCountryCode];
}

@end
