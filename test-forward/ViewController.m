//
//  ViewController.m
//  test-forward
//
//  Created by yxibng on 2021/10/12.
//

#import "ViewController.h"
#import "Receiver.h"
#import "AReceiver.h"
#import "Resolver.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    /*
     动态解析，添加方法
     1. 可以添加实例方法
     2. 可以添加类方法
     */
    Resolver *resolver = [[Resolver alloc] init];
    [resolver doSomething];
    [Resolver doSomething];
    
    /*
     快速转发，将消息转发给别的可以响应的对象
     */
    Receiver *receiver = [[Receiver alloc] init];
    [receiver doSomething];
    
    /*
     对消息重新签名，通过invocation来转发
     1. 可以修改参数，返回值，接受对象
     2. 将消息转发给多个对象
     3. 不处理的话，消息就被吞掉了
     */
    AReceiver *aReceiver = [[AReceiver alloc] init];
    [aReceiver doSomething];
    
    BOOL ret = [aReceiver doSomethingWithParam1:@"param1" param2:"param2"];
    NSLog(@"ret = %d",ret);
    
    
}


- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}


@end
