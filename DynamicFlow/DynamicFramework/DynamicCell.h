//
//  DynamicCell.h
//  DynamicFlow
//
//  Created by KaiJian Yu on 2022/7/1.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class DynamicCellViewModel;

@interface DynamicCell : UITableViewCell

/// Dynamic Cell render call
/// @param viewModel cell's view model
- (void)renderWithViewModel:(DynamicCellViewModel *)viewModel;

@end

NS_ASSUME_NONNULL_END
