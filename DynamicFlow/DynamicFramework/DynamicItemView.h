//
//  DynamicItemView.h
//  DynamicFlow
//
//  Created by KaiJian Yu on 2022/7/1.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class DynamicItemViewModel;

@interface DynamicItemView : UIView

/// Indicate the order by which the item is located in the cell vertically, it's a readonly property, the subclass need
/// implenment position call which return a index, smaller number is located in the front
@property (nonatomic, readonly, class) NSUInteger position;

/// Called when the item view is pulled just from the reusable poll
- (void)prepareForReuse;

/// Render item view
/// @param viewModel View model used to render the item view
- (void)render:(DynamicItemViewModel *)viewModel;

@end

NS_ASSUME_NONNULL_END
