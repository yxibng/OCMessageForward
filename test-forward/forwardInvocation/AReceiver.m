//
//  AReceiver.m
//  test-forward
//
//  Created by yxibng on 2021/10/13.
//

#import "AReceiver.h"


@interface AHandler : NSObject

@end

@implementation AHandler
- (void)doSomething {
    NSLog(@"%s",__FUNCTION__);
}
- (BOOL)doSomethingWithParam1:(NSString *)param1 param2:(char *)param2 {
    NSLog(@"%s, parma1 = %@, param2 = %s",__FUNCTION__, param1, param2);
    return YES;
}

- (void)doWithParam1:(NSString *)param1 param2:(char *)param2 {
    NSLog(@"%s, parma1 = %@, param2 = %s",__FUNCTION__, param1, param2);
}



@end


@implementation AReceiver

- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
    if (aSelector == @selector(doSomething)) {
        return [NSMethodSignature signatureWithObjCTypes:"v@:"];
    }
    
    if (aSelector == @selector(doSomethingWithParam1:param2:)) {
        return [NSMethodSignature signatureWithObjCTypes:"c@:@*"];
    }
    
    return [super methodSignatureForSelector:aSelector];
}

- (void)forwardInvocation:(NSInvocation *)anInvocation {
    
    //将消息转发给其他对象
    if (anInvocation.selector == @selector(doSomething)) {
        [anInvocation invokeWithTarget:[AHandler new]];
    }
    if (anInvocation.selector == @selector(doSomethingWithParam1:param2:)) {
        //篡改消息的参数
        NSString *param1 = @"message1 hacked";
        char *param2 = "message2 hacked";
        [anInvocation setArgument:&param1 atIndex:2];
        [anInvocation setArgument:&param2 atIndex:3];
        //篡改消息的方法选择器
        anInvocation.selector = @selector(doWithParam1:param2:);
        //修改消息接收对象
        [anInvocation invokeWithTarget:[AHandler new]];
        //篡改消息的返回值
        BOOL ret = YES;
        [anInvocation setReturnValue:&ret];
    }
}
@end
