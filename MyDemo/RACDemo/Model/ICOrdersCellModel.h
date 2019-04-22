//
//  ICOrdersModel.h
//  intochina-ios
//
//  Created by ClariS on 2018/12/7.
//  Copyright © 2018年 Wili. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ICMultipleCellProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface ICOrdersCellInfoModel : NSObject <ICMultipleCellModelProtocol>

@property (nonatomic, copy) NSString *title;            ///< 产品名
@property (nonatomic, copy) NSString *content;          ///< 产品描述
@property (nonatomic, copy) NSString *price;            ///< 价格
//@property (nonatomic, copy) NSString *selector;

@end



@interface ICOrdersCellTimeModel : NSObject <ICMultipleCellModelProtocol>

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *titleDescription;
@property (nonatomic, copy) NSString *selectTime;
@property (nonatomic, copy) NSString *selectTimeDescription;
@property (nonatomic, copy) NSString *selector;

@end



@interface ICOrdersCellSelectModel : NSObject <ICMultipleCellModelProtocol>

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSAttributedString *value;
@property (nonatomic, copy) NSString *selector;

@end



@interface ICOrdersCellCountModel : NSObject <ICMultipleCellModelProtocol>

@property (nonatomic, copy) NSString *title;
@property (nonatomic, assign) NSInteger count;
@property (nonatomic, assign) NSInteger minCount;               ///< 默认1
@property (nonatomic, assign) NSInteger maxCount;               ///< 为0时不判断
@property (nonatomic, strong) RACCommand *plusCommand;
@property (nonatomic, strong) RACCommand *minusCommand;
@property (nonatomic, copy) NSString *selector;

@end



@interface ICOrdersCellContactModel : NSObject <ICMultipleCellModelProtocol>

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *content;
@property (nonatomic, copy) NSString *selector;

@end



@interface ICOrdersCellInputModel : NSObject <ICMultipleCellModelProtocol>

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *content;
@property (nonatomic, copy) NSString *placeHolder;
@property (nonatomic, copy) NSString *selector;
@property (nonatomic, assign) CGFloat cellHeight;

@end

NS_ASSUME_NONNULL_END
