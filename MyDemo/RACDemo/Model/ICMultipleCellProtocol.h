//
//  ICMultipleCellProtocol.h
//  counselor
//
//  Created by ClariS on 2018/9/27.
//  Copyright © 2018年 wili. All rights reserved.
//  一个tableview中注册了多种样式的cell时可用此协议进行约束

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
// model实现的协议
@protocol ICMultipleCellModelProtocol <NSObject>

@required
@property (nonatomic, copy, readonly) NSString *reuseIdentify;
@property (nonatomic, assign, readonly) CGFloat cellHeight;
@optional
@property (nonatomic, copy) NSString *selector;

@end


// cell实现的协议
@protocol ICMultipleCellProtocol <NSObject>

@required
- (void)setModel:(id)model;

@end

NS_ASSUME_NONNULL_END
