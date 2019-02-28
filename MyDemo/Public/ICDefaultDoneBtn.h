//
//  ICDefaultDoneBtn.h
//  56finance
//
//  Created by ClariS on 2018/3/1.
//

#import <UIKit/UIKit.h>

@interface ICDefaultDoneBtn : UIButton

@property (nonatomic, strong) UIColor *defaultBgColor;

+ (instancetype)defaultBtnWithTitle:(NSString *)title;

/**
 设置渐变背景

 @param fromColor 起始颜色
 @param toColor 结束颜色
 @param size btn大小
 */
- (void)setGradientFromColor:(UIColor *)fromColor toColor:(UIColor *)toColor size:(CGSize)size;

@end
