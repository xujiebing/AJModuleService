//
//  AJModuleService.h
//  AJModuleService
//
//  Created by 徐结兵 on 2019/10/23.
//

#import <Foundation/Foundation.h>
@import UserNotifications;

NS_ASSUME_NONNULL_BEGIN

// 模块service调用优先级
typedef enum : NSUInteger {
    AJModuleServicePriorityVeryLow = 0, // 最低
    AJModuleServicePriorityLow,
    AJModuleServicePriorityMedium,
    AJModuleServicePriorityHigh,
    AJModuleServicePriorityVeryHigh,    // 最高
} AJModuleServicePriority;

@interface AJModuleService : NSObject<UIApplicationDelegate, UNUserNotificationCenterDelegate>

@property (nonatomic, assign, readwrite) AJModuleServicePriority priority;

/// 注册service
+ (void)registerService;

/// AppDelegate调用优先级
- (AJModuleServicePriority)priority;

@end

NS_ASSUME_NONNULL_END
