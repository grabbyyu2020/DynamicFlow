//
//  DynamicCellViewModel.h
//  DynamicFlow
//
//  Created by KaiJian Yu on 2022/7/1.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class DynamicItemViewModel;

@interface DynamicCellViewModel : NSObject

/// Cell height
@property (nonatomic, readonly) CGFloat height;

/// Item views belong to the cell
@property (nonatomic, strong) NSArray<DynamicItemViewModel *> *dynamicItemViewModels;

@end

NS_ASSUME_NONNULL_END
