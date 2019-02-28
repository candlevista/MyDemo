//
//  ICProductOrdersTableAdapter.h
//  intochina-ios
//
//  Created by ClariS on 2018/12/7.
//  Copyright © 2018年 Wili. All rights reserved.
//

#import "ICProductOrdersModel.h"

NS_ASSUME_NONNULL_BEGIN

@class ICProductOrdersTableAdapter;
@protocol ICProductOrdersTableAdapterDelegate <NSObject>

@optional
- (void)adapterDidClickSelectTime:(ICProductOrdersTableAdapter *)adapter;           ///< 选择时间
- (void)adapterDidClickSelectCoupon:(ICProductOrdersTableAdapter *)adapter;         ///< 选择优惠券

@end



@interface ICProductOrdersTableAdapter : NSObject <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSMutableArray *datas;
@property (nonatomic, strong) ICProductOrdersModel *model;
@property (nonatomic, weak) id <ICProductOrdersTableAdapterDelegate>delegate;

- (instancetype)initWitModel:(ICProductOrdersModel *)model;

@end

NS_ASSUME_NONNULL_END
