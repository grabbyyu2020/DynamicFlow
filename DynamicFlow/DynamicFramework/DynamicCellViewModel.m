//
//  DynamicCellViewModel.m
//  DynamicFlow
//
//  Created by KaiJian Yu on 2022/7/1.
//

#import "DynamicCellViewModel.h"
#import "DynamicItemViewModel.h"

@implementation DynamicCellViewModel

- (CGFloat)height {
    CGFloat height = 0;
    for (DynamicItemViewModel *itemVM in self.dynamicItemViewModels) {
        height += itemVM.height;
    }
    return height;
}

@end
