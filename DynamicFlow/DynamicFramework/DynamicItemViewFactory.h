//
//  DynamicItemViewFactory.h
//  DynamicFlow
//
//  Created by KaiJian Yu on 2022/7/1.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class DynamicItemViewModel;
@class DynamicItemView;

@interface DynamicItemViewFactory : NSObject

/// Register the item view class and item view model to let factory know which item view or item view model to instance
/// and register pattern permit that when intergrate a new dynamic bussness model, it's no need to modify any code in the dynamic framework
/// @param viewClass The item view class
/// @param viewModelClass The item view model class
+ (void)registerItemViewClass:(Class)viewClass withItemViewModelClass:(Class)viewModelClass;

/// Return the item view class coressponding to the item view model class
/// @Param viewModelClass The coressponding item view model class
+ (Class)itemViewClassForItemViewModelClass:(Class)viewModelClass;

/// Instance dedicated dynamic item view by coresponding item view model
/// @param viewModel The coressponding item view model
+ (DynamicItemView *)dynamicItemViewWithViewModel:(DynamicItemViewModel *)viewModel;

/// Return releated item view model coresponding to dynamics in a plist file
/// @param plistFilePath The plist file path of the file which contains some example dynamics
+ (NSArray<DynamicItemViewModel *> *)dynamicItemViewModelsWithPlistFilePath:(NSString *)plistFilePath;

@end

NS_ASSUME_NONNULL_END
