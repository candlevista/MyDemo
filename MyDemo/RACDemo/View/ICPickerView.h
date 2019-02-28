//
//  ICPickerView.h
//  park
//
//  Created by ClariS on 2017/10/16.
//  Copyright © 2017年 Wili. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ICPickerView;
@protocol ICPickerViewDelegate <NSObject>

@required
- (NSInteger)numberOfComponentsInPickerView:(ICPickerView *)view;
- (NSInteger)pickerView:(ICPickerView *)view numberOfRowsInComponent:(NSInteger)component;
- (NSString *)pickerView:(ICPickerView *)view titleForRow:(NSInteger)row forComponent:(NSInteger)component;

@optional
/**
 @param dic @{列:行}
 */
- (void)pickerView:(ICPickerView *)view didSelectICPickerViewDictionary:(NSDictionary *)dic;
/** cell宽度 */
- (CGFloat)pickerView:(ICPickerView *)view widthForComponent:(NSInteger)component;

@end


typedef void(^ICDateHandle)(NSDate *date);
@interface ICPickerView : UIView

@property (weak,nonatomic)id<ICPickerViewDelegate> delegate;

/**
 弹出单列表picker
 */
+ (instancetype)showWithDatas:(NSArray<NSString*> *)datas title:(NSString *)title handle:(ICIndexHandle)handle;

/**
 弹出pickerview
 */
+ (instancetype)showWithDelegate:(id<ICPickerViewDelegate>)delegate title:(NSString *)title;

/**
 弹出datepicker
 */
+ (instancetype)showDatePickerWithMinDate:(NSDate *)minDate maxDate:(NSDate *)maxDate dateMode:(UIDatePickerMode)mode title:(NSString *)title handle:(ICDateHandle)handle;

@end
