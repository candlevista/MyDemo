//
//  ICBlock.h
//  intochina-ios
//
//  Created by ClariS on 2018/11/28.
//  Copyright © 2018年 Wili. All rights reserved.
//

#ifndef ICBlock_h
#define ICBlock_h

typedef void(^ICIndexHandle)(NSInteger index);
typedef void(^ICVoidHandle)(void);
typedef void(^ICStringHandle)(NSString *text);
typedef void(^ICFloatHandle)(CGFloat value);
typedef void(^ICAnyHandle)(id value);

#endif /* ICBlock_h */
