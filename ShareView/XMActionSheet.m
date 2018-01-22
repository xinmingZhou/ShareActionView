//
//  XMActionSheet.m
//  ShareActionSheet
//
//  Created by Zhouxm on 2017/2/17.
//  Copyright © 2017年 Zhouxm. All rights reserved.
//

#import "XMActionSheet.h"
#import "XMActionSheetItem.h"

@interface XMActionSheet ()

@property (nonatomic, strong) ButtonClickBlock clickBlock;
@property (nonatomic, strong) CancelBlock cancelBlock;

@property (nonatomic, strong) UIView *backgroundMask;//背景遮罩
@property (nonatomic, strong) UIView *contentView;

@property (nonatomic, retain) UIScrollView *scrollView;

@end

@implementation XMActionSheet

static XMActionSheet *sheet = nil;

- (instancetype)initWithTitles:(NSArray *)titles iconNames:(NSArray *)iconNames {
    self = [self initWithFrame:[UIScreen mainScreen].bounds];
    
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        self.autoresizingMask = UIViewAutoresizingFlexibleWidth |UIViewAutoresizingFlexibleHeight;
        
        self.backgroundMask = [[UIView alloc]initWithFrame:self.bounds];
        self.backgroundMask.autoresizingMask = UIViewAutoresizingFlexibleHeight |UIViewAutoresizingFlexibleWidth;
        self.backgroundMask.backgroundColor = [UIColor blackColor];
        self.backgroundMask.alpha = 0;
        [self addSubview:self.backgroundMask];
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismiss)];
        [self.backgroundMask addGestureRecognizer:tap];
        
        self.contentView = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetHeight(self.bounds), CGRectGetWidth(self.bounds), CGRectGetHeight(self.bounds))];
        self.contentView.backgroundColor = [UIColor clearColor];
        self.contentView.autoresizingMask = UIViewAutoresizingFlexibleTopMargin |UIViewAutoresizingFlexibleLeftMargin |UIViewAutoresizingFlexibleRightMargin;
        [self addSubview:self.contentView];
        UITapGestureRecognizer *tap2 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(dismiss)];
        [self.contentView addGestureRecognizer:tap2];
        
        CGFloat margin = 8;//间隙
        
        self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(margin, 10, CGRectGetWidth(self.contentView.bounds)-margin*2, 100)];
        self.scrollView.layer.masksToBounds = YES;
        self.scrollView.layer.cornerRadius = 5;
        
        [self.scrollView setShowsHorizontalScrollIndicator:NO];
        [self.scrollView setShowsVerticalScrollIndicator:NO];
        [self.scrollView setScrollEnabled:YES];
        self.scrollView.backgroundColor = [UIColor whiteColor];
        

        CGFloat contentW = self.contentView.bounds.size.width;
        CGFloat itemW = 60;
        CGFloat itemH = 80;
        NSInteger count = titles.count;
        CGFloat space = (contentW - 20 - 16 - count*itemW)/(count - 1);
//        NSInteger count = titles.count <= iconNames.count? titles.count:iconNames.count;
        for (int i = 0; i < count; i++) {
            XMActionSheetItem *item = [[XMActionSheetItem alloc]initWithFrame:CGRectMake(10 + i * (itemW + space), 10, itemW, itemH)];
            item.btnIndex = i;
            [item setTitle:titles[i] withImage:[UIImage imageNamed:iconNames[i]]];
            [item addTarget:self action:@selector(clickAction:) forControlEvents:UIControlEventTouchUpInside];
            [self.scrollView addSubview:item];

        }
        
        self.scrollView.contentSize = CGSizeMake(0, CGRectGetHeight(self.scrollView.bounds));
        
        CGFloat btnY = CGRectGetMaxY(self.scrollView.frame) + 8;
    
        UIButton *cancelBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        cancelBtn.backgroundColor = [UIColor whiteColor];
        cancelBtn.frame = CGRectMake(margin, btnY, CGRectGetWidth(self.contentView.frame) - margin*2, 40);
        [cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
        [cancelBtn setTitleColor:[UIColor colorWithRed:0.22 green:0.45 blue:1 alpha:1] forState:UIControlStateNormal];
        cancelBtn.layer.cornerRadius = 5;
        cancelBtn.layer.masksToBounds = YES;
        [cancelBtn addTarget:self action:@selector(dismiss) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:cancelBtn];
        
        CGFloat height = CGRectGetMaxY(cancelBtn.frame) + 10;
        CGRect frame = self.contentView.frame;
        frame.size.height = height;
        self.contentView.frame = frame;
        
        [self.contentView addSubview:self.scrollView];
        
    }
    
    return  self;
    
}

- (void)clickAction:(XMActionSheetItem *)item {
    if (_clickBlock) {
        _clickBlock(item.btnIndex);
    }
    [self dismiss];
}

- (void)setContentViewFrameY:(CGFloat)y {
    CGRect frame = self.contentView.frame;
    frame.origin.y = y;
    self.contentView.frame = frame;
    
}

- (void)dismiss {
    [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        self.backgroundMask.alpha = 0;
        [self setContentViewFrameY:CGRectGetHeight(self.bounds)];
    } completion:^(BOOL finished) {
        sheet.hidden = YES;
        sheet = nil;
    }];
}

- (void)showActionSheetWithClickBlock:(ButtonClickBlock)btnClickBlock cancelBlock:(CancelBlock)cancelBlock {
    _clickBlock = btnClickBlock;
    _cancelBlock = cancelBlock;
    sheet = self;
    sheet.hidden = NO;
    [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        self.backgroundMask.alpha = 0.6;
        [self setContentViewFrameY:CGRectGetHeight(self.bounds) - CGRectGetHeight(self.contentView.frame)];
    } completion:^(BOOL finished) {
        
    }];
    
}

- (void)dealloc {
//    NSLog(@"%s", __func__);
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
