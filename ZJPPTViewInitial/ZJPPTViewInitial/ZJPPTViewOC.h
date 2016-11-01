//
//  ZJPPTViewOC.h
//  ZJPPTViewInitial
//
//  Created by ZeroJ on 16/10/18.
//  Copyright © 2016年 ZeroJ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZJPPTViewDefaultCell.h"

@class ZJPPTViewOC;
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
- (void)pptView:(ZJPPTViewOC *)pptView setUpPageCell:(ZJPPTViewDefaultCell *)cell withIndex:(NSInteger)index;

@optional

/**
 *  响应点击当前页
 *
 *  @param pptView
 *  @param index   被点击的index
 */
- (void)pptView:(ZJPPTViewOC *)pptView didSelectPageForIndex:(NSInteger)index;


@end

@interface ZJPPTViewOC : UIView
@property (weak, nonatomic) id<ZJPPTViewDelegate> delegate;
- (instancetype)initWithDelegate:(id<ZJPPTViewDelegate>)delegate;

@end
