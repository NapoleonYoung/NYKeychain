# NYKeychain

ios keychain

### 实现功能

- 实现了基本功能：添加、查找、删除、更新密码

### 用法

```objective-c
#import "NYKeychain.h"//引入头文件

[NYKeychain setPassword:password forService:serviceName account:account];//保存／更新密码
NSString *myPassword = [NYKeychain passwordForService:serviceName account:account];//查找密码
[NYKeychain deletePasswordForService:serviceName account:account];//删除密码

```

### 版本说明

- v1.01 实现了基本功能：添加、查找、删除、更新密码