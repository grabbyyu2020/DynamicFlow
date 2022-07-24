//
//  DynamicInteractionItemView.m
//  DynamicFlow
//
//  Created by KaiJian Yu on 2022/7/1.
//

#import "DynamicInteractionItemView.h"
#import "DynamicInteractionItemViewModel.h"
#import "DynamicItemViewFactory.h"

@interface DynamicInteractionItemView ()

@property (nonatomic, strong) UIButton *likeButton;
@property (nonatomic, strong) UIButton *commentButton;
@property (nonatomic, strong) UIButton *forwardButton;

@end

@implementation DynamicInteractionItemView

+ (NSUInteger)position {
    return 150;
}

+ (void)load {
    [DynamicItemViewFactory registerItemViewClass:[self class] withItemViewModelClass:[DynamicInteractionItemViewModel class]];
}

- (instancetype)init {
    self = [super init];
    if (self) {
        [self addSubview:self.likeButton];
        [self addSubview:self.commentButton];
        [self addSubview:self.forwardButton];
    }
    return self;
}

- (void)render:(DynamicInteractionItemViewModel *)viewModel {
    [super render:viewModel];
    
    [self.likeButton setTitle:viewModel.likeButtonTitle forState:UIControlStateNormal];
    [self.commentButton setTitle:viewModel.commentButtonTitle forState:UIControlStateNormal];
    [self.forwardButton setTitle:viewModel.forwardButtonTitle forState:UIControlStateNormal];
    [self setNeedsLayout];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGFloat buttonWidth = CGRectGetWidth(self.bounds)/3;
    self.likeButton.frame = CGRectMake(0, 0, buttonWidth, CGRectGetHeight(self.bounds));
    self.commentButton.frame = CGRectMake(buttonWidth, 0, buttonWidth, CGRectGetHeight(self.bounds));
    self.forwardButton.frame = CGRectMake(buttonWidth*2, 0, buttonWidth, CGRectGetHeight(self.bounds));
}

#pragma mark - Setter & Getter

- (UIButton *)likeButton {
    if (_likeButton) {
        return _likeButton;
    }
    _likeButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_likeButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_likeButton.layer setBorderWidth:1.0f];
    return _likeButton;
}

- (UIButton *)commentButton {
    if (_commentButton) {
        return _commentButton;
    }
    _commentButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_commentButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_commentButton.layer setBorderWidth:1.0f];
    return _commentButton;
}

- (UIButton *)forwardButton {
    if (_forwardButton) {
        return _forwardButton;
    }
    _forwardButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_forwardButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_forwardButton.layer setBorderWidth:1.0f];
    return _forwardButton;
}
@end
