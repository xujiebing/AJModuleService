//
//  AJModuleService.m
//  AJModuleService
//
//  Created by 徐结兵 on 2019/10/23.
//

#import "AJModuleService.h"

@implementation AJModuleService

+ (void)registerService {
    AJModuleService *service = [[self alloc] init];
    [AJModuleServiceManager.sharedInstance addService:service];
}

- (AJModuleServicePriority)priority {
    return AJModuleServicePriorityMedium;
}

@end
