//
//  UITableViewCell+ICAddition.h
//  counselor
//
//  Created by ClariS on 2018/9/12.
//  Copyright © 2018年 wili. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableViewCell (ICAddition)

- (void)ic_listStyle;
+ (NSString*)reuseIdentifier;

@end


@interface UICollectionViewCell (ICAddition)

+ (NSString*)reuseIdentifier;

@end
