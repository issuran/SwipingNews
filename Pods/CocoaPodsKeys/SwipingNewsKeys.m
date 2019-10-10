//
// Generated by CocoaPods-Keys
// on 06/10/2019
// For more information see https://github.com/orta/cocoapods-keys
//

#import <objc/runtime.h>
#import <Foundation/NSDictionary.h>
#import "SwipingNewsKeys.h"

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wincomplete-implementation"

@implementation SwipingNewsKeys

  @dynamic aPI_KEY;

#pragma clang diagnostic pop

+ (BOOL)resolveInstanceMethod:(SEL)name
{
  NSString *key = NSStringFromSelector(name);
  NSString * (*implementation)(SwipingNewsKeys *, SEL) = NULL;

  if ([key isEqualToString:@"aPI_KEY"]) {
    implementation = _podKeyse4fa45af7308481f050370634a691c62;
  }

  if (!implementation) {
    return [super resolveInstanceMethod:name];
  }

  return class_addMethod([self class], name, (IMP)implementation, "@@:");
}

static NSString *_podKeyse4fa45af7308481f050370634a691c62(SwipingNewsKeys *self, SEL _cmd)
{
  
    
      char cString[33] = { SwipingNewsKeysData[560], SwipingNewsKeysData[670], SwipingNewsKeysData[565], SwipingNewsKeysData[456], SwipingNewsKeysData[91], SwipingNewsKeysData[748], SwipingNewsKeysData[280], SwipingNewsKeysData[426], SwipingNewsKeysData[793], SwipingNewsKeysData[567], SwipingNewsKeysData[516], SwipingNewsKeysData[639], SwipingNewsKeysData[279], SwipingNewsKeysData[620], SwipingNewsKeysData[205], SwipingNewsKeysData[695], SwipingNewsKeysData[485], SwipingNewsKeysData[554], SwipingNewsKeysData[427], SwipingNewsKeysData[45], SwipingNewsKeysData[188], SwipingNewsKeysData[866], SwipingNewsKeysData[715], SwipingNewsKeysData[376], SwipingNewsKeysData[831], SwipingNewsKeysData[680], SwipingNewsKeysData[768], SwipingNewsKeysData[667], SwipingNewsKeysData[757], SwipingNewsKeysData[742], SwipingNewsKeysData[239], SwipingNewsKeysData[121], '\0' };
    
    return [NSString stringWithCString:cString encoding:NSUTF8StringEncoding];
  
}


static char SwipingNewsKeysData[898] = "D73zPqjwFqfI11JXmrwky4VFMz44yi8zl6q/dd806ZWjk9ifHgw0yjSQeJL3mAo9ABIJZna/vGOQKvlhTpGLfl98McGeT9j70Jt5TUhEFHLjIKucB/EYAlGYmdmhAqJWMAYX0Tg6LZX1z/krWvqYFqNabkpJv2y26aA1I7AMa4miIvj3/FtW7xi4IB4bc9rJQlFfXMffjhWUMbsYojdp9YOCD9YWdqCOL/RMpcBbrYO1x6t2elxk7D1EVpQKkU9qj3J6CedBNLzMqVXzgxIYbP743kQFtO/+mPsJKhNa3KIuGOpDJc0SBVDm0abo7plfgqCAwv1D8lvgWxkNrQy9ciLDhq3xe93pWjpfXDtSFUM7HOchvWwWwC0L3nRRYyuUtE8rPqTdTzNPCHXtzGYTcpgzLdaal3E1F4iEL8Cr/v0a8+9yKrFqjhor6vdAO17Gboj66TLhfgDlU3rlRMR463RkST/rdyi4AKHb2a6TLUU/sdfMzQQaeKLVg5pH4s9g6khW5YzW7XAwk15lt3FxC3NWJOnZcHZYKvE6V8U6dr37vemL2/+bL7e4D8uP/U79JsaHNb9AXOfQk/ZuzANRTUqM2UPODg7GcP1+UQPLYeRk8SKrWfhk3S/AsZ3oLY39jMohxC39ZK8Hvy2acmaiW+xmWMmczO3Q78ums3Mq29n6JYjSk72RhTV5Ym8YJ1XexzaHb9AmN0O3bD5tOKASlnVUkIZ0VrGLnF1LIy31lJvC2QT9WHxRJ5EpXFrKUIqU81o/mt7Rs1ql8bh8/TkzHBH1+9TAl8ToU41l6COWmcxJU5G6am/+if2co4TSt8+akxpeLv3oX6Yv2QpCpOdqAakZga/7nun++k4Ht3NLbLydKnWDU72C9sL/RMJgZPYC\\\"";

- (NSString *)description
{
  return [@{
            @"aPI_KEY": self.aPI_KEY,
  } description];
}

- (id)debugQuickLookObject
{
  return [self description];
}

@end