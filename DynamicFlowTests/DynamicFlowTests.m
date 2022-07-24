//
//  DynamicFlowTests.m
//  DynamicFlowTests
//
//  Created by KaiJian Yu on 2022/7/19.
//

#import <XCTest/XCTest.h>
#import "DynamicInteractionItemViewModel.h"

@interface DynamicFlowTests : XCTestCase

@end

@implementation DynamicFlowTests

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testExample {
    NSDictionary *dic = @{@"likeCount" : @(10000), @"commentCount" : @(10000), @"forwardCount" : @(10000)};
    DynamicInteractionItemViewModel *vm = [DynamicInteractionItemViewModel dynamicItemVMWithDictionary:dic];
    XCTAssertTrue([vm.likeButtonTitle isEqualToString:@"赞 1.0w"], @"like digit string error");
    XCTAssertTrue([vm.commentButtonTitle isEqualToString:@"评论 1.0w"], @"like digit string error");
    XCTAssertTrue([vm.forwardButtonTitle isEqualToString:@"转发 1.0w"], @"like digit string error");
}


@end
