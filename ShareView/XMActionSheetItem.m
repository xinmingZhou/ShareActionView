//
//  XMActionSheetItem.m
//  ShareActionSheet
//
//  Created by Zhouxm on 2017/2/17.
//  Copyright © 2017年 Zhouxm. All rights reserved.
//

#import "XMActionSheetItem.h"

@implementation XMActionSheetItem

- (CGRect)titleRectForContentRect:(CGRect)contentRect {
    CGRect titleRect = CGRectMake(5, CGRectGetHeight(self.bounds) - 15, CGRectGetWidth(self.bounds)- 10, 21);
    return titleRect;
}
- (CGRect)imageRectForContentRect:(CGRect)contentRect {
    CGRect imageRect = self.bounds;
    imageRect.size.height = CGRectGetWidth(self.bounds);
    return imageRect;
}


- (void)setTitle:(NSString *)title withImage:(UIImage *)image {
    
    [self setTitle:title forState:UIControlStateNormal];
    self.titleLabel.numberOfLines = 2;
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.titleLabel.font = [UIFont systemFontOfSize:12.0f];
    [self setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    [self setImage:image forState:UIControlStateNormal];
    
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
