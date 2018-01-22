# ShareActionView
iOS从底部弹出的分享View


### 使用方法

```
NSArray *titles = @[@"朋友圈", @"微信好友", @"QQ好友"];
NSArray *imageNames = @[@"sns_icon_23", @"sns_icon_6", @"sns_icon_f"];
XMActionSheet *actionSheet = [[XMActionSheet alloc]initWithTitles:titles iconNames:imageNames];
[actionSheet showActionSheetWithClickBlock:^(int btnIndex) {
    NSLog(@"index:%d", btnIndex);
} cancelBlock:^{
    NSLog(@"取消");
}];


```
