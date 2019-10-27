//
//  AJService3.m
//  AJModuleService_Example
//
//  Created by 徐结兵 on 2019/10/27.
//  Copyright © 2019 xujiebing. All rights reserved.
//

#import "AJService3.h"

@implementation AJService3

+ (void)load {
    [self registerService];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    NSLog(@"test==3");
    return YES;
}

@end
