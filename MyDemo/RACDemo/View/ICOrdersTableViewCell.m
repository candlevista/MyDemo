//
//  ICOrdersTableViewCell.m
//  intochina-ios
//
//  Created by ClariS on 2018/12/6.
//  Copyright © 2018年 Wili. All rights reserved.
//

#import "ICOrdersTableViewCell.h"

@implementation ICOrdersInfoTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self initSubviews];
    }
    return self;
}

- (void)initSubviews {
    self.contentView.backgroundColor = [UIColor whiteColor];
    
    UILabel *titleLabel = [[UILabel alloc] init];
    [self.contentView addSubview:titleLabel];
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_offset(25*kScreenWidthRate);
        make.left.mas_equalTo(20*kScreenWidthRate);
        make.height.mas_equalTo(17*kScreenWidthRate);
    }];
    titleLabel.textColor = [UIColor color333];
    titleLabel.font = ICBoldWithSize(17*kScreenWidthRate);
    self.titleLabel = titleLabel;
    
    UILabel *contentLabel = [[UILabel alloc] init];
    [self.contentView addSubview:contentLabel];
    [contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(titleLabel.mas_bottom).offset(12*kScreenWidthRate);
        make.left.equalTo(titleLabel);
        make.height.mas_equalTo(12*kScreenWidthRate);
    }];
    contentLabel.textColor = [UIColor color999];
    contentLabel.font = ICFontWithSize(12*kScreenWidthRate);
    self.contentLabel = contentLabel;
    
    UILabel *priceLabel = [[UILabel alloc] init];
    [self.contentView addSubview:priceLabel];
    [priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(25*kScreenWidthRate);
        make.right.mas_equalTo(-20*kScreenWidthRate);
        make.height.mas_equalTo(21*kScreenWidthRate);
    }];
    priceLabel.textColor = [UIColor colorD0352D];
    priceLabel.font = ICDINWithSize(21*kScreenWidthRate);
    self.priceLabel = priceLabel;
}

- (void)setModel:(ICOrdersCellInfoModel *)model {
    _model = model;
    self.titleLabel.text = model.title;
    self.contentLabel.text = model.content;
    self.priceLabel.text = model.price;
}

@end



@implementation ICOrdersTimeTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self initSubviews];
        [self initBind];
    }
    return self;
}

- (void)initSubviews {
    self.contentView.backgroundColor = [UIColor whiteColor];
    
    UILabel *titleLabel = [[UILabel alloc] init];
    [self.contentView addSubview:titleLabel];
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(30*kScreenWidthRate);
        make.left.mas_equalTo(20*kScreenWidthRate);
        make.height.mas_equalTo(15*kScreenWidthRate);
    }];
    titleLabel.textColor = [UIColor color333];
    titleLabel.font = ICMediumWithSize(15*kScreenWidthRate);
    self.leftTopLabel = titleLabel;
    
    UILabel *leftBottomLabel = [[UILabel alloc] init];
    [self.contentView addSubview:leftBottomLabel];
    [leftBottomLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(titleLabel.mas_bottom).offset(10*kScreenWidthRate);
        make.left.equalTo(titleLabel);
        make.height.mas_equalTo(12*kScreenWidthRate);
    }];
    leftBottomLabel.textColor = [UIColor color999];
    leftBottomLabel.font = ICFontWithSize(12*kScreenWidthRate);
    self.leftBottomLabel = leftBottomLabel;
    
    UIImageView *arrow = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon_12x12_ic_more_g_12x12"]];
    [self.contentView addSubview:arrow];
    [arrow mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-30*kScreenWidthRate);
        make.centerY.equalTo(titleLabel);
        make.size.mas_equalTo(CGSizeMake(14, 12));
    }];
    
    UILabel *rightTopLabel = [[UILabel alloc] init];
    [self.contentView addSubview:rightTopLabel];
    [rightTopLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(arrow.mas_left).offset(-4*kScreenWidthRate);
        make.centerY.equalTo(titleLabel);
        make.height.mas_equalTo(13*kScreenWidthRate);
    }];
    rightTopLabel.font = ICBoldWithSize(13*kScreenWidthRate);
    rightTopLabel.textColor = [UIColor color333];
    self.rightTopLabel = rightTopLabel;
    
    UILabel *rightBottomLabel = [[UILabel alloc] init];
    [self.contentView addSubview:rightBottomLabel];
    [rightBottomLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(rightTopLabel.mas_bottom).offset(10*kScreenWidthRate);
        make.right.equalTo(rightTopLabel);
        make.height.mas_equalTo(12*kScreenWidthRate);
    }];
    rightBottomLabel.textColor = [UIColor color999];
    rightBottomLabel.font = ICFontWithSize(12*kScreenWidthRate);
    self.rightBottomLabel = rightBottomLabel;
}

- (void)initBind {
    RAC(self.rightTopLabel, text) = RACObserve(self, model.selectTime);
}

