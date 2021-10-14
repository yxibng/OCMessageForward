//
//  Responder.m
//  test-forward
//
//  Created by yxibng on 2021/10/13.
//

#import "Responder.h"

@implementation Responder

- (void)doSomething {
    NSLog(@"%s",__FUNCTION__);
}


+ (void)doSomething {
    NSLog(@"%s",__FUNCTION__);
}

@end
