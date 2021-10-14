//
//  Resolver.m
//  test-forward
//
//  Created by yxibng on 2021/10/13.
//

#import "Resolver.h"
#import <Objc/runtime.h>
@implementation Resolver
void instanceMethodIMP(id self, SEL _cmd) {
    NSLog(@"%s",__FUNCTION__);
}

void classMethodIMP(id self, SEL _cmd) {
    NSLog(@"%s",__FUNCTION__);
}

+ (BOOL)resolveClassMethod:(SEL)sel {
    if (sel == @selector(doSomething)) {
        Class meta = object_getClass([self class]);
        class_addMethod(meta, @selector(doSomething), (IMP)classMethodIMP, "v@:");
        return YES;
    }
    return [super resolveClassMethod:sel];
}

+ (BOOL)resolveInstanceMethod:(SEL)sel {
    if (sel == @selector(doSomething)) {
        class_addMethod([self class], @selector(doSomething), (IMP)instanceMethodIMP, "v@:");
        return YES;
    }
    return [super resolveClassMethod:sel];
}
@end
