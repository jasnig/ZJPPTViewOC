//
//  ZJPPTViewOC.m
//  ZJPPTViewInitial
//
//  Created by ZeroJ on 16/10/18.
//  Copyright © 2016年 ZeroJ. All rights reserved.
//

#import "ZJPPTViewOC.h"

static NSString *const kCellID = @"kCellID";

@interface ZJPPTViewOC ()<UICollectionViewDelegate, UICollectionViewDataSource, UIScrollViewDelegate, UICollectionViewDelegateFlowLayout> {
}
@property (strong, nonatomic) UICollectionView *collectionView;
// 总页数 由代理方法获取到
@property (assign, nonatomic) NSInteger pages;
// 当前页, 重写setter 进行相关的配置
@property (assign, nonatomic) NSInteger currentPage;
// 倒计时
@property (strong, nonatomic) NSTimer *timer;
//
@property (strong, nonatomic) UIPageControl *pageControl;
@property (strong, nonatomic) UICollectionViewFlowLayout *collectionViewLayout;


@end
@implementation ZJPPTViewOC


- (instancetype)initWithDelegate:(id<ZJPPTViewDelegate>)delegate {
    if (self = [super init]) {
        _delegate = delegate;
        [self commonInit];
    }
    return self;
}

- (void)commonInit {
    if (_delegate && [_delegate respondsToSelector:@selector(numberOfPagesForPPTView:)]) {
        self.pages = [_delegate numberOfPagesForPPTView:self];
    }
    else {
        NSAssert(NO, @"必须实现代理方法 numberOfPagesForPPTView: ");
    }    self.currentPage = 0;
    // 添加控件
    [self addSubview:self.collectionView];
    [self addSubview:self.pageControl];
    // 注册cell
    [self.collectionView registerClass:[ZJPPTViewDefaultCell class] forCellWithReuseIdentifier:kCellID];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGSize pageControlSize = [self.pageControl sizeForNumberOfPages:self.pages];
    CGRect pageControlFrame = CGRectMake((self.bounds.size.width-pageControlSize.width)/2, self.bounds.size.height - pageControlSize.height, pageControlSize.width, pageControlSize.height);

    self.pageControl.frame = pageControlFrame;
    self.collectionView.frame = self.bounds;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    NSInteger tempIndex = scrollView.contentOffset.x/scrollView.bounds.size.width + 0.5;
    if (tempIndex >= _pages) {
        tempIndex = 0;
    }
    if (tempIndex != _currentPage) {
        self.currentPage = tempIndex;
    }
}

#pragma mark - UICollectionViewDelegate , UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _pages;

}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    ZJPPTViewDefaultCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kCellID forIndexPath:indexPath];
    // 设置数据
    if (self.delegate && [self.delegate respondsToSelector:@selector(pptView:setUpPageCell:withIndex:)]) {
        [self.delegate pptView:self setUpPageCell:cell withIndex:indexPath.row];
    }
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    NSIndexPath *realIndexPath = indexPath;
    if (_delegate && [_delegate respondsToSelector:@selector(pptView:didSelectPageForIndex:)]) {
        [_delegate pptView:self didSelectPageForIndex:realIndexPath.row];
    }
    
    
}

#pragma mark - UICollectionViewDelegateFlowLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return self.collectionView.bounds.size;
}

- (void)setPages:(NSInteger)pages {
    _pages = pages;
    self.pageControl.numberOfPages = pages;
}

- (void)setCurrentPage:(NSInteger)currentPage {
    _currentPage = currentPage;
    self.pageControl.currentPage = currentPage;
}

- (UIPageControl *)pageControl {
    if (!_pageControl) {
        UIPageControl *pageControl = [[UIPageControl alloc] init];
        pageControl.backgroundColor = [UIColor clearColor];
        pageControl.currentPageIndicatorTintColor = [UIColor redColor];
        pageControl.pageIndicatorTintColor = [UIColor blueColor];
        _pageControl = pageControl;
    }
    return _pageControl;
}

- (UICollectionView *)collectionView {
    if (!_collectionView) {
        UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:self.collectionViewLayout];
        collectionView.delegate = self;
        collectionView.dataSource = self;
        collectionView.pagingEnabled = YES;
        collectionView.showsVerticalScrollIndicator = NO;
        collectionView.showsHorizontalScrollIndicator = NO;
        _collectionView = collectionView;
    }
    return _collectionView;
}

- (UICollectionViewFlowLayout *)collectionViewLayout {
    
    if (!_collectionViewLayout) {
        _collectionViewLayout = [UICollectionViewFlowLayout new];
        _collectionViewLayout.itemSize = CGSizeMake(100, 100);
        _collectionViewLayout.minimumLineSpacing = 0.f;
        _collectionViewLayout.minimumInteritemSpacing = 0.f;
        _collectionViewLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    }
    return _collectionViewLayout;
}


@end
