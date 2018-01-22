//
//  XMActionSheetItem.h
//  ShareActionSheet
//
//  Created by Zhouxm on 2017/2/17.
//  Copyright © 2017年 Zhouxm. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XMActionSheetItem : UIButton

@property (nonatomic, assign)int btnIndex;

- (void)setTitle:(NSString *)title withImage:(UIImage *)image;

@end
