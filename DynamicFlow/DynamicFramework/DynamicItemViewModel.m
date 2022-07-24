//
//  DynamicItemViewModel.m
//  DynamicFlow
//
//  Created by KaiJian Yu on 2022/7/1.
//

#import "DynamicItemViewModel.h"

@interface DynamicItemViewModel ()

@property (nonatomic, strong) NSArray<DynamicItemViewModel *> *subItemViewModels;

@end

@implementation DynamicItemViewModel

+ (BOOL)isSupportTypeString:(NSString *)typeString {
    NSAssert(NO, @"[Dynamic] Should not call this function");
    return NO;
}

+ (instancetype)dynamicItemVMWithDictionary:(NSDictionary *)dictionary {
    NSAssert(NO, @"[Dynamic] Should not call this function");
    return [[self alloc] init];
}

- (float)height {
    return 10;
}

- (void)addSubItemViewModel:(DynamicItemViewModel *)itemViewModel {
    if (!itemViewModel) {
        return;
    }
    
    NSMutableArray<DynamicItemViewModel *> *result = [NSMutableArray array];
    if (self.subItemViewModels.count) {
        [result addObjectsFromArray:self.subItemViewModels];
    }
    [result addObject:itemViewModel];
    if (result.count) {
        self.subItemViewModels = result.copy;
    }
}

@end
