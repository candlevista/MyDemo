//
//  ICDefaultDoneBtn.m
//  56finance
//
//  Created by ClariS on 2018/3/1.
//

#import "ICDefaultDoneBtn.h"

@interface ICDefaultDoneBtn () {
    UIColor *_defaultBgColor;
}
@property (nonatomic, assign) BOOL showGradient;
@property (nonatomic, strong) CAGradientLayer *gradientLayer;

@end

@implementation ICDefaultDoneBtn

+ (instancetype)defaultBtnWithTitle:(NSString *)title {
    ICDefaultDoneBtn *btn = [ICDefaultDoneBtn buttonWithType:UIButtonTypeSystem];
    [btn setDefaultType];
    [btn setTitle:title forState:UIControlStateNormal];
    return btn;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    [self setDefaultType];
}

- (void)setEnabled:(BOOL)enabled {
    [super setEnabled:enabled];
    if (enabled) {
        [self setBackgroundColor:self.defaultBgColor];
        if (self.showGradient) {
            [self.layer insertSublayer:self.gradientLayer below:self.titleLabel.layer];
        }
    } else {
        [self setBackgroundColor:[UIColor colorD7D7D7]];
        if (self.showGradient) {
            [self.gradientLayer removeFromSuperlayer];
        }
    }
}

- (void)setDefaultType {
    self.layer.cornerRadius = 4;
    [self setBackgroundColor:self.defaultBgColor];
    [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self setTitleColor:[UIColor whiteColor] forState:UIControlStateDisabled];
    [self.titleLabel setFont:ICMediumWithSize(14*kScreenWidthRate)];
}

- (void)setGradientFromColor:(UIColor *)fromColor toColor:(UIColor *)toColor size:(CGSize)size {
    self.gradientLayer.colors = @[(__bridge id)fromColor.CGColor, (__bridge id)toColor.CGColor];
    self.gradientLayer.frame = CGRectMake(0, 0, size.width, size.height);
    if (!self.gradientLayer.superlayer) {
        [self.layer insertSublayer:self.gradientLayer below:self.titleLabel.layer];
    }
    self.layer.masksToBounds = YES;
    self.showGradient = YES;
}

- (CAGradientLayer *)gradientLayer {
    if (!_gradientLayer) {
        _gradientLayer = [CAGradientLayer layer];
        _gradientLayer.locations = @[@0.2, @0.8];
        _gradientLayer.startPoint = CGPointMake(0, 0);
        _gradientLayer.endPoint = CGPointMake(1.0, 0);
    }
    return _gradientLayer;
}

- (UIColor *)defaultBgColor {
    if (!_defaultBgColor) {
        _defaultBgColor = [UIColor colorD0352D];
    }
    return _defaultBgColor;
}

- (void)setDefaultBgColor:(UIColor *)defaultBgColor {
    _defaultBgColor = defaultBgColor;
    self.enabled = self.enabled;
}

@end
