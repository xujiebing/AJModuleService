//
//  AJModuleServiceDelegate.m
//  AJModuleService
//
//  Created by 徐结兵 on 2019/10/27.
//

#import "AJModuleServiceDelegate.h"

@implementation AJModuleServiceDelegate

+ (instancetype)sharedInstance {
    static AJModuleServiceDelegate *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[[self class] alloc] init];
    });
    return instance;
}

/// 判断UIApplicationDelegate中是否有方法selector
/// @param selector 待判断的方法
- (BOOL)applicationProtocolContainMethod:(SEL)selector {
    unsigned int outCount = 0;
    struct objc_method_description *methodDescriptions = protocol_copyMethodDescriptionList(@protocol(UIApplicationDelegate), NO, YES, &outCount);
    for (int idx = 0; idx < outCount; idx++) {
        SEL methodSel = methodDescriptions[idx].name;
        if (selector == methodSel) {
            return YES;
        }
    }
    free(methodDescriptions);
    return NO;
}


- (BOOL)respondsToSelector:(SEL)aSelector {
    if ([self.originDelagate respondsToSelector:aSelector]) {
        return YES;
    }
    for (AJModuleService *service in AJModuleServiceManager.sharedInstance.serviceArray) {
        if ([self applicationProtocolContainMethod:aSelector] && [service respondsToSelector:aSelector]) {
            return YES;
        }
    }
    return [super respondsToSelector:aSelector];
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
    struct objc_method_description methodDescription = protocol_getMethodDescription(@protocol(UIApplicationDelegate), aSelector, NO, YES);
    if (methodDescription.name == NULL && methodDescription.types == NULL) {
        return [[self class] instanceMethodSignatureForSelector:@selector(doNothing)];
    }
    // 构建方法签名
    return [NSMethodSignature signatureWithObjCTypes:methodDescription.types];;
}

- (void)forwardInvocation:(NSInvocation *)anInvocation {
    if ([self.originDelagate respondsToSelector:anInvocation.selector]) {
        [anInvocation invokeWithTarget:self.originDelagate];
    }
    for (AJModuleService *service in AJModuleServiceManager.sharedInstance.serviceArray ) {
        if ([service respondsToSelector:anInvocation.selector]) {
            [anInvocation invokeWithTarget:service];
        }
    }
}

- (void)doNothing {
    
}

@end
