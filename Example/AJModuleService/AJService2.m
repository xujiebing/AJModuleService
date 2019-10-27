//
//  AJService2.m
//  AJModuleService_Example
//
//  Created by 徐结兵 on 2019/10/27.
//  Copyright © 2019 xujiebing. All rights reserved.
//

#import "AJService2.h"

@implementation AJService2

+ (void)load {
    [self registerService];
}

- (AJModuleServicePriority)priority {
    return AJModuleServicePriorityHigh;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    NSLog(@"test==2");
    return YES;
}

@end
