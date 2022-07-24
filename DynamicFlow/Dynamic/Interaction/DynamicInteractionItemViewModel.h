//
//  DynamicInteractionItemViewModel.h
//  DynamicFlow
//
//  Created by KaiJian Yu on 2022/7/1.
//

#import "DynamicItemViewModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface DynamicInteractionItemViewModel : DynamicItemViewModel

@property (nonatomic, readonly) NSString *likeButtonTitle;
@property (nonatomic, readonly) NSString *commentButtonTitle;
@property (nonatomic, readonly) NSString *forwardButtonTitle;

@end

NS_ASSUME_NONNULL_END
