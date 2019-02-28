//
//  ICOrdersTableViewCell.h
//  intochina-ios
//
//  Created by ClariS on 2018/12/6.
//  Copyright © 2018年 Wili. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ICMultipleCellProtocol.h"
#import "ICOrdersCellModel.h"

NS_ASSUME_NONNULL_BEGIN

@class ICPlaceholderTextView;

// 订单信息
@interface ICOrdersInfoTableViewCell : UITableViewCell <ICMultipleCellProtocol>

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *contentLabel;
@property (nonatomic, strong) UILabel *priceLabel;
@property (nonatomic, strong) ICOrdersCellInfoModel *model;

@end


// 选择时间
@interface ICOrdersTimeTableViewCell : UITableViewCell <ICMultipleCellProtocol>

@property (nonatomic, strong) UILabel *leftTopLabel;
@property (nonatomic, strong) UILabel *leftBottomLabel;
@property (nonatomic, strong) UILabel *rightTopLabel;
@property (nonatomic, strong) UILabel *rightBottomLabel;
@property (nonatomic, strong) ICOrdersCellTimeModel *model;

@end


// 普通选择
@interface ICOrdersSelectTableViewCell : UITableViewCell <ICMultipleCellProtocol>

@property (nonatomic, strong) UILabel *leftLabel;
@property (nonatomic, strong) UILabel *rightLabel;
@property (nonatomic, strong) ICOrdersCellSelectModel *model;

@end


// 加减数量
@interface ICOrdersCountTableViewCell : UITableViewCell <ICMultipleCellProtocol>

@property (nonatomic, strong) UILabel *leftLabel;
@property (nonatomic, strong) UIButton *minusBtn;
@property (nonatomic, strong) UIButton *plusBtn;
@property (nonatomic, strong) UILabel *countLabel;
@property (nonatomic, strong) ICOrdersCellCountModel *model;

@end


// 购买人
@interface ICOrdersContactTableViewCell : UITableViewCell <ICMultipleCellProtocol>

@property (nonatomic, strong) UILabel *topLabel;
@property (nonatomic, strong) UILabel *bottomLabel;
@property (nonatomic, strong) ICOrdersCellContactModel *model;

@end


// 输入框
@interface ICOrdersInputTableViewCell : UITableViewCell <ICMultipleCellProtocol>

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UITextView *textView;
@property (nonatomic, strong) ICOrdersCellInputModel *model;

@end

NS_ASSUME_NONNULL_END
