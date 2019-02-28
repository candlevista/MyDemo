//
//  ICOrdersModel.m
//  intochina-ios
//
//  Created by ClariS on 2018/12/7.
//  Copyright © 2018年 Wili. All rights reserved.
//

#import "ICOrdersCellModel.h"
#import "ICOrdersTableViewCell.h"

@implementation ICOrdersCellInfoModel

- (NSString *)reuseIdentify {
    return [ICOrdersInfoTableViewCell reuseIdentifier];
}

- (CGFloat)cellHeight {
    if (self.content.length) {
        return 90*kScreenWidthRate;
    }
    return 67*kScreenWidthRate;
}

@end



@implementation ICOrdersCellTimeModel

- (NSString *)reuseIdentify {
    return [ICOrdersTimeTableViewCell reuseIdentifier];
}

- (CGFloat)cellHeight {
    return 86*kScreenWidthRate;
}

@end



@implementation ICOrdersCellSelectModel

- (NSString *)reuseIdentify {
    return [ICOrdersSelectTableViewCell reuseIdentifier];
}

- (CGFloat)cellHeight {
    return 65*kScreenWidthRate;
}

@end



@implementation ICOrdersCellCountModel

- (instancetype)init {
    if (self = [super init]) {
        _minCount = 1;
    }
    return self;
}

- (NSString *)reuseIdentify {
    return [ICOrdersCountTableViewCell reuseIdentifier];
}

- (CGFloat)cellHeight {
    return 90*kScreenWidthRate;
}

- (RACCommand *)plusCommand {
    if (!_plusCommand) {
        @weakify(self);
        _plusCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
            
            return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
                @strongify(self);
                if (self.maxCount && self.count >= self.maxCount) {
                    
                } else {
                    self.count++;
                }
                [subscriber sendNext:@(self.count)];
                [subscriber sendCompleted];
                return nil;
            }];
        }];
    }
    return _plusCommand;
}

- (RACCommand *)minusCommand {
    if (!_minusCommand) {
        @weakify(self);
        _minusCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
            
            return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
                @strongify(self);
                self.count--;
                if (self.count < self.minCount) {
                    self.count = self.minCount;
                }
                [subscriber sendNext:@(self.count)];
                [subscriber sendCompleted];
                return nil;
            }];
        }];
    }
    return _minusCommand;
}

@end



@implementation ICOrdersCellContactModel

- (NSString *)reuseIdentify {
    return [ICOrdersContactTableViewCell reuseIdentifier];
}

- (CGFloat)cellHeight {
    if (self.content.length) {
        return 90*kScreenWidthRate;
    }
    return 65*kScreenWidthRate;
}

@end



@implementation ICOrdersCellInputModel

- (NSString *)reuseIdentify {
    return [ICOrdersInputTableViewCell reuseIdentifier];
}

- (CGFloat)cellHeight {
    if (!_cellHeight) {
        return 200*kScreenWidthRate;
    }
    return _cellHeight;
}

@end