- (void)setModel:(ICOrdersCellTimeModel *)model {
    _model = model;
    self.leftTopLabel.text = model.title;
    self.leftBottomLabel.text = model.titleDescription;
}

@end



@implementation ICOrdersSelectTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self initSubviews];
        [self initBind];
    }
    return self;
}

- (void)initSubviews {
    self.contentView.backgroundColor = [UIColor whiteColor];
    
    UILabel *titleLabel = [[UILabel alloc] init];
    [self.contentView addSubview:titleLabel];
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(30*kScreenWidthRate);
        make.left.mas_equalTo(20*kScreenWidthRate);
        make.height.mas_equalTo(15*kScreenWidthRate);
    }];
    titleLabel.textColor = [UIColor color333];
    titleLabel.font = ICMediumWithSize(15*kScreenWidthRate);
    self.leftLabel = titleLabel;
    
    UIImageView *arrow = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon_12x12_ic_more_g_12x12"]];
    [self.contentView addSubview:arrow];
    [arrow mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-30*kScreenWidthRate);
        make.centerY.equalTo(titleLabel);
        make.size.mas_equalTo(CGSizeMake(14, 12));
    }];
    
    UILabel *rightTopLabel = [[UILabel alloc] init];
    [self.contentView addSubview:rightTopLabel];
    [rightTopLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(arrow.mas_left).offset(-4*kScreenWidthRate);
        make.centerY.equalTo(titleLabel);
        make.height.mas_equalTo(13*kScreenWidthRate);
    }];
    rightTopLabel.font = ICBoldWithSize(13*kScreenWidthRate);
    rightTopLabel.textColor = [UIColor color333];
    self.rightLabel = rightTopLabel;
}

- (void)initBind {
    RAC(self.rightLabel, attributedText) = RACObserve(self, model.value);
}

- (void)setModel:(ICOrdersCellSelectModel *)model {
    _model = model;
    self.leftLabel.text = model.title;
}

@end



@implementation ICOrdersCountTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self initSubviews];
        [self initBind];
    }
    return self;
}

- (void)initSubviews {
    self.contentView.backgroundColor = [UIColor whiteColor];
    
    UILabel *titleLabel = [[UILabel alloc] init];
    [self.contentView addSubview:titleLabel];
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(40*kScreenWidthRate);
        make.left.mas_equalTo(20*kScreenWidthRate);
        make.height.mas_equalTo(15*kScreenWidthRate);
    }];
    titleLabel.textColor = [UIColor color333];
    titleLabel.font = ICMediumWithSize(15*kScreenWidthRate);
    self.leftLabel = titleLabel;
    
    UIButton *plusBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.contentView addSubview:plusBtn];
    [plusBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-30*kScreenWidthRate);
        make.centerY.equalTo(titleLabel);
        make.size.mas_equalTo(CGSizeMake(40*kScreenWidthRate, 40*kScreenWidthRate));
    }];
    [plusBtn setImage:[UIImage imageNamed:@"ic_plus_b_14x14"] forState:UIControlStateNormal];
    plusBtn.layer.borderColor = [UIColor colorEB].CGColor;
    plusBtn.layer.borderWidth = 1;
    self.plusBtn = plusBtn;
    
    UILabel *countLabel = [[UILabel alloc] init];
    [self.contentView addSubview:countLabel];
    [countLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(plusBtn.mas_left).offset(1);
        make.centerY.equalTo(titleLabel);
        make.size.mas_equalTo(CGSizeMake(52*kScreenWidthRate, 40*kScreenWidthRate));
    }];
    countLabel.font = ICFontWithSize(17*kScreenWidthRate);
    countLabel.textColor  =[UIColor color333];
    countLabel.textAlignment = NSTextAlignmentCenter;
    countLabel.layer.borderWidth = 1;
    countLabel.layer.borderColor = [UIColor colorEB].CGColor;
    self.countLabel = countLabel;
    
    UIButton *minusBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.contentView addSubview:minusBtn];
    [minusBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(countLabel.mas_left).offset(1);
        make.centerY.equalTo(titleLabel);
        make.size.mas_equalTo(CGSizeMake(40*kScreenWidthRate, 40*kScreenWidthRate));
    }];
    [minusBtn setImage:[UIImage imageNamed:@"ic_minus_g_14x14"] forState:UIControlStateNormal];
    minusBtn.layer.borderColor = [UIColor colorEB].CGColor;
    minusBtn.layer.borderWidth = 1;
    self.minusBtn = minusBtn;
    
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, 40*kScreenWidthRate, 40*kScreenWidthRate) byRoundingCorners:UIRectCornerTopRight|UIRectCornerBottomRight cornerRadii:CGSizeMake(4, 4)];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = CGRectMake(0, 0, 40*kScreenWidthRate, 40*kScreenWidthRate);
    maskLayer.path = maskPath.CGPath;
    minusBtn.layer.mask = maskLayer;
    
    UIBezierPath *maskPath2 = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, 40*kScreenWidthRate, 40*kScreenWidthRate) byRoundingCorners:UIRectCornerTopLeft|UIRectCornerBottomLeft cornerRadii:CGSizeMake(4, 4)];
    CAShapeLayer *maskLayer2 = [[CAShapeLayer alloc] init];
    maskLayer2.frame = CGRectMake(0, 0, 40*kScreenWidthRate, 40*kScreenWidthRate);
    maskLayer2.path = maskPath2.CGPath;
    minusBtn.layer.mask = maskLayer2;
}

