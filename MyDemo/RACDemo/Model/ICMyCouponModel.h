//
//  ICMyCouponModel.h
//  intochina-ios
//
//  Created by ClariS on 2018/11/27.
//  Copyright © 2018年 Wili. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ICMyCouponModel : NSObject

@property (nonatomic, assign) BOOL disable;                 ///< 是否禁用：false：不禁用，true禁用
@property (nonatomic, assign) NSInteger coupon_id;          ///< 活动id
@property (nonatomic, assign) NSInteger discount;           ///< 折扣值，8折就返回8
@property (nonatomic, assign) CGFloat discountUpLimit;      ///< 折扣上限
@property (nonatomic, assign) NSInteger ID;                 ///< 优惠券id
@property (nonatomic, copy) NSString *name;                 ///< 活动名称
@property (nonatomic, assign) CGFloat reduceMoney;          ///< 减免额度，需要大于0
@property (nonatomic, assign) CGFloat thresholdAmount;      ///< 门槛金额
@property (nonatomic, assign) NSInteger type;               ///< 优惠券类型，0：折扣券，1：满减券
@property (nonatomic, copy) NSString *expireDate;           ///< 有效时间

@end



@interface ICMyCouponModel (Extra)

@property (nonatomic, copy, readonly) NSString *showType;
@property (nonatomic, copy, readonly) NSString *showLeftTopText;
@property (nonatomic, copy, readonly) NSString *showLeftBottomText;
@property (nonatomic, copy, readonly) NSString *showMiddleTopText;
@property (nonatomic, copy, readonly) NSString *showMiddleBottomText;
@property (nonatomic, copy, readonly) NSString *showRightText;

@end

NS_ASSUME_NONNULL_END
