//
//  Receiver.m
//  test-forward
//
//  Created by yxibng on 2021/10/13.
//

#import "Receiver.h"
#import "Handler.h"

@interface Receiver ()
@property (nonatomic, strong) Handler *handler;
@end

@implementation Receiver

- (instancetype)init
{
    self = [super init];
    if (self) {
        _handler = [[Handler alloc] init];
    }
    return self;
}

- (id)forwardingTargetForSelector:(SEL)aSelector {
    
    if (aSelector == @selector(doSomething)) {
        if ([_handler respondsToSelector:aSelector]) {
            return _handler;
        }
    }
    return [super forwardingTargetForSelector:aSelector];
    
}

@end
