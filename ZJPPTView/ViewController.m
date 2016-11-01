//
//  ViewController.m
//  ZJPPTView
//
//  Created by ZeroJ on 16/9/21.
//  Copyright © 2016年 ZeroJ. All rights reserved.
//

#import "ViewController.h"
#import "ZJPPTViewDefault.h"
#import "ZJPPTViewCustom.h"
#import "ZJPPTViewTextOnly.h"
#import "ZJProgressHUD.h"
@interface ViewController ()<ZJPPTViewDelegate>
@property (strong, nonatomic) ZJPPTViewDefault *defaultPPT;
@property (strong, nonatomic) ZJPPTViewCustom *customPPT;
@property (strong, nonatomic) ZJPPTViewTextOnly *textOnlyPPT;

@end



@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _defaultPPT = [[ZJPPTViewDefault alloc] initWithDelegate:self];
    _defaultPPT.pageControlPositon = ZJPPTViewPageControlPositionBottomCenter;
//    ppt.pageControl.pageIndicatorTintColor = ...
//    ppt.scrollDirection = UICollectionViewScrollDirectionVertical;
    _defaultPPT.frame = CGRectMake(0.f, 40.f, self.view.bounds.size.width, 200);

    [self.view addSubview: _defaultPPT];
    
    _customPPT = [[ZJPPTViewCustom alloc] initWithDelegate:self];
    _customPPT.pageControlPositon = ZJPPTViewPageControlPositionBottomRight;
    _customPPT.frame = CGRectMake(0.f, 260, self.view.bounds.size.width, 200);

    [self.view addSubview:_customPPT];
    
    _textOnlyPPT = [[ZJPPTViewTextOnly alloc] initWithDelegate:self];
    _textOnlyPPT.frame = CGRectMake(0.f, 480, self.view.bounds.size.width, 60);
    _textOnlyPPT.scrollDirection = UICollectionViewScrollDirectionVertical;
    [self.view addSubview:_textOnlyPPT];
    
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];

}


- (NSInteger)numberOfPagesForPPTView:(ZJPPTViewOC *)pptView {
    return 4;
}

- (void)pptView:(ZJPPTViewOC *)pptView setUpPageCell:(UICollectionViewCell *)cell withIndex:(NSInteger)index {
    if (pptView == _defaultPPT) {
        ZJPPTViewDefaultCell *defaultCell = (ZJPPTViewDefaultCell *)cell;
        // 可自定义文字属性 ...
//    defaultCell.textLabel.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5];
//    defaultCell.textLabel.textAlignment = NSTextAlignmentCenter;
//    defaultCell.textLabel.textColor = [UIColor whiteColor];
        defaultCell.textLabel.text = [NSString stringWithFormat:@"      这是第: %ld 页", index];
        // 设置图片  网络图片, 可自由使用SDWebimage等来加载
        if (index%2 == 0) {
            UIImage *image = [UIImage imageNamed:@"1"];
            defaultCell.imageView.image = image;
        }
        else {
            UIImage *image = [UIImage imageNamed:@"2"];
            defaultCell.imageView.image = image;
        }

    }
    if (pptView == _customPPT) {
        ZJPPTViewCustomCell *customCell = (ZJPPTViewCustomCell *)cell;
        if (index%2 == 0) {
            UIImage *image = [UIImage imageNamed:@"1"];
            customCell.imageView.image = image;
        }
        else {
            UIImage *image = [UIImage imageNamed:@"2"];
            customCell.imageView.image = image;
        }
    }
    
    if (pptView == _textOnlyPPT) {
        ZJPPTViewTextOnlyCell *textCell = (ZJPPTViewTextOnlyCell *)cell;
        textCell.backgroundColor = [UIColor yellowColor];
        textCell.textLabel.text = [NSString stringWithFormat:@"      这是第: %ld 页", index];
        textCell.textLabel.textColor = [UIColor purpleColor];

    }
}

- (void)pptView:(ZJPPTViewOC *)pptView setUpTextLabel:(UILabel *)label withIndex:(NSInteger)index {
    // 可自定义文字属性 ...
//    label.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5];
//    label.textAlignment = NSTextAlignmentCenter;
//    label.textColor = [UIColor whiteColor];
    label.text = [NSString stringWithFormat:@"      这是第: %ld 页", index];


}


- (void)pptView:(ZJPPTViewOC *)pptView didSelectPageForIndex:(NSInteger)index {
    NSLog(@"点击了 %ld", index);
    [ZJProgressHUD showStatus:[NSString stringWithFormat:@"点击了 %ld", index] andAutoHideAfterTime:1.0];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
