//
//  ICProductOrdersModel.m
//  intochina-ios
//
//  Created by ClariS on 2018/12/7.
//  Copyright © 2018年 Wili. All rights reserved.
//

#import "ICProductOrdersModel.h"

@interface ICProductOrdersModel ()

@property (nonatomic, copy, readwrite) NSString *showBookTime;
@property (nonatomic, copy, readwrite) NSAttributedString *showCoupon;
@property (nonatomic, copy, readwrite) NSAttributedString *amount;
@property (nonatomic, copy, readwrite) NSAttributedString *offAmount;

@end

@implementation ICProductOrdersModel

- (instancetype)init {
    if (self = [super init]) {
        _productName = @"常规翻译";
        _productDescription = @"最低10分钟";
        _price = 12;
        _measUnit = @"min";
        _singleNum = 5;
        _limitOrder = 10;
        _minOrder = 2;

        @weakify(self);
        // 优惠打折订阅
        RAC(self, amount) = [RACSignal combineLatest:@[RACObserve(self, count), RACObserve(self, couponModel)] reduce:^id(NSNumber *count, ICMyCouponModel *coupon){
            @strongify(self);
            CGFloat amount = self.price*count.integerValue;
            if (coupon) {   // 有优惠券
                switch (coupon.type) {
                    case 0:     // 折扣券
                    {
                        CGFloat off = amount *(1-coupon.discount/10.0);
                        off = off > coupon.discountUpLimit ? coupon.discountUpLimit : off;
                        amount -= off;
                    }
                        break;
                    case 1:     // 满减券
                        amount -= coupon.reduceMoney;
                        amount = amount < 0 ? 0 : amount;
                        break;
                    default:
                        break;
                }
            }
            
            NSString *amountText = [NSString stringWithFormat:@"￥%.2f", amount];
            NSString *str = [NSString stringWithFormat:@"%@：%@", @"总价", amountText];
            return [[NSAttributedString alloc] initWithString:str attributes:@{NSForegroundColorAttributeName:[UIColor whiteColor], NSFontAttributeName:ICMediumWithSize(15*kScreenWidthRate)}];
        }];
        
        // 数量变动，优惠券能否使用订阅
        [RACObserve(self, count) subscribeNext:^(NSNumber *count) {
            @strongify(self);
            CGFloat amount = self.price*count.integerValue;
            if (self.couponModel) {   // 有优惠券
                switch (self.couponModel.type) {
                    case 1:     // 满减券
                        if (amount < self.couponModel.thresholdAmount) {
                            self.couponModel = nil;
                        }
                        break;
                    default:
                        break;
                }
            }
        }];
        
        RAC(self, showBookTime) = [RACObserve(self, time) map:^id(NSDate *value) {
            if (!value) {
                return @"请选择";
            }
            NSDateFormatter *format = [[NSDateFormatter alloc] init];
            format.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"];
            [format setDateFormat:@"a HH:mm"];
            return [format stringFromDate:value];
        }];
        
        RAC(self, showCoupon) = [RACObserve(self, couponModel) map:^id(ICMyCouponModel *value) {
            if (!value) {
                return [[NSAttributedString alloc] initWithString:@"请选择" attributes:@{NSFontAttributeName:ICMediumWithSize(13*kScreenWidthRate), NSForegroundColorAttributeName:[UIColor color333]}];
            }
            return [[NSAttributedString alloc] initWithString:value.name attributes:@{NSFontAttributeName:ICMediumWithSize(13*kScreenWidthRate), NSForegroundColorAttributeName:[UIColor color333]}];
        }];
        
        RAC(self, offAmount) = [RACSignal combineLatest:@[RACObserve(self, count), RACObserve(self, couponModel)] reduce:^id(NSNumber *count, ICMyCouponModel *coupon){
            @strongify(self);
            if (!coupon) {
                return [NSAttributedString new];
            } else {
                CGFloat amount = self.price*count.integerValue;
                CGFloat off = 0;
                switch (self.couponModel.type) {
                    case 0:     // 折扣券
                    {
                        off = amount *(1-coupon.discount/10.0);
                        off = off > coupon.discountUpLimit ? coupon.discountUpLimit : off;
                    }
                        break;
                    case 1:     // 满减券
                        off = coupon.reduceMoney;
                        break;
                    default:
                        break;
                }
                NSString *amountText = [NSString stringWithFormat:@"￥%.2f", off];
                NSString *str = [NSString stringWithFormat:@"%@：%@", @"已优惠", amountText];
                return [[NSAttributedString alloc] initWithString:str attributes:@{NSFontAttributeName:ICMediumWithSize(15*kScreenWidthRate), NSForegroundColorAttributeName:[UIColor whiteColor]}];
            }
        }];
    }
    return self;
}

- (NSString *)showPrice {
    return [NSString stringWithFormat:@"￥%.2f/%ld%@", self.price, (long)self.singleNum, self.measUnit];
}

- (NSDate *)minDate {
    return [NSDate dateWithTimeIntervalSinceNow:15*60];
}

@end
