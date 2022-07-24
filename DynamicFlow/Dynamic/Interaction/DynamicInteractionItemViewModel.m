//
//  DynamicInteractionItemViewModel.m
//  DynamicFlow
//
//  Created by KaiJian Yu on 2022/7/1.
//

#import "DynamicInteractionItemViewModel.h"

@interface DynamicInteractionItemViewModel ()

@property (nonatomic, strong) NSString *likeButtonTitle;
@property (nonatomic, strong) NSString *commentButtonTitle;
@property (nonatomic, strong) NSString *forwardButtonTitle;

@end

@implementation DynamicInteractionItemViewModel

+ (BOOL)isSupportTypeString:(NSString *)typeString {
    if ([typeString isEqualToString:@"interaction"]) {
        return YES;
    }
    return NO;
}

+ (instancetype)dynamicItemVMWithDictionary:(NSDictionary *)dictionary {
    DynamicInteractionItemViewModel *interactionItemVM = [[self alloc] init];
    
    NSNumber *likeCount = [dictionary objectForKey:@"likeCount"];
    NSString *likeDigitString = (likeCount.integerValue > 0) ? [NSString stringWithFormat:@" %@", [self friendlyDigitStringWithCount:likeCount]] : @"";
    interactionItemVM.likeButtonTitle = [NSString stringWithFormat:@"赞%@", likeDigitString];
    
    NSNumber *commentCount = [dictionary objectForKey:@"commentCount"];
    NSString *commentDigitString = (commentCount.integerValue > 0) ? [NSString stringWithFormat:@" %@", [self friendlyDigitStringWithCount:commentCount]] : @"";
    interactionItemVM.commentButtonTitle = [NSString stringWithFormat:@"评论%@", commentDigitString];
    
    NSNumber *forwardCount = [dictionary objectForKey:@"forwardCount"];
    NSString *forwardDigitString = (forwardCount.integerValue > 0) ? [NSString stringWithFormat:@" %@", [self friendlyDigitStringWithCount:forwardCount]] : @"";
    interactionItemVM.forwardButtonTitle = [NSString stringWithFormat:@"转发%@", forwardDigitString];
    
    return interactionItemVM;
}

- (float)height {
    return 44.0f;
}

#pragma mark - Utility

+ (NSString *)friendlyDigitStringWithCount:(NSNumber *)count {
    NSString *result = nil;
    NSUInteger c = count.unsignedIntegerValue;
    if (c == 0) {
        result = nil;
    } else if (c < 10000) {
        result = [NSString stringWithFormat:@"%zd", c];
    } else if (c < 10000000) {
        float r = c * 1.0f / 10000.0;
        result = [NSString stringWithFormat:@"%.1fw", r];
    } else {
        float r = c * 1.0f / 10000000.0;
        result = [NSString stringWithFormat:@"%.1fkw", r];
    }
    return result;
}

@end
