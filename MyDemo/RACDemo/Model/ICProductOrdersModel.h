//
//  ICProductOrdersModel.h
//  intochina-ios
//
//  Created by ClariS on 2018/12/7.
//  Copyright © 2018年 Wili. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ICMyCouponModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface ICProductOrdersModel : NSObject

@property (nonatomic, strong, nullable) ICMyCouponModel *couponModel;
@property (nonatomic, copy) NSString *productName;
@property (nonatomic, copy) NSString *productDescription;
@property (nonatomic, assign) CGFloat price;                        ///< 单价
@property (nonatomic, strong) NSDate *time;
@property (nonatomic, assign) NSInteger count;
@property (nonatomic, copy) NSString *remark;
@property (nonatomic, copy) NSString *measUnit;                     ///< 计量单位
@property (nonatomic, assign) NSInteger singleNum;                  ///< 单件数值
@property (nonatomic, assign) NSInteger limitOrder;                 ///< 商品订购上限
@property (nonatomic, assign) NSInteger minOrder;                   ///< 商品订购下限

@property (nonatomic, copy, readonly) NSString *showBookTime;
@property (nonatomic, copy, readonly) NSAttributedString *showCoupon;
@property (nonatomic, copy, readonly) NSAttributedString *amount;
@property (nonatomic, copy, readonly) NSAttributedString *offAmount;    ///< 优惠金额
@property (nonatomic, copy, readonly) NSString *showPrice;
@property (nonatomic, strong, readonly) NSDate *minDate;                ///< 最小可选时间

@end

NS_ASSUME_NONNULL_END
