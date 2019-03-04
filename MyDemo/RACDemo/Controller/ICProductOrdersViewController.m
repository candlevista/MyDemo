//
//  ICProductOrdersViewController.m
//  intochina-ios
//
//  Created by ClariS on 2018/12/6.
//  Copyright © 2018年 Wili. All rights reserved.
//

#import "ICProductOrdersViewController.h"
#import "ICOrdersBottomBar.h"
#import "ICOrdersTableViewCell.h"
#import "ICProductOrdersTableAdapter.h"
#import "ICProductOrdersModel.h"
#import "ICPickerView.h"
#import "ICOrdersCouponAlert.h"

@interface ICProductOrdersViewController () <ICProductOrdersTableAdapterDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) ICOrdersBottomBar *bottomBar;

@property (nonatomic, strong) ICProductOrdersTableAdapter *adapter;
@property (nonatomic, strong) ICProductOrdersModel *model;

@end

@implementation ICProductOrdersViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initSubviews];
    [self initBind];
}

- (void)viewSafeAreaInsetsDidChange {
    [super viewSafeAreaInsetsDidChange];
    [self.bottomBar mas_updateConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(-self.view.safeAreaInsets.bottom);
    }];
}

- (void)initSubviews {
    ICOrdersBottomBar *bottomBar = [[ICOrdersBottomBar alloc] init];
    [self.view addSubview:bottomBar];
    [bottomBar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.right.mas_equalTo(0);
        make.height.mas_equalTo([ICOrdersBottomBar height]);
    }];
    [bottomBar.doneBtn addTarget:self action:@selector(doneAction:) forControlEvents:UIControlEventTouchUpInside];
    self.bottomBar = bottomBar;
    
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.mas_equalTo(0);
        make.bottom.equalTo(bottomBar.mas_top);
    }];
}

- (void)initBind {
    RAC(self.bottomBar.amountLabel, attributedText) = RACObserve(self.model, amount);
    RAC(self.bottomBar.couponLabel, attributedText) = RACObserve(self.model, offAmount);
}

#pragma mark - action

- (void)doneAction:(id)sender {

}

#pragma mark - ICProductOrdersTableAdapter

- (void)adapterDidClickSelectTime:(ICProductOrdersTableAdapter *)adapter {
    [ICPickerView showDatePickerWithMinDate:self.model.minDate maxDate:nil dateMode:UIDatePickerModeTime title:@"" handle:^(NSDate *date) {
        self.model.time = date;
    }];
}

- (void)adapterDidClickSelectCoupon:(ICProductOrdersTableAdapter *)adapter {
    NSArray *datas = @[[ICMyCouponModel new]];
    [ICOrdersCouponAlert showWithDatas:datas doneHandle:^(NSInteger index) {
        ICMyCouponModel *model = datas[index];
        self.model.couponModel = model;
    }];
}

#pragma mark - set/get

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] init];
        _tableView.delegate = self.adapter;
        _tableView.dataSource = self.adapter;
        [_tableView registerClass:[ICOrdersInfoTableViewCell class] forCellReuseIdentifier:[ICOrdersInfoTableViewCell reuseIdentifier]];
        [_tableView registerClass:[ICOrdersTimeTableViewCell class] forCellReuseIdentifier:[ICOrdersTimeTableViewCell reuseIdentifier]];
        [_tableView registerClass:[ICOrdersSelectTableViewCell class] forCellReuseIdentifier:[ICOrdersSelectTableViewCell reuseIdentifier]];
        [_tableView registerClass:[ICOrdersCountTableViewCell class] forCellReuseIdentifier:[ICOrdersCountTableViewCell reuseIdentifier]];
        [_tableView registerClass:[ICOrdersInputTableViewCell class] forCellReuseIdentifier:[ICOrdersInputTableViewCell reuseIdentifier]];
        _tableView.separatorColor = [UIColor colorF1];
        _tableView.backgroundColor = [UIColor whiteColor];
    }
    return _tableView;
}

- (ICProductOrdersTableAdapter *)adapter {
    if (!_adapter) {
        _adapter = [[ICProductOrdersTableAdapter alloc] initWitModel:self.model];
        _adapter.delegate = self;
    }
    return _adapter;
}

- (ICProductOrdersModel *)model {
    if (!_model) {
        _model = [[ICProductOrdersModel alloc] init];
    }
    return _model;
}

@end
