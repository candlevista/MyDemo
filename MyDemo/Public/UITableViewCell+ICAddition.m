//
//  UITableViewCell+ICAddition.m
//  counselor
//
//  Created by ClariS on 2018/9/12.
//  Copyright © 2018年 wili. All rights reserved.
//

#import "UITableViewCell+ICAddition.h"

@implementation UITableViewCell (ICAddition)

- (void)ic_listStyle {
    self.layoutMargins = UIEdgeInsetsMake(0, 20*kScreenWidthRate, 0, 20*kScreenWidthRate);
}

+ (NSString*)reuseIdentifier{
    return NSStringFromClass([self class]);
}

@end

@implementation UICollectionViewCell (ICAddition)

+ (NSString*)reuseIdentifier{
    return NSStringFromClass([self class]);
}

@end
