//
//  DynamicImageContentItemView.m
//  DynamicFlow
//
//  Created by KaiJian Yu on 2022/7/1.
//

#import "DynamicImageContentItemView.h"
#import "DynamicImageContentItemViewModel.h"
#import "DynamicItemViewFactory.h"

@interface DynamicImageContentItemView ()

@property (nonatomic, strong) UIImageView *imageContentImageView;

@end

@implementation DynamicImageContentItemView

+ (NSUInteger)position {
    return 100;
}

+ (void)load {
    [DynamicItemViewFactory registerItemViewClass:[self class] withItemViewModelClass:[DynamicImageContentItemViewModel class]];
}

- (instancetype)init {
    self = [super init];
    if (self) {
        [self addSubview:self.imageContentImageView];
    }
    return self;
}

- (void)render:(DynamicImageContentItemViewModel *)viewModel {
    [super render:viewModel];
    self.imageContentImageView.image = [UIImage imageWithContentsOfFile:viewModel.imageContentURL];
    [self setNeedsLayout];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.imageContentImageView.frame = CGRectMake(20, 0, 100, 100);
}

#pragma mark - Setter & Getter

- (UIImageView *)imageContentImageView {
    if (_imageContentImageView) {
        return _imageContentImageView;
    }
    _imageContentImageView = [[UIImageView alloc] init];
    _imageContentImageView.backgroundColor = [UIColor grayColor];
    return _imageContentImageView;
}

@end
