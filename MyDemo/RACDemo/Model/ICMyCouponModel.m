//
//  ICMyCouponModel.m
//  intochina-ios
//
//  Created by ClariS on 2018/11/27.
//  Copyright © 2018年 Wili. All rights reserved.
//

#import "ICMyCouponModel.h"

@implementation ICMyCouponModel

- (instancetype)init {
    if (self = [super init]) {
        _disable = 0;
        _expireDate = @"2019-03-30";
        _name = @"通用优惠券";
        _reduceMoney = 5;
        _thresholdAmount = 5;
        _type = 1;
    }
    return self;
}

@end



@implementation ICMyCouponModel (Extra)

- (NSString *)showType {
    if (self.type == 0) {
        return @"折扣优惠券";
    } else {
        return @"满减优惠券";
    }
}

- (NSString *)showLeftTopText {
    if (self.type == 0) {
        return [NSString stringWithFormat:@"%ld折", self.discount];
    } else {
        return [NSString stringWithFormat:@"￥%.2f", self.reduceMoney];
    }
}

- (NSString *)showLeftBottomText {
    if (self.type == 0) {
        return [NSString stringWithFormat:@"折扣上限%.2f元", self.discountUpLimit];
    } else {
        return [NSString stringWithFormat:@"满%.2f可用", self.thresholdAmount];
    }
}

- (NSString *)showMiddleTopText {
    return self.name;
}

- (NSString *)showMiddleBottomText {
    return [NSString stringWithFormat:@"%@:%@\n%@:%@",
            @"优惠券类型",
            self.showType,
            @"有效期至",
            self.expireDate];
}

- (NSString *)showRightText {
    return @"立\n即\n使\n用";
}

@end
