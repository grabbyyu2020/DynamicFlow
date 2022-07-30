//
//  DynamicFlowTests.m
//  DynamicFlowTests
//
//  Created by KaiJian Yu on 2022/7/19.
//

#import <XCTest/XCTest.h>
#import "DynamicUserProfileItemViewModel.h"
#import "DynamicTextContentItemViewModel.h"
#import "DynamicInteractionItemViewModel.h"
#import "DynamicImageContentItemViewModel.h"

@interface DynamicFlowTests : XCTestCase

@end

@implementation DynamicFlowTests

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testDynamicInteractionItemViewModel {
    NSDictionary *dic = nil;
    DynamicInteractionItemViewModel *vm = nil;

    dic = @{@"likeCount" : @(0), @"commentCount" : @(0), @"forwardCount" : @(0)};
    vm = [DynamicInteractionItemViewModel dynamicItemVMWithDictionary:dic];
    XCTAssertTrue([vm.likeButtonTitle isEqualToString:@"赞"], @"like digit string error");
    XCTAssertTrue([vm.commentButtonTitle isEqualToString:@"评论"], @"like digit string error");
    XCTAssertTrue([vm.forwardButtonTitle isEqualToString:@"转发"], @"like digit string error");

    dic = @{@"likeCount" : @(9999), @"commentCount" : @(9999), @"forwardCount" : @(9999)};
    vm = [DynamicInteractionItemViewModel dynamicItemVMWithDictionary:dic];
    XCTAssertTrue([vm.likeButtonTitle isEqualToString:@"赞 9999"], @"like digit string error");
    XCTAssertTrue([vm.commentButtonTitle isEqualToString:@"评论 9999"], @"like digit string error");
    XCTAssertTrue([vm.forwardButtonTitle isEqualToString:@"转发 9999"], @"like digit string error");

    dic = @{@"likeCount" : @(10000), @"commentCount" : @(10000), @"forwardCount" : @(10000)};
    vm = [DynamicInteractionItemViewModel dynamicItemVMWithDictionary:dic];
    XCTAssertTrue([vm.likeButtonTitle isEqualToString:@"赞 1.0w"], @"like digit string error");
    XCTAssertTrue([vm.commentButtonTitle isEqualToString:@"评论 1.0w"], @"like digit string error");
    XCTAssertTrue([vm.forwardButtonTitle isEqualToString:@"转发 1.0w"], @"like digit string error");

    dic = @{@"likeCount" : @(10000000), @"commentCount" : @(10000000), @"forwardCount" : @(10000000)};
    vm = [DynamicInteractionItemViewModel dynamicItemVMWithDictionary:dic];
    XCTAssertTrue([vm.likeButtonTitle isEqualToString:@"赞 1.0kw"], @"like digit string error");
    XCTAssertTrue([vm.commentButtonTitle isEqualToString:@"评论 1.0kw"], @"like digit string error");
    XCTAssertTrue([vm.forwardButtonTitle isEqualToString:@"转发 1.0kw"], @"like digit string error");
}

- (void)testDynamicUserProfileItemViewModel {
    NSDictionary *dic = nil;
    DynamicUserProfileItemViewModel *vm = nil;

    dic = @{@"name" : @"周杰伦", @"description" : @"亚洲小天王"};
    vm = [DynamicUserProfileItemViewModel dynamicItemVMWithDictionary:dic];
    XCTAssertTrue([vm.name isEqualToString:@"周杰伦"], @"name string error");
    XCTAssertTrue([vm.desc isEqualToString:@"亚洲小天王"], @"description string error");
}

- (void)testDynamicTextContentItemViewModel {
    NSDictionary *dic = nil;
    DynamicTextContentItemViewModel *vm = nil;

    dic = @{@"textContent" : @"今天天气不错!!!"};
    vm = [DynamicTextContentItemViewModel dynamicItemVMWithDictionary:dic];
    XCTAssertTrue([vm.textContent isEqualToString:@"今天天气不错!!!"], @"textContent string error");
}

- (void)testDynamicImageContentItemViewModel {
    NSDictionary *dic = nil;
    DynamicImageContentItemViewModel *vm = nil;

    dic = @{@"imageContentURL" : @"123.jpg"};
    vm = [DynamicImageContentItemViewModel dynamicItemVMWithDictionary:dic];
    NSString *desImageContentURL = [[[NSBundle mainBundle] bundlePath] stringByAppendingPathComponent:@"123.jpg"];
    XCTAssertTrue([vm.imageContentURL isEqualToString:desImageContentURL], @"imageContentURL string error");
}



@end
