//
//  DynamicUserProfileItemViewModel.m
//  DynamicFlow
//
//  Created by KaiJian Yu on 2022/7/1.
//

#import "DynamicUserProfileItemViewModel.h"

@implementation DynamicUserProfileItemViewModel

+ (BOOL)isSupportTypeString:(NSString *)typeString {
    if ([typeString isEqualToString:@"profile"]) {
        return YES;
    }
    return NO;
}

+ (instancetype)dynamicItemVMWithDictionary:(NSDictionary *)dictionary {
    DynamicUserProfileItemViewModel *profileItemVM = [[self alloc] init];
    profileItemVM.name = [dictionary objectForKey:@"name"];
    profileItemVM.desc = [dictionary objectForKey:@"description"];
    return profileItemVM;
}

- (float)height {
    return 50.0f;
}

@end
