//
//  AJModuleService.m
//  AJModuleService
//
//  Created by 徐结兵 on 2019/10/23.
//

#import "AJModuleService.h"

@implementation AJModuleService

+ (void)load {
//    Class class = NSClassFromString(@"PPTTabBarModule");
//    NSObject *obj = [[class alloc] init];
//    SEL registerSel = NSSelectorFromString(@"registerService");
//    if ([obj respondsToSelector:registerSel]) {
//        [obj performSelector:registerSel];
//    }
    
//    SEL sel = NSSelectorFromString(@"priority");
//    if ([obj respondsToSelector:sel]) {
//        
//    }
}

+ (void)registerService {
    AJModuleService *service = [[self alloc] init];
    [AJModuleServiceManager.sharedInstance addService:service];
}

- (AJModuleServicePriority)priority {
    return AJModuleServicePriorityMedium;
}

@end
