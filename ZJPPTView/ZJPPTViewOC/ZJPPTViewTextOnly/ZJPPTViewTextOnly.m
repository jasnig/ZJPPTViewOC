//
//  ZJPPTViewTextOnly.m
//  ZJPPTView
//
//  Created by ZeroJ on 16/10/30.
//  Copyright © 2016年 ZeroJ. All rights reserved.
//

#import "ZJPPTViewTextOnly.h"

@implementation ZJPPTViewTextOnly
static NSString *const kTextOnlyCellId = @"ZJPPTViewTextOnlyCell";

- (instancetype)initWithDelegate:(id<ZJPPTViewDelegate>)delegate {
    if (self = [super initWithDelegate:delegate]) {
        self.pageControl.hidden = YES;
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

// 重写父类方法
- (void)registerCellForCollectionView:(UICollectionView *)collectionView {
    [super registerCellForCollectionView:collectionView];
    [collectionView registerNib:[UINib nibWithNibName:@"ZJPPTViewTextOnlyCell" bundle:nil] forCellWithReuseIdentifier:kTextOnlyCellId];
    
}

- (UICollectionViewCell *)dequeueReusableCellForCollectionView:(UICollectionView *)collectionView withIndexPath:(NSIndexPath *)indexPath {
    [super dequeueReusableCellForCollectionView:collectionView withIndexPath:indexPath];
    ZJPPTViewTextOnlyCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kTextOnlyCellId forIndexPath:indexPath];
    [self.delegate pptView:self setUpPageCell:cell withIndex:indexPath.row];
//    if (self.delegate && [self.delegate respondsToSelector:@selector(pptView:setUpTextLabel:withIndex:)]) {
//        [self.delegate pptView:self setUpTextLabel:cell.textLabel withIndex:indexPath.row];
//    }

    return cell;
}
// 改变当前下标的时候, 调用代理方法设置新数据
- (void)currentPageDidChange:(NSInteger)currentPage {
    [super currentPageDidChange:currentPage];
    NSLog(@"%ld --- %ld", self.pages, self.currentPage);
}

@end
