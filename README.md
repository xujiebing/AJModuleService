# AJModuleService

## 安装

```ruby
pod 'AJModuleService'
```

## 使用说明

新建`AJService`继承`AJModuleService`

1. 在`load`方法中注册service，必须注册，否则该service无法生效
2. 可重写`priority`方法来设置service执行的优先级
3. 重写`UIApplicationDelegate`,实现业务逻辑

```
@interface AJService : AJModuleService

@end
```

```
@implementation AJService

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
```

## Author

xujiebing, xujiebing1992@gmail.com

## License

AJModuleService is available under the MIT license. See the LICENSE file for more info.
