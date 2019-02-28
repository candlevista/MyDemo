//
//  ICOrdersCouponAlert.h
//  intochina-ios
//
//  Created by ClariS on 2018/12/7.
//  Copyright © 2018年 Wili. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ICMyCouponModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface ICOrdersCouponAlert : UIView

+ (instancetype)showWithDatas:(NSArray <ICMyCouponModel*>*)datas doneHandle:(ICIndexHandle)doneHandle;

@end

NS_ASSUME_NONNULL_END
