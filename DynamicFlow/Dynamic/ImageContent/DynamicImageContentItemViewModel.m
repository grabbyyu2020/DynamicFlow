//
//  DynamicImageContentItemViewModel.m
//  DynamicFlow
//
//  Created by KaiJian Yu on 2022/7/1.
//

#import "DynamicImageContentItemViewModel.h"

@implementation DynamicImageContentItemViewModel

+ (BOOL)isSupportTypeString:(NSString *)typeString {
    if ([typeString isEqualToString:@"imageContent"]) {
        return YES;
    }
    return NO;
}

+ (instancetype)dynamicItemVMWithDictionary:(NSDictionary *)dictionary {
    DynamicImageContentItemViewModel *imageContentItemVM = [[self alloc] init];
    NSString *imageContentURL = [dictionary objectForKey:@"imageContentURL"];
    imageContentURL = [[[NSBundle mainBundle] bundlePath] stringByAppendingPathComponent:imageContentURL];
    imageContentItemVM.imageContentURL = imageContentURL;
    return imageContentItemVM;
}

- (float)height {
    return 100.0f;
}

@end
