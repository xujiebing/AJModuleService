//
//  AJService1.m
//  AJModuleService_Example
//
//  Created by 徐结兵 on 2019/10/27.
//  Copyright © 2019 xujiebing. All rights reserved.
//

#import "AJService1.h"

@implementation AJService1

+ (void)load {
    [self registerService];
}

- (AJModuleServicePriority)priority {
    return AJModuleServicePriorityLow;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    NSLog(@"test==1");
    return YES;
}

@end
