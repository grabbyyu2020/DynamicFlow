//
//  DynamicItemViewModel.h
//  DynamicFlow
//
//  Created by KaiJian Yu on 2022/7/1.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DynamicItemViewModel : NSObject

/// Sub item view model which is contained in this item view
@property (nonatomic, readonly) NSArray<DynamicItemViewModel *> *subItemViewModels;

/// Height combile the sub item view's height
@property (nonatomic, readonly) float height;

/// This function is called by json/xml or other format parser to check the data is fit for this class
/// @param typeString Key string is used to identify data block which is fit to this class
+ (BOOL)isSupportTypeString:(NSString *)typeString;

/// Parse the data to fill the instance of this class
/// @param dictionary the data from json/xml
+ (instancetype)dynamicItemVMWithDictionary:(NSDictionary *)dictionary;

/// Add the sub item view model
/// @param itemViewModel the sub item view model
- (void)addSubItemViewModel:(DynamicItemViewModel *)itemViewModel;

@end

NS_ASSUME_NONNULL_END
