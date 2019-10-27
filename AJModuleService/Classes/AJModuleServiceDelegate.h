//
//  AJModuleServiceDelegate.h
//  AJModuleService
//
//  Created by 徐结兵 on 2019/10/27.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface AJModuleServiceDelegate : NSObject

@property (nonatomic, strong, readwrite) id <UIApplicationDelegate> originDelagate;

+ (instancetype)sharedInstance;

@end

NS_ASSUME_NONNULL_END
