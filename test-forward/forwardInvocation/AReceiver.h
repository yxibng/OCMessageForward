//
//  AReceiver.h
//  test-forward
//
//  Created by yxibng on 2021/10/13.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface AReceiver : NSObject
- (void)doSomething;
- (BOOL)doSomethingWithParam1:(NSString *)param1 param2:(char *)param2;
@end

NS_ASSUME_NONNULL_END
