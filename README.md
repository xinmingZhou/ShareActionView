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

### 参考图片

![image](https://github.com/xinmingZhou/ShareActionView/blob/master/34EFF6E1-6E8F-4DFD-85A8-60FB51D615FB.png)
