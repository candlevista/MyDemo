//
//  ICProductOrdersTableAdapter.m
//  intochina-ios
//
//  Created by ClariS on 2018/12/7.
//  Copyright © 2018年 Wili. All rights reserved.
//

#import "ICProductOrdersTableAdapter.h"
#import "ICOrdersCellModel.h"
#import "ICOrdersTableViewCell.h"
#import "ICMultipleCellProtocol.h"

@implementation ICProductOrdersTableAdapter

- (instancetype)initWitModel:(ICProductOrdersModel *)model {
    if (self = [super init]) {
        _datas = [NSMutableArray array];
        _model = model;
        [self initDatasAndBind];
    }
    return self;
}

- (void)initDatasAndBind {
    ICOrdersCellInfoModel *info = [[ICOrdersCellInfoModel alloc] init];
    info.title = self.model.productName;
    info.content = @"最低10分钟";
    info.price = self.model.showPrice;
    
    ICOrdersCellTimeModel *time = [[ICOrdersCellTimeModel alloc] init];
    time.title = @"预约时间";
    time.titleDescription = @"最少提前15分钟预约哦";
    time.selector = @"toSelectTime";
    
    ICOrdersCellSelectModel *select = [[ICOrdersCellSelectModel alloc] init];
    select.title = @"优惠券";
    select.selector = @"toCoupon";
    
    ICOrdersCellCountModel *count = [[ICOrdersCellCountModel alloc] init];
    count.title = @"数量";
    count.count = self.model.minOrder;
    count.minCount = self.model.minOrder;
    count.maxCount = self.model.limitOrder;
    
    ICOrdersCellInputModel *input = [[ICOrdersCellInputModel alloc] init];
    input.title = @"服务备注";
    input.content = self.model.remark;
    input.placeHolder = @"请输入备注（选填）";
    
    RAC(time, selectTime) = RACObserve(self.model, showBookTime);
    RAC(select, value) = RACObserve(self.model, showCoupon);
    RAC(self.model, count) = RACObserve(count, count);
    RAC(self.model, remark) = RACObserve(input, content);
    
    [self.datas addObject:@[info]];
    [self.datas addObject:@[time, select, count]];
    [self.datas addObject:@[input]];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.datas.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSArray *ary = self.datas[section];
    return ary.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSArray *ary = self.datas[indexPath.section];
    id <ICMultipleCellModelProtocol>model = ary[indexPath.row];
    UITableViewCell <ICMultipleCellProtocol>*cell = [tableView dequeueReusableCellWithIdentifier:model.reuseIdentify forIndexPath:indexPath];
    [cell setModel:model];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSArray *ary = self.datas[indexPath.section];
    id <ICMultipleCellModelProtocol>model = ary[indexPath.row];
    return model.cellHeight;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSArray *ary = self.datas[indexPath.section];
    id <ICMultipleCellModelProtocol>model = ary[indexPath.row];
    if ([model respondsToSelector:@selector(selector)] && model.selector.length) {
        SEL selector = NSSelectorFromString(model.selector);
        [self performSelector:selector];
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    static NSString *footId = @"footId";
    UITableViewHeaderFooterView *footer = [tableView dequeueReusableHeaderFooterViewWithIdentifier:footId];
    if (!footer) {
        footer = [[UITableViewHeaderFooterView alloc] initWithReuseIdentifier:footId];
        footer.contentView.backgroundColor = [UIColor color999];
    }
    return footer;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 10*kScreenWidthRate;
}

- (void)toSelectTime {
    if ([self.delegate respondsToSelector:@selector(adapterDidClickSelectTime:)]) {
        [self.delegate adapterDidClickSelectTime:self];
    }
}

- (void)toCoupon {
    if ([self.delegate respondsToSelector:@selector(adapterDidClickSelectCoupon:)]) {
        [self.delegate adapterDidClickSelectCoupon:self];
    }
}

@end
