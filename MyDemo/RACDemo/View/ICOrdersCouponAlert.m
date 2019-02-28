//
//  ICOrdersCouponAlert.m
//  intochina-ios
//
//  Created by ClariS on 2018/12/7.
//  Copyright © 2018年 Wili. All rights reserved.
//

#import "ICOrdersCouponAlert.h"
#import "ICDefaultDoneBtn.h"

#define kDefaultHeight 420*kScreenWidthRate

@interface ICOrdersCouponCell : UICollectionViewCell

@property (nonatomic, strong) UIImageView *bgImageView;
@property (nonatomic, strong) UILabel *leftTopLabel;
@property (nonatomic, strong) UILabel *leftBottomLabel;
@property (nonatomic, strong) UILabel *middleTopLabel;
@property (nonatomic, strong) UILabel *middleBottomLabel;
@property (nonatomic, strong) UILabel *rightLabel;

- (void)setModel:(ICMyCouponModel *)model;
+ (CGSize)cellSize;

@end

@implementation ICOrdersCouponCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self initSubviews];
    }
    return self;
}

- (void)initSubviews {
    self.contentView.backgroundColor = [UIColor whiteColor];
    
    UIImageView *bgImgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ic_product_coupon_nor"] highlightedImage:[UIImage imageNamed:@"ic_product_coupon_sel"]];
    [self.contentView addSubview:bgImgView];
    [bgImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.contentView);
    }];
    self.bgImageView = bgImgView;
    
    UILabel *leftTopLabel = [[UILabel alloc] init];
    [self.contentView addSubview:leftTopLabel];
    [leftTopLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(23*kScreenWidthRate);
        make.left.mas_equalTo(0);
        make.size.mas_equalTo(CGSizeMake(90*kScreenWidthRate, 23*kScreenWidthRate));
    }];
    leftTopLabel.textAlignment = NSTextAlignmentCenter;
    leftTopLabel.textColor = [UIColor redColor];
    leftTopLabel.font = ICBoldWithSize(24*kScreenWidthRate);
    self.leftTopLabel = leftTopLabel;
    
    UILabel *leftBottomLabel = [[UILabel alloc] init];
    [self.contentView addSubview:leftBottomLabel];
    [leftBottomLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(leftTopLabel.mas_bottom).offset(5*kScreenWidthRate);
        make.left.right.equalTo(leftTopLabel);
        make.height.mas_equalTo(10*kScreenWidthRate);
    }];
    leftBottomLabel.textAlignment = NSTextAlignmentCenter;
    leftBottomLabel.textColor = [UIColor colorD0352D];
    leftBottomLabel.font = ICFontWithSize(9*kScreenWidthRate);
    self.leftBottomLabel = leftBottomLabel;
    
    UILabel *middleTopLabel = [[UILabel alloc] init];
    [self.contentView addSubview:middleTopLabel];
    [middleTopLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(16*kScreenWidthRate);
        make.left.equalTo(leftTopLabel.mas_right).offset(15*kScreenWidthRate);
        make.height.mas_equalTo(15*kScreenWidthRate);
        make.right.mas_equalTo(-55*kScreenWidthRate);
    }];
    middleTopLabel.textColor = [UIColor color333];
    middleTopLabel.font = ICBoldWithSize(15*kScreenWidthRate);
    self.middleTopLabel = middleTopLabel;
    
    UILabel *middleBottomLabel = [[UILabel alloc] init];
    [self.contentView addSubview:middleBottomLabel];
    [middleBottomLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(middleTopLabel.mas_bottom).offset(7*kScreenWidthRate);
        make.left.right.equalTo(middleTopLabel);
        make.height.mas_equalTo(32*kScreenWidthRate);
    }];
    middleBottomLabel.numberOfLines = 0;
    middleBottomLabel.textColor = [UIColor color999];
    middleBottomLabel.font = ICFontWithSize(11*kScreenWidthRate);
    self.middleBottomLabel = middleBottomLabel;
    
    UILabel *rightLabel = [[UILabel alloc] init];
    [self.contentView addSubview:rightLabel];
    [rightLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.right.mas_equalTo(0);
        make.width.mas_equalTo(50*kScreenWidthRate);
    }];
    rightLabel.numberOfLines = 0;
    rightLabel.font = ICBoldWithSize(11*kScreenWidthRate);
    rightLabel.textColor = [UIColor colorFFB51F];
    rightLabel.textAlignment = NSTextAlignmentCenter;
    self.rightLabel = rightLabel;
}

- (void)setModel:(ICMyCouponModel *)model {
    self.leftTopLabel.text = model.showLeftTopText;
    self.leftBottomLabel.text = model.showLeftBottomText;
    self.middleTopLabel.text = model.showMiddleTopText;
    self.middleBottomLabel.text = model.showMiddleBottomText;
    self.rightLabel.text = model.showRightText;
    
    self.bgImageView.highlighted = !model.disable;
    self.userInteractionEnabled = !model.disable;
    
    UIColor *textColor = !model.disable ? [UIColor whiteColor] : [UIColor colorCCC];
    self.leftTopLabel.textColor = textColor;
    self.leftBottomLabel.textColor = textColor;
    self.middleTopLabel.textColor = textColor;
    self.middleBottomLabel.textColor = textColor;
    self.rightLabel.textColor = textColor;
}

