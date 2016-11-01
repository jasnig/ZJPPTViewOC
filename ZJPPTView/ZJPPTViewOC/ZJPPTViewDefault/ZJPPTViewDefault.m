//
//  ZJPPTViewDefault.m
//  ZJPPTView
//
//  Created by ZeroJ on 16/10/9.
//  Copyright © 2016年 ZeroJ. All rights reserved.
//

#import "ZJPPTViewDefault.h"

@implementation ZJPPTViewDefault

static NSString *const kCustomCellId = @"ZJPPTViewCustomCell";

- (instancetype)initWithDelegate:(id<ZJPPTViewDelegate>)delegate {
    if (self = [super initWithDelegate:delegate]) {
        // 添加自定义的控件
    }
    return self;
}

// 重写父类方法
- (void)registerCellForCollectionView:(UICollectionView *)collectionView {
    [super registerCellForCollectionView:collectionView];
    [collectionView registerClass:[ZJPPTViewDefaultCell class] forCellWithReuseIdentifier:kCustomCellId];
    
}

- (UICollectionViewCell *)dequeueReusableCellForCollectionView:(UICollectionView *)collectionView withIndexPath:(NSIndexPath *)indexPath {
    [super dequeueReusableCellForCollectionView:collectionView withIndexPath:indexPath];
    ZJPPTViewDefaultCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kCustomCellId forIndexPath:indexPath];

    return cell;
}



- (void)layoutSubviews {
    [super layoutSubviews];
    
}

@end
