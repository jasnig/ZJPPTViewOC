//
//  ZJPPTViewCustom.m
//  ZJPPTView
//
//  Created by ZeroJ on 16/10/9.
//  Copyright © 2016年 ZeroJ. All rights reserved.
//

#import "ZJPPTViewCustom.h"

@interface ZJPPTViewCustom ()
@property (strong, nonatomic) UILabel *label;
@end

@implementation ZJPPTViewCustom
static NSString *const kCustomCellId = @"ZJPPTViewCustomCell";

- (instancetype)initWithDelegate:(id<ZJPPTViewDelegate>)delegate {
    if (self = [super initWithDelegate:delegate]) {
        // 添加自定义的控件
        // self.label使用懒加载初始化
        [self addSubview:self.label];
    }
    return self;
}

// 重写父类方法
- (void)registerCellForCollectionView:(UICollectionView *)collectionView {
    [super registerCellForCollectionView:collectionView];
    [collectionView registerNib:[UINib nibWithNibName:@"ZJPPTViewCustomCell" bundle:nil] forCellWithReuseIdentifier:kCustomCellId];
    
}

- (UICollectionViewCell *)dequeueReusableCellForCollectionView:(UICollectionView *)collectionView withIndexPath:(NSIndexPath *)indexPath {
    [super dequeueReusableCellForCollectionView:collectionView withIndexPath:indexPath];
    ZJPPTViewCustomCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kCustomCellId forIndexPath:indexPath];
    return cell;
}
// 改变当前下标的时候, 调用代理方法设置新数据
- (void)currentPageDidChange:(NSInteger)currentPage {
    [super currentPageDidChange:currentPage];
    if (self.delegate && [self.delegate respondsToSelector:@selector(pptView:setUpTextLabel:withIndex:)]) {
        [self.delegate pptView:self setUpTextLabel:self.label withIndex:currentPage];
    }
    NSLog(@"%ld --- %ld", self.pages, self.currentPage);
}


- (void)layoutSubviews {
    [super layoutSubviews];
    CGFloat labelHeight = 37.f;
    self.label.frame = CGRectMake(0.f, self.bounds.size.height - labelHeight, self.bounds.size.width, labelHeight);
}



- (UILabel *)label {
    if (!_label) {
        UILabel *label = [UILabel new];
        label.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5];
        label.textColor = [UIColor whiteColor];

        _label = label;
    }
    return _label;
}


@end
