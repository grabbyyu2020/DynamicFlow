//
//  DynamicExampleItemViewModel.m
//  DynamicFlow
//
//  Created by KaiJian Yu on 2022/7/1.
//

#import "DynamicExampleItemViewModel.h"

@implementation DynamicExampleItemViewModel

+ (BOOL)isSupportTypeString:(NSString *)typeString {
    if ([typeString isEqualToString:@"example"]) {
        return YES;
    }
    return NO;
}

+ (instancetype)dynamicItemVMWithDictionary:(NSDictionary *)dictionary {
    DynamicExampleItemViewModel *exampleItemVM = [[self alloc] init];
    exampleItemVM.example = [dictionary objectForKey:@"example"];
    return exampleItemVM;
}

- (float)height {
    return 20.0f;
}

@end
