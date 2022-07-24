//
//  DynamicTextContentItemViewModel.m
//  DynamicFlow
//
//  Created by KaiJian Yu on 2022/7/1.
//

#import "DynamicTextContentItemViewModel.h"

@implementation DynamicTextContentItemViewModel

+ (BOOL)isSupportTypeString:(NSString *)typeString {
    if ([typeString isEqualToString:@"textContent"]) {
        return YES;
    }
    return NO;
}

+ (instancetype)dynamicItemVMWithDictionary:(NSDictionary *)dictionary {
    DynamicTextContentItemViewModel *textContentItemVM = [[self alloc] init];
    textContentItemVM.textContent = [dictionary objectForKey:@"textContent"];
    return textContentItemVM;
}

- (float)height {
    return 30.0f;
}

@end
