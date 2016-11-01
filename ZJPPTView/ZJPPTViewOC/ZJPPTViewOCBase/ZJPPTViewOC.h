//
//  ZJPPTViewOC.h
//  ZJPPTView
//
//  Created by ZeroJ on 16/10/8.
//  Copyright © 2016年 ZeroJ. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ZJPPTViewOC;


typedef NS_ENUM(NSInteger, ZJPPTViewPageControlPosition) {
    ZJPPTViewPageControlPositionBottomCenter,
    ZJPPTViewPageControlPositionBottomLeft,
    ZJPPTViewPageControlPositionBottomRight,
    ZJPPTViewPageControlPositionTopCenter,
    ZJPPTViewPageControlPositionTopLeft,
    ZJPPTViewPageControlPositionTopRight,
};


@protocol ZJPPTViewDelegate <NSObject>
/**
 *  必须实现的代理方法, 返回总页数
 *
 *  @param pptView pptView
 *
 *  @return 返回总页数
 */
- (NSInteger)numberOfPagesForPPTView:(ZJPPTViewOC *)pptView;

/**
 *  设置cell的数据
 *
 *  @param pptView pptView
 *  @param cell    cell的类型由注册的时候决定, 需要转换为相应的类型来使用
 *  @param index   index
 */
- (void)pptView:(ZJPPTViewOC *)pptView setUpPageCell:(UICollectionViewCell *)cell withIndex:(NSInteger)index;

@optional

/**
 *  设置每一个页面的文字  --- 预留给子类使用 可以参见 ZJPPTViewCustom 中
 *  当然如果需要其他的代理方法来设置数据, 可能就需要在子类中自己定义新的代理和代理方法了
 *
 *  @param pptView   pptView
 *  @param label     label
 *  @param index     index
 */
- (void)pptView:(ZJPPTViewOC *)pptView setUpTextLabel:(UILabel *)label withIndex:(NSInteger)index;
/**
 *  响应点击当前页
 *
 *  @param pptView
 *  @param index   被点击的index
 */
- (void)pptView:(ZJPPTViewOC *)pptView didSelectPageForIndex:(NSInteger)index;
/**
 *  滚动到当前页
 *
 *  @param pptView
 *  @param currentIndex currentIndex
 */
- (void)pptView:(ZJPPTViewOC *)pptView didScrollToCurrentIndex:(NSInteger)currentIndex;

@end

@interface ZJPPTViewOC : UIView
@property (weak, nonatomic) id<ZJPPTViewDelegate> delegate;
/** pageControl 的位置 默认为下面居中显示 */
@property (assign, nonatomic) ZJPPTViewPageControlPosition pageControlPositon;
/** 滚动的时间间隔 默认为3s */
@property (assign, nonatomic) NSTimeInterval scrollDuration;
/** 滚动方向 水平或者竖直滚动 默认为水平方向滚动 */
@property (assign, nonatomic) UICollectionViewScrollDirection scrollDirection;
/** collectionView 只读*/
@property (strong, nonatomic, readonly) UICollectionView *collectionView;
/** pageControl 只读*/
@property (strong, nonatomic, readonly) UIPageControl *pageControl;
/** 总共的页数 只读*/
@property (assign, nonatomic, readonly) NSInteger pages;
/** 当前的页数 只读*/
@property (assign, nonatomic, readonly) NSInteger currentPage;
/**
 *  初始化方法
 *
 *  @param delegate 代理 -- 必须实现代理中的两个方法(设置数据的代理方法对应的二选一)
 *
 *  @return ZJPPTViewOC
 */
- (instancetype)initWithDelegate:(id<ZJPPTViewDelegate>)delegate;

/**
 *  重新加载所有内容
 */
- (void)reload;
/**
 *  为collectionView注册cell, 重写的时候一定要先调用父类的方法,详见示例
 *
 *  @param collectionView
 */
- (void)registerCellForCollectionView:(UICollectionView *)collectionView;
/**
 *  为collectionView设置cell, 重写的时候一定要先调用父类的方法,详见示例
 *
 *  @param collectionView
 */
- (UICollectionViewCell *)dequeueReusableCellForCollectionView:(UICollectionView *)collectionView withIndexPath:(NSIndexPath *)indexPath;
/**
 *  当前的页数正在改变 为了方便子类重写获取到页数的改变
 *
 *  @param currentPage 当前页数
 */
- (void)currentPageDidChange:(NSInteger)currentPage;

@end
