//
//  DynamicItemViewFactory.m
//  DynamicFlow
//
//  Created by KaiJian Yu on 2022/7/1.
//

#import "DynamicItemViewFactory.h"
#import "DynamicItemViewModel.h"
#import "DynamicItemView.h"

static NSMapTable *sViewModelClassToViewClassMapTable = nil;

@implementation DynamicItemViewFactory

+ (void)registerItemViewClass:(Class)viewClass withItemViewModelClass:(Class)viewModelClass {
    NSAssert(viewClass && viewModelClass, @"[Dynamic] input parameters viewClass or viewModelClass is nil");
    
    if (!sViewModelClassToViewClassMapTable) {
        sViewModelClassToViewClassMapTable = [NSMapTable mapTableWithKeyOptions:NSPointerFunctionsWeakMemory valueOptions:NSPointerFunctionsWeakMemory];
    }
    
    [sViewModelClassToViewClassMapTable setObject:viewClass forKey:viewModelClass];
}

+ (Class)itemViewClassForItemViewModelClass:(Class)viewModelClass {
    Class itemViewClass = nil;
    if (viewModelClass) {
        itemViewClass = [sViewModelClassToViewClassMapTable objectForKey:viewModelClass];
    }
    return itemViewClass;
}

+ (DynamicItemView *)dynamicItemViewWithViewModel:(DynamicItemViewModel *)viewModel {
    Class dynamicItemViewClass = nil;
    if (sViewModelClassToViewClassMapTable && viewModel) {
        dynamicItemViewClass = [sViewModelClassToViewClassMapTable objectForKey:[viewModel class]];
    }
    
    NSAssert(dynamicItemViewClass, @"[Dynamic] dynamicItemViewClass is nil");
    NSAssert([dynamicItemViewClass superclass] == [DynamicItemView class], @"[Dynamic] dynamicItemViewClass is not DynamicItemView class");
    
    DynamicItemView *dynamicItemView = [dynamicItemViewClass alloc];
    dynamicItemView = [dynamicItemView init];
    [dynamicItemView render:viewModel];
    return dynamicItemView;
}

+ (NSArray<DynamicItemViewModel *> *)dynamicItemViewModelsWithPlistFilePath:(NSString *)plistFilePath {
    NSArray<NSDictionary *> *items = [NSArray arrayWithContentsOfFile:plistFilePath];
    NSMutableArray<DynamicItemViewModel *> *result = [NSMutableArray array];

    NSArray<Class> *itemVMClassArray = [[sViewModelClassToViewClassMapTable keyEnumerator] allObjects];
    for (NSDictionary *item in items) {
        DynamicItemViewModel *itemVM = [[DynamicItemViewModel alloc] init];
        for (NSString *key in item.allKeys) {
            for (Class itemVMClass in itemVMClassArray) {
                BOOL isSupported = [itemVMClass performSelector:@selector(isSupportTypeString:) withObject:key];
                if (!isSupported) {
                    continue;
                }
                DynamicItemViewModel *subItemVM = [itemVMClass performSelector:@selector(dynamicItemVMWithDictionary:) withObject:[item objectForKey:key]];
                [itemVM addSubItemViewModel:subItemVM];
            }
        }
        [result addObject:itemVM];
    }
    return result;
}

@end
