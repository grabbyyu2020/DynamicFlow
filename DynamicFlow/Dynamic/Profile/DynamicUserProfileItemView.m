//
//  DynamicUserProfileItemView.m
//  DynamicFlow
//
//  Created by KaiJian Yu on 2022/7/1.
//

#import "DynamicUserProfileItemView.h"
#import "DynamicUserProfileItemViewModel.h"
#import "DynamicItemViewFactory.h"

@interface DynamicUserProfileItemView ()

@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *descLabel;

@end

@implementation DynamicUserProfileItemView

+ (NSUInteger)position {
    return 0;
}

+ (void)load {
    [DynamicItemViewFactory registerItemViewClass:[self class] withItemViewModelClass:[DynamicUserProfileItemViewModel class]];
}

- (instancetype)init {
    self = [super init];
    if (self) {
        [self addSubview:self.nameLabel];
        [self addSubview:self.descLabel];
    }
    return self;
}

- (void)render:(DynamicUserProfileItemViewModel *)viewModel {
    [super render:viewModel];
    
    self.nameLabel.text = viewModel.name;
    self.descLabel.text = viewModel.desc;
    [self setNeedsLayout];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    [self.nameLabel sizeToFit];
    self.nameLabel.frame = CGRectMake(20, 0, CGRectGetWidth(self.bounds)-40, CGRectGetHeight(self.nameLabel.bounds));

    [self.descLabel sizeToFit];
    self.descLabel.frame = CGRectMake(20, CGRectGetMaxY(self.nameLabel.frame)+5, CGRectGetWidth(self.bounds)-40, CGRectGetHeight(self.descLabel.bounds));
}

#pragma mark - Setter & Getter

- (UILabel *)nameLabel {
    if (_nameLabel) {
        return _nameLabel;
    }
    _nameLabel = [[UILabel alloc] init];
    [_nameLabel setFont:[UIFont systemFontOfSize:16]];
    [_nameLabel setTextColor:[UIColor blackColor]];
    return _nameLabel;
}

- (UILabel *)descLabel {
    if (_descLabel) {
        return _descLabel;
    }
    _descLabel = [[UILabel alloc] init];
    [_descLabel setFont:[UIFont systemFontOfSize:14]];
    [_descLabel setTextColor:[UIColor grayColor]];
    return _descLabel;
}

@end
