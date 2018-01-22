//
//  XMActionSheet.h
//  ShareActionSheet
//
//  Created by Zhouxm on 2017/2/17.
//  Copyright © 2017年 Zhouxm. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^ButtonClickBlock)(int btnIndex);
typedef void(^CancelBlock)(void);

@interface XMActionSheet : UIWindow

- (instancetype)initWithTitles:(NSArray *)titles iconNames:(NSArray *)iconNames;

- (void)showActionSheetWithClickBlock:(ButtonClickBlock)btnClickBlock cancelBlock:(CancelBlock)cancelBlock;


@end
