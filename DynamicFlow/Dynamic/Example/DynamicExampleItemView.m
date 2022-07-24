//
//  DynamicExampleItemView.m
//  DynamicFlow
//
//  Created by KaiJian Yu on 2022/7/1.
//

#import "DynamicExampleItemView.h"
#import "DynamicExampleItemViewModel.h"
#import "DynamicItemViewFactory.h"

@interface DynamicExampleItemView ()

@property (nonatomic, strong) UILabel *exampleLabel;

@end

@implementation DynamicExampleItemView

+ (NSUInteger)position {
    return 0;
}

+ (void)load {
    [DynamicItemViewFactory registerItemViewClass:[self class] withItemViewModelClass:[DynamicExampleItemViewModel class]];
}

- (instancetype)init {
    self = [super init];
    if (self) {
        [self addSubview:self.exampleLabel];
    }
    return self;
}

- (void)render:(DynamicExampleItemViewModel *)viewModel {
    [super render:viewModel];
    
    self.exampleLabel.text = viewModel.example;
    [self setNeedsLayout];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    [self.exampleLabel sizeToFit];
    self.exampleLabel.frame = CGRectMake(20, 0, CGRectGetWidth(self.bounds)-40, CGRectGetHeight(self.exampleLabel.bounds));
}

#pragma mark - Setter & Getter

- (UILabel *)exampleLabel {
    if (_exampleLabel) {
        return _exampleLabel;
    }
    _exampleLabel = [[UILabel alloc] init];
    [_exampleLabel setFont:[UIFont systemFontOfSize:16]];
    [_exampleLabel setTextColor:[UIColor blackColor]];
    return _exampleLabel;
}

@end
