//
//  UIApplication+AJModuleService.m
//  AJModuleService
//
//  Created by 徐结兵 on 2019/10/23.
//

#import "UIApplication+AJModuleService.h"

static void AJSwizzleInstanceMethod(Class cls, SEL originalSelector, Class targetCls, SEL swizzledSelector) {
    Method originalMethod = class_getInstanceMethod(cls, originalSelector);
    Method swizzledMethod = class_getInstanceMethod(targetCls, swizzledSelector);
    BOOL didAddMethod = class_addMethod(cls, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));
    if (didAddMethod) {
        class_replaceMethod(cls, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
    } else {
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
}

@implementation UIApplication (AJModuleService)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        AJSwizzleInstanceMethod(self, @selector(setDelegate:), self, @selector(aj_setDelegate:));
    });
}

- (void)aj_setDelegate:(id<UIApplicationDelegate>)delegate {
    NSMutableArray *serviceArray = AJModuleServiceManager.sharedInstance.serviceArray;
    [serviceArray sortUsingDescriptors:@[[[NSSortDescriptor alloc] initWithKey:@"priority" ascending:NO]]];
    AJModuleServiceDelegate *ajDelegate = AJModuleServiceDelegate.sharedInstance;
    ajDelegate.originDelagate = delegate;
    [self aj_setDelegate:(id<UIApplicationDelegate>)ajDelegate];
}

@end
