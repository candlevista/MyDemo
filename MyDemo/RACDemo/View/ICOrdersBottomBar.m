//
//  ICOrdersBottomBar.m
//  intochina-ios
//
//  Created by ClariS on 2018/12/7.
//  Copyright © 2018年 Wili. All rights reserved.
//

#import "ICOrdersBottomBar.h"

@implementation ICOrdersBottomBar

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self initSubviews];
    }
    return self;
}

- (void)initSubviews {
    self.backgroundColor = [UIColor blackColor];
    
    UIButton *doneBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self addSubview:doneBtn];
    [doneBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.right.mas_equalTo(0);
        make.width.mas_equalTo(120*kScreenWidthRate);
    }];
    [doneBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [doneBtn setBackgroundColor:[UIColor redColor]];
    doneBtn.titleLabel.font = ICBoldWithSize(15*kScreenWidthRate);
    [doneBtn setTitle:@"去支付" forState:UIControlStateNormal];
    self.doneBtn = doneBtn;
    
    UILabel *amountLabel = [[UILabel alloc] init];
    [self addSubview:amountLabel];
    [amountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.mas_equalTo(0);
        make.left.mas_equalTo(20*kScreenWidthRate);
    }];
    self.amountLabel = amountLabel;
    
    UILabel *couponLabel = [[UILabel alloc] init];
    [self addSubview:couponLabel];
    [couponLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.mas_equalTo(0);
        make.centerX.equalTo(self);
    }];
    couponLabel.textColor = [UIColor whiteColor];
    couponLabel.font = ICMediumWithSize(12*kScreenWidthRate);
    self.couponLabel = couponLabel;
}

+ (CGFloat)height {
    return 50*kScreenWidthRate;
}

@end
