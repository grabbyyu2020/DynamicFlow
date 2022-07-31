//
//  DynamicCell.m
//  DynamicFlow
//
//  Created by KaiJian Yu on 2022/7/1.
//

#import "DynamicCell.h"
#import "DynamicItemViewModel.h"
#import "DynamicItemViewFactory.h"
#import "DynamicItemView.h"

@interface _DynamicReusableItemViewQueue : NSObject

+ (instancetype)shareInstance;

/// Enqueue a item view into the reusable pool
/// @param itemView The item enqueued into the pool
/// @param identifier Used to identify the item view
- (void)enqueueReusableItemView:(DynamicItemView *)itemView withIdentifier:(NSString *)identifier;

/// Dequeue a item view from the reusable pool
/// @param identifier Used to identify the item view
- (DynamicItemView *)dequeueReusableItemViewWithIdentifier:(NSString *)identifier;

@end

@implementation _DynamicReusableItemViewQueue {
    NSMutableDictionary *_reusableItemQueueDictionary;
}

+ (instancetype)shareInstance {
    static _DynamicReusableItemViewQueue *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        _reusableItemQueueDictionary = [NSMutableDictionary dictionary];
    }
    return self;
}

- (void)enqueueReusableItemView:(DynamicItemView *)itemView withIdentifier:(NSString *)identifier {
    NSAssert(itemView && identifier, @"[Dynamic] input parameters should not be nil!");
    
    NSMutableArray<DynamicItemView *> *itemViewArray = [_reusableItemQueueDictionary objectForKey:identifier];
    if (!itemViewArray) {
        itemViewArray = [NSMutableArray array];
        [_reusableItemQueueDictionary setObject:itemViewArray forKey:identifier];
    }
    [itemViewArray addObject:itemView];
}

- (DynamicItemView *)dequeueReusableItemViewWithIdentifier:(NSString *)identifier {
    NSAssert(identifier, @"[Dynamic] input parameters should not be nil!");
    
    NSMutableArray<DynamicItemView *> *itemViewArray = [_reusableItemQueueDictionary objectForKey:identifier];
    DynamicItemView *result = nil;
    if (itemViewArray.count) {
        result = itemViewArray.lastObject;
        [itemViewArray removeLastObject];
    }
    [result prepareForReuse];
    
    return result;
}

@end

@implementation DynamicCell

- (void)prepareForReuse {
    [super prepareForReuse];
    
    for (UIView *subview in self.contentView.subviews) {
        if (![subview isKindOfClass:DynamicItemView.class]) {
            continue;
        }
        DynamicItemView *itemView = (DynamicItemView *)subview;
        [itemView removeFromSuperview];
        [[_DynamicReusableItemViewQueue shareInstance] enqueueReusableItemView:itemView withIdentifier:NSStringFromClass(itemView.class)];
    }
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    NSArray *subviews = self.contentView.subviews.copy;
    subviews = [subviews sortedArrayUsingComparator:^NSComparisonResult(DynamicItemView * _Nonnull obj1, DynamicItemView * _Nonnull obj2) {
        NSUInteger obj1Postion = (NSUInteger)[obj1.class performSelector:@selector(position)];
        NSUInteger obj2Postion = (NSUInteger)[obj2.class performSelector:@selector(position)];
        return (obj1Postion > obj2Postion);
    }];
    
    CGFloat cellOffset = 0;
    CGFloat cellWidth = CGRectGetWidth(self.contentView.bounds);
    for (UIView *subView in subviews) {
        CGFloat subViewHeight = CGRectGetHeight(subView.bounds);
        subView.frame = CGRectMake(0, cellOffset, cellWidth, subViewHeight);
        cellOffset += subViewHeight;
    }
}

- (void)renderWithViewModel:(DynamicItemViewModel *)viewModel {
    self.backgroundColor = [UIColor whiteColor];
    
    for (DynamicItemViewModel *itemVM in viewModel.subItemViewModels) {
        Class itemViewClass = [DynamicItemViewFactory itemViewClassForItemViewModelClass:itemVM.class];
        DynamicItemView *itemView = [[_DynamicReusableItemViewQueue shareInstance] dequeueReusableItemViewWithIdentifier:NSStringFromClass(itemViewClass)];
        if (!itemView) {
            itemView = [DynamicItemViewFactory dynamicItemViewWithViewModel:itemVM];
        }

        [itemView setFrame:CGRectMake(0, 0, self.bounds.size.width, itemVM.height)];
        [itemView render:itemVM];
        [self.contentView addSubview:itemView];
    }
    
    [self setNeedsLayout];
}

@end