- (void)initBind {
    @weakify(self);
    RAC(self.countLabel, text) = [RACObserve(self, model.count) map:^id(NSNumber *value) {
        return value.stringValue;
    }];
    [RACObserve(self, model.count) subscribeNext:^(NSNumber *x) {
        @strongify(self);
        if (x.integerValue <= self.model.minCount) {
            [self.minusBtn setImage:[UIImage imageNamed:@"ic_minus_g_14x14"] forState:UIControlStateNormal];
        } else {
            [self.minusBtn setImage:[UIImage imageNamed:@"ic_minus_g_sel"] forState:UIControlStateNormal];
        }
        if (x.integerValue >= self.model.maxCount) {
            [self.plusBtn setImage:[UIImage imageNamed:@"ic_plus_b_nor"] forState:UIControlStateNormal];
        } else {
            [self.plusBtn setImage:[UIImage imageNamed:@"ic_plus_b_14x14"] forState:UIControlStateNormal];
        }
    }];
}

- (void)setModel:(ICOrdersCellCountModel *)model {
    _model = model;
    self.leftLabel.text = model.title;
    self.plusBtn.rac_command = model.plusCommand;
    self.minusBtn.rac_command = model.minusCommand;
}

@end



@implementation ICOrdersContactTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self initSubviews];
        [self initBind];
    }
    return self;
}

- (void)initSubviews {
    self.contentView.backgroundColor = [UIColor whiteColor];
    
    UILabel *topLabel = [[UILabel alloc] init];
    [self.contentView addSubview:topLabel];
    [topLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(30*kScreenWidthRate);
        make.left.mas_equalTo(20*kScreenWidthRate);
        make.height.mas_equalTo(15*kScreenWidthRate);
    }];
    topLabel.textColor = [UIColor color333];
    topLabel.font = ICBoldWithSize(15*kScreenWidthRate);
    self.topLabel = topLabel;
    
    UILabel *bottomLabel = [[UILabel alloc] init];
    [self.contentView addSubview:bottomLabel];
    [bottomLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(topLabel.mas_bottom).offset(10*kScreenWidthRate);
        make.left.height.with.equalTo(topLabel);
    }];
    bottomLabel.textColor = [UIColor color999];
    bottomLabel.font = ICFontWithSize(15*kScreenWidthRate);
    self.bottomLabel = bottomLabel;
    
    UIImageView *arrow = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon_12x12_ic_more_g_12x12"]];
    [self.contentView addSubview:arrow];
    [arrow mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-30*kScreenWidthRate);
        make.centerY.equalTo(topLabel);
        make.size.mas_equalTo(CGSizeMake(14, 14));
    }];
}

- (void)initBind {
    RAC(self.topLabel, text) = RACObserve(self, model.title);
    RAC(self.bottomLabel, text) = RACObserve(self, model.content);
}

@end



@implementation ICOrdersInputTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self initSubviews];
        [self initBind];
    }
    return self;
}

- (void)initSubviews {
    self.contentView.backgroundColor = [UIColor whiteColor];
    
    UILabel *titleLabel = [[UILabel alloc] init];
    [self.contentView addSubview:titleLabel];
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.mas_equalTo(20*kScreenWidthRate);
        make.height.mas_equalTo(15*kScreenWidthRate);
    }];
    titleLabel.font = ICMediumWithSize(15*kScreenWidthRate);
    titleLabel.textColor = [UIColor color333];
    self.titleLabel = titleLabel;
    
    UITextView *textView = [[UITextView alloc] initWithFrame:CGRectMake(0, 0, 334*kScreenWidthRate, 50)];
    [self.contentView addSubview:textView];
    [textView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(titleLabel.mas_bottom).offset(10*kScreenWidthRate);
        make.left.mas_equalTo(15*kScreenWidthRate);
        make.right.mas_equalTo(-20*kScreenWidthRate);
        make.bottom.mas_equalTo(-20*kScreenWidthRate);
    }];
    textView.font = ICFontWithSize(15*kScreenWidthRate);
    self.textView = textView;
}

- (void)initBind {
    RAC(self, model.content) = self.textView.rac_textSignal;
}

- (void)setModel:(ICOrdersCellInputModel *)model {
    _model = model;
    self.titleLabel.text = model.title;
}

@end
