//
//  DynamicTextContentItemView.m
//  DynamicFlow
//
//  Created by KaiJian Yu on 2022/7/1.
//

#import "DynamicTextContentItemView.h"
#import "DynamicTextContentItemViewModel.h"
#import "DynamicItemViewFactory.h"

@interface DynamicTextContentItemView ()

@property (nonatomic, strong) UILabel *textContentLabel;

@end

@implementation DynamicTextContentItemView

+ (NSUInteger)position {
    return 50;
}

+ (void)load {
    [DynamicItemViewFactory registerItemViewClass:[self class] withItemViewModelClass:[DynamicTextContentItemViewModel class]];
}

- (instancetype)init {
    self = [super init];
    if (self) {
        [self addSubview:self.textContentLabel];
    }
    return self;
}

- (void)render:(DynamicTextContentItemViewModel *)viewModel {
    [super render:viewModel];
    
    self.textContentLabel.text = viewModel.textContent;
    [self setNeedsLayout];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    [self.textContentLabel sizeToFit];
    self.textContentLabel.frame = CGRectMake(20, 0, CGRectGetWidth(self.bounds)-40, CGRectGetHeight(self.textContentLabel.bounds));
}

#pragma mark - Setter & Getter

- (UILabel *)textContentLabel {
    if (_textContentLabel) {
        return _textContentLabel;
    }
    _textContentLabel = [[UILabel alloc] init];
    [_textContentLabel setFont:[UIFont systemFontOfSize:16]];
    [_textContentLabel setTextColor:[UIColor blackColor]];
    return _textContentLabel;
}

@end
