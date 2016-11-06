# ZJPPTViewOC
一个使用方便的轮播器, 可无限循环, 自动轮播, 自定义程度很大, 可以轮播各种形式的内容, 图片, 文字, 按钮... 同时, 内部不依赖第三方库

   * [ZJPPTView 可以玩出花样的轮播器](https://github.com/jasnig/ZJPPTViewOC), 内部不依赖第三方库, 使用简单, 可自定义轮播任何内容.  图片加载等类似tableView使用代理加载, 可自己选择第三方库来加载图片等.



![ppt.gif](http://upload-images.jianshu.io/upload_images/1271831-cd41e2cf8efcb51d.gif?imageMogr2/auto-orient/strip)

```
    _defaultPPT = [[ZJPPTViewDefault alloc] initWithDelegate:self];
    _defaultPPT.pageControlPositon = ZJPPTViewPageControlPositionBottomCenter;
    - (void)pptView:(ZJPPTViewOC *)pptView setUpPageCell:(UICollectionViewCell *)cell withIndex:(NSInteger)index {
        if (pptView == _defaultPPT) {
            ZJPPTViewDefaultCell *defaultCell = (ZJPPTViewDefaultCell *)cell;
            // 可自定义文字属性 ...
            //    defaultCell.textLabel.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5];
            //    defaultCell.textLabel.textAlignment = NSTextAlignmentCenter;
            //    defaultCell.textLabel.textColor = [UIColor whiteColor];
            defaultCell.textLabel.text = [NSString stringWithFormat:@"      这是第: %ld 页", index];
            // 设置图片  网络图片, 可自由使用SDWebimage等来加载
            if (index%2 == 0) {
                UIImage *image = [UIImage imageNamed:@"1"];
                defaultCell.imageView.image = image;
            }
            else {
                UIImage *image = [UIImage imageNamed:@"2"];
                defaultCell.imageView.image = image;
            }
            
        }
    }
```

> 这是我写的<iOS_CUSTOMIZE_ANALYSIS>这本书籍中的一个demo, 如果你希望知道具体的实现过程和其他的一些常用效果的实现, 那么你应该能轻易在网上下载到免费的盗版书籍. 

> 当然作为本书的写作者, 还是希望有人能支持正版书籍. 如果你有意购买书籍, 在[这篇文章中](http://www.jianshu.com/p/510500f3aebd), 介绍了书籍中所有的内容和书籍适合阅读的人群, 和一些试读章节, 以及购买链接. 在你准备购买之前, 请一定读一读里面的说明. 否则, 如果不适合你阅读, 虽然书籍售价35不是很贵, 但是也是一笔损失.


> 如果你希望联系到我, 可以通过[简书](http://www.jianshu.com/users/fb31a3d1ec30/latest_articles)联系到我
