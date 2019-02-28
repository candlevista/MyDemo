//
//  ICOrdersBottomBar.h
//  intochina-ios
//
//  Created by ClariS on 2018/12/7.
//  Copyright © 2018年 Wili. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ICOrdersBottomBar : UIView

@property (nonatomic, strong) UIButton *doneBtn;
@property (nonatomic, strong) UILabel *amountLabel;
@property (nonatomic, strong) UILabel *couponLabel;

+ (CGFloat)height;

@end

NS_ASSUME_NONNULL_END
