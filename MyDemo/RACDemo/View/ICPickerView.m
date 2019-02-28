//
//  ICPickerView.m
//  park
//
//  Created by ClariS on 2017/10/16.
//  Copyright © 2017年 Wili. All rights reserved.
//

#import "ICPickerView.h"

#define DEFAULT_HEIGHT 260

typedef NS_ENUM(NSUInteger, ICPickerType) {
    NormalType,             ///< 自定义picker
    SingleType,             ///< 单列表picker
    DateType,               ///< 日期picker
};

@interface ICPickerView ()<UIPickerViewDelegate, UIPickerViewDataSource>
{
    UIView *_bgView;
    
    NSArray *_infoAry;
    ICPickerType _type;
    NSMutableDictionary *_mDic;
}
@property (nonatomic, strong) UIDatePicker *datePicker;
@property (nonatomic, strong) UIPickerView *pickerView;
@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, copy) ICDateHandle dateHandle;
@property (nonatomic, copy) NSArray *singleDatas;
@property (nonatomic, copy) ICIndexHandle singleHandle;
@property (nonatomic, assign) NSInteger singleSelectedIndex;

@end

@implementation ICPickerView

+ (instancetype)showWithDatas:(NSArray<NSString *> *)datas title:(NSString *)title handle:(ICIndexHandle)handle {
    ICPickerView *pickerView = [[ICPickerView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) pickerType:SingleType];
    pickerView.singleDatas = datas;
    pickerView.pickerView.delegate = pickerView;
    pickerView.pickerView.dataSource = pickerView;
    pickerView.singleHandle = handle;
    pickerView.titleLabel.text = title;
    [pickerView show];
    return pickerView;
}

+ (instancetype)showWithDelegate:(id<ICPickerViewDelegate>)delegate title:(NSString *)title {
    ICPickerView *pickerView = [[ICPickerView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) pickerType:NormalType];
    pickerView.delegate = delegate;
    pickerView.titleLabel.text = title;
    pickerView.pickerView.delegate = pickerView;
    pickerView.pickerView.dataSource = pickerView;
    [pickerView show];
    return pickerView;
}

+ (instancetype)showDatePickerWithMinDate:(NSDate *)minDate maxDate:(NSDate *)maxDate dateMode:(UIDatePickerMode)mode title:(NSString *)title handle:(ICDateHandle)handle {
    ICPickerView *pickerView = [[ICPickerView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) pickerType:DateType];
    pickerView.datePicker.minimumDate = minDate;
    pickerView.datePicker.maximumDate = maxDate;
    pickerView.datePicker.datePickerMode = mode;
    pickerView.titleLabel.text = title;
    pickerView.dateHandle = handle;
    [pickerView show];
    return pickerView;
}

- (instancetype)initWithFrame:(CGRect)frame pickerType:(ICPickerType)type {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.4];
        [self initSubViewsWithType:type];
        _type = type;
    }
    return self;
}

- (void)initData {
    _mDic = [NSMutableDictionary dictionary];
    NSInteger components = [self.delegate numberOfComponentsInPickerView:self];
    for (NSInteger i = 0; i < components; i++) {
        [_mDic setObject:@0 forKey:@(i)];
    }
}

- (void)initSubViewsWithType:(ICPickerType)type {
    self.alpha = 0;
    _bgView = [[UIView alloc] initWithFrame:CGRectMake(0, SCREEN_HEIGHT, SCREEN_WIDTH, DEFAULT_HEIGHT)];
    _bgView.backgroundColor = [UIColor whiteColor];
    [self addSubview:_bgView];
    
    UIView *headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.width, 45)];
    headView.backgroundColor = [UIColor whiteColor];
    [_bgView addSubview:headView];
    
    for (int i = 0;i<2;i++) {
        UIButton *item = [[UIButton alloc] initWithFrame:CGRectMake(10, 0, 45, 45)];
        [item setTitle:@"取消" forState:UIControlStateNormal];
        item.tag = 100+i;
        item.adjustsImageWhenHighlighted = false;
        item.adjustsImageWhenDisabled = false;
        item.titleLabel.font = ICMediumWithSize(15*kScreenWidthRate);
        [item setTitleColor:[UIColor color666] forState:UIControlStateNormal];
        [item addTarget:self action:@selector(finishClick:) forControlEvents:UIControlEventTouchUpInside];
        if(i==1){
            [item setTitleColor:[UIColor colorD0352D] forState:UIControlStateNormal];
            [item setTitle:@"确定" forState:UIControlStateNormal];
            item.left = headView.width - 50;
            item.titleLabel.font = ICBoldWithSize(15*kScreenWidthRate);
        }
        [headView addSubview:item];
    }
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(55, 0, headView.width-110, 45)];
    [headView addSubview:titleLabel];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.textColor = [UIColor color333];
    self.titleLabel = titleLabel;
    
    switch (type) {
        case NormalType:
        case SingleType:
        {
            _pickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 46, self.width, _bgView.height-45)];
            _pickerView.backgroundColor = [UIColor colorF5];
            [_bgView addSubview:_pickerView];
            
            UIView *topLine = [[UIView alloc] initWithFrame:CGRectMake(0, _pickerView.height/2-20, _pickerView.width, 0.5)];
            topLine.backgroundColor = [UIColor color67];
            [_pickerView addSubview:topLine];

            UIView *bottomLine = [[UIView alloc] initWithFrame:CGRectMake(0, _pickerView.height/2+20, _pickerView.width, 0.5)];
            bottomLine.backgroundColor = [UIColor color67];
            [_pickerView addSubview:bottomLine];
        }
            break;
        case DateType:
        {
            _datePicker = [[UIDatePicker alloc] initWithFrame:CGRectMake(0, 46, self.width, _bgView.height-45)];
            _datePicker.backgroundColor = [UIColor whiteColor];
            _datePicker.locale = [NSLocale localeWithLocaleIdentifier:@"zh"];
            [_bgView addSubview:_datePicker];
        }
            break;
        default:
            break;
    }
}

