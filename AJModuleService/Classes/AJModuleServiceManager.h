//
//  AJModuleServiceManager.h
//  AJModuleService
//
//  Created by 徐结兵 on 2019/10/23.
//

#import <Foundation/Foundation.h>
#import <AJModuleService/AJModuleService.h>

NS_ASSUME_NONNULL_BEGIN

@interface AJModuleServiceManager : NSObject

@property (nonatomic, strong, readonly) NSMutableArray *serviceArray;

+ (instancetype)sharedInstance;

/// 添加service
/// @param service service对象
- (void)addService:(AJModuleService *)service;

@end

NS_ASSUME_NONNULL_END
