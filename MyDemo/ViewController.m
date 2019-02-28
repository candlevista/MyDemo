//
//  ViewController.m
//  MyDemo
//
//  Created by ClariS on 2019/2/28.
//  Copyright © 2019年 ClariS. All rights reserved.
//

#import "ViewController.h"
#import "ICProductOrdersViewController.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, copy) NSArray *datas;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initSubviews];
}

- (void)initSubviews {
    UITableView *tableView = [[UITableView alloc] init];
    [self.view addSubview:tableView];
    [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    tableView.delegate = self;
    tableView.dataSource = self;
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:[UITableViewCell reuseIdentifier]];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.datas.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[UITableViewCell reuseIdentifier] forIndexPath:indexPath];
    NSDictionary *dic = self.datas[indexPath.row];
    cell.textLabel.text = dic[@"title"];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 44;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSDictionary *dic = self.datas[indexPath.row];
    NSString *selector = dic[@"selector"];
    if (selector.length) {
        SEL sel = NSSelectorFromString(selector);
        [self performSelector:sel];
    }
}

#pragma mark - push

- (void)toRACDemo {
    ICProductOrdersViewController *vc = [ICProductOrdersViewController new];
    [self.navigationController pushViewController:vc animated:YES];
}

- (NSArray *)datas {
    if (!_datas) {
        _datas = @[@{@"title":@"RACDemo", @"selector":@"toRACDemo"}];
    }
    return _datas;
}

@end
