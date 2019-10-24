//
//  AJModuleServiceManager.m
//  AJModuleService
//
//  Created by 徐结兵 on 2019/10/23.
//

#import "AJModuleServiceManager.h"

@interface AJModuleServiceManager ()

@property (nonatomic, strong, readwrite) NSMutableArray *serviceArray;

@end

@implementation AJModuleServiceManager

+ (instancetype)sharedInstance {
    static AJModuleServiceManager *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{    //!OCLINT
        instance = [[[self class] alloc] init];
    });
    return instance;
}

- (void)addService:(AJModuleService *)service {
    if ([self.serviceArray containsObject:service]) {
        return;
    }
    [self.serviceArray addObject:service];
//    [self.serviceArray sortUsingDescriptors:@[[[NSSortDescriptor alloc] initWithKey:@"priority" ascending:NO]]];
}

#pragma mark - 懒加载方法

- (NSMutableArray *)serviceArray {
    if (!_serviceArray) {
        _serviceArray = [[NSMutableArray alloc] init];
    }
    return _serviceArray;
}

@end