- (void)show {
    UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
    [keyWindow addSubview:self];
    @weakify(self);
    [UIView animateWithDuration:0.3 animations:^{
        weak_self.alpha = 1;
        _bgView.frame = CGRectMake(0, SCREEN_HEIGHT-DEFAULT_HEIGHT, SCREEN_WIDTH, DEFAULT_HEIGHT);
    }];
}

- (void)hide {
    @weakify(self);
    [UIView animateWithDuration:0.3 animations:^{
        weak_self.alpha = 0;
        _bgView.frame = CGRectMake(0, SCREEN_HEIGHT, SCREEN_WIDTH, DEFAULT_HEIGHT);
    } completion:^(BOOL finished) {
        [weak_self removeFromSuperview];
    }];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    //相对UIWindows位置
    CGPoint point = [touches.anyObject locationInView:nil];
    if (point.y < (SCREEN_HEIGHT-DEFAULT_HEIGHT)) {
        [self hide];
    }
    [super touchesBegan:touches withEvent:event];
}

#pragma mark - action

- (void)finishClick:(UIButton *)sender{
    [self hide];
    if (sender.tag == 101) {
        switch (_type) {
            case NormalType:
            {
                if ([self.delegate respondsToSelector:@selector(pickerView:didSelectICPickerViewDictionary:)]) {
                    [self.delegate pickerView:self didSelectICPickerViewDictionary:_mDic];
                }
            }
                break;
            case DateType:
            {
                if (self.dateHandle) {
                    self.dateHandle(self.datePicker.date);
                }
            }
                break;
            case SingleType:
            {
                if (self.singleHandle) {
                    self.singleHandle(self.singleSelectedIndex);
                }
            }
                break;
            default:
                break;
        }
        
    }
}

#pragma mark - delegate

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    if (_type == SingleType) {
        return 1;
    } else {
        return [self.delegate numberOfComponentsInPickerView:self];
    }
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    if (_type == SingleType) {
        return self.singleDatas.count;
    } else {
        return [self.delegate pickerView:self numberOfRowsInComponent:component];
    }
}

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(nullable UIView *)view {
    UILabel *label;
    if (!view) {
        label = [[UILabel alloc] init];
        label.textAlignment = NSTextAlignmentCenter;
        label.adjustsFontSizeToFitWidth = YES;
        label.font = ICBoldWithSize(15);
    } else {
        label = (UILabel *)view;
    }
    
    if (_type == SingleType) {
        label.text = self.singleDatas[row];
    } else {
        label.text = [self.delegate pickerView:self titleForRow:row forComponent:component];
    }
    
    return label;
}

- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component {
    if (_type == SingleType) {
        return SCREEN_WIDTH;
    } else {
        if ([self.delegate respondsToSelector:@selector(pickerView:widthForComponent:)]) {
            return [self.delegate pickerView:self widthForComponent:component];
        } else {
            return pickerView.width/[self.delegate numberOfComponentsInPickerView:self];
        }
    }
}

- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component {
    return 37*kScreenWidthRate;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    if (_type == SingleType) {
        self.singleSelectedIndex = row;
    } else {
        [_mDic setObject:@(row) forKey:@(component)];
    }
}

- (void)setDelegate:(id<ICPickerViewDelegate>)delegate {
    _delegate = delegate;
    [self initData];
}

@end
