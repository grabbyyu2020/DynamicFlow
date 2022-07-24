//
//  DynamicUserProfileItemViewModel.h
//  DynamicFlow
//
//  Created by KaiJian Yu on 2022/7/1.
//

#import "DynamicItemViewModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface DynamicUserProfileItemViewModel : DynamicItemViewModel

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *desc;

@end

NS_ASSUME_NONNULL_END