+ (CGSize)cellSize {
    return CGSizeMake(335*kScreenWidthRate, 82*kScreenWidthRate);
}

@end



@interface ICOrdersCouponAlert () <UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, strong) UICollectionView *collection;
@property (nonatomic, strong) ICDefaultDoneBtn *doneBtn;

@property (nonatomic, strong) NSArray<ICMyCouponModel*> *datas;
@property (nonatomic, copy) ICIndexHandle doneHandle;

@end

@implementation ICOrdersCouponAlert

+ (instancetype)showWithDatas:(NSArray<ICMyCouponModel *> *)datas doneHandle:(ICIndexHandle)doneHandle {
    ICOrdersCouponAlert *alert = [[ICOrdersCouponAlert alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    alert.datas = datas;
    alert.doneHandle = doneHandle;
    [alert showAnimate:YES];
    return alert;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor colorWithWhite:0 alpha:0.4];
        UIView *bgView = [[UIView alloc] init];
        [self addSubview:bgView];
        [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.bottom.right.mas_equalTo(0);
            make.height.mas_equalTo(kDefaultHeight);
        }];
        bgView.backgroundColor = [UIColor whiteColor];
        UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, SCREEN_WIDTH, kDefaultHeight) byRoundingCorners:UIRectCornerTopLeft|UIRectCornerTopRight cornerRadii:CGSizeMake(6, 6)];
        CAShapeLayer *mask = [[CAShapeLayer alloc] init];
        mask.frame = CGRectMake(0, 0, SCREEN_WIDTH, kDefaultHeight);
        mask.path = path.CGPath;
        bgView.layer.mask = mask;
        
        [self initBgSubviews:bgView];
    }
    return self;
}

- (void)initBgSubviews:(UIView *)bgView {
    @weakify(self);
    
    UILabel *titleLabel = [[UILabel alloc] init];
    [bgView addSubview:titleLabel];
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(30*kScreenWidthRate);
        make.centerX.equalTo(bgView);
        make.height.mas_equalTo(19*kScreenWidthRate);
    }];
    titleLabel.textColor = [UIColor color333];
    titleLabel.font = ICMediumWithSize(19*kScreenWidthRate);
    titleLabel.text = @"优惠券";
    
    UIButton *closeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [bgView addSubview:closeBtn];
    [closeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(28*kScreenWidthRate, 28*kScreenWidthRate));
        make.right.mas_equalTo(-15*kScreenWidthRate);
        make.centerY.equalTo(titleLabel);
    }];
    [closeBtn setImage:[UIImage imageNamed:@"close_icon_18x18_ic_off_n_18x18"] forState:UIControlStateNormal];
    [closeBtn addBlockForControlEvents:UIControlEventTouchUpInside block:^(id  _Nonnull sender) {
        [weak_self dissmissAnimate:YES];
    }];
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    layout.sectionInset = UIEdgeInsetsMake(20*kScreenWidthRate, 20*kScreenWidthRate, 20*kScreenWidthRate, 20*kScreenWidthRate);
    layout.itemSize = [ICOrdersCouponCell cellSize];
    layout.minimumLineSpacing = 20*kScreenWidthRate;
    
    UICollectionView *collection = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
    [bgView addSubview:collection];
    [collection mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(closeBtn.mas_bottom);
        make.left.right.mas_equalTo(0);
        make.bottom.mas_equalTo(-20*kScreenWidthRate);
    }];
    collection.delegate = self;
    collection.dataSource = self;
    [collection registerClass:[ICOrdersCouponCell class] forCellWithReuseIdentifier:[ICOrdersCouponCell reuseIdentifier]];
    collection.backgroundColor = [UIColor whiteColor];
    self.collection = collection;
}

#pragma mark - collection

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.datas.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    ICOrdersCouponCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:[ICOrdersCouponCell reuseIdentifier] forIndexPath:indexPath];
    [cell setModel:self.datas[indexPath.row]];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if (self.doneHandle) {
        self.doneHandle(indexPath.row);
    }
    [self dissmissAnimate:YES];
}

- (void)showAnimate:(BOOL)animate {
    self.alpha = 0;
    UIView *showView;
    UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
    showView = keyWindow;
    [showView addSubview:self];
    
    if (animate) {
        [UIView animateWithDuration:0.3 animations:^{
            self.alpha = 1;
        }];
    } else {
        self.alpha = 1;
    }
}

- (void)dissmissAnimate:(BOOL)animate {
    if (!self.superview) {
        return;
    }
    
    if (animate) {
        [UIView animateWithDuration:0.3 animations:^{
            self.alpha = 0;
        } completion:^(BOOL finished) {
            [self removeFromSuperview];
        }];
    } else {
        [self removeFromSuperview];
    }
}

@end
