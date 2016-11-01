//
//  ViewController.m
//  ZJPPTViewInitial
//
//  Created by ZeroJ on 16/10/18.
//  Copyright © 2016年 ZeroJ. All rights reserved.
//

#import "ViewController.h"
#import "ZJPPTViewOC.h"
@interface ViewController ()<ZJPPTViewDelegate>
@property (strong, nonatomic) ZJPPTViewOC *ppt;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.ppt = [[ZJPPTViewOC alloc] initWithDelegate:self];
    self.ppt.frame = CGRectMake(0, 200, self.view.bounds.size.width, 200);
    
    [self.view addSubview: self.ppt];
}


- (NSInteger)numberOfPagesForPPTView:(ZJPPTViewOC *)pptView {
    return 4;
}

- (void)pptView:(ZJPPTViewOC *)pptView setUpPageCell:(ZJPPTViewDefaultCell *)cell withIndex:(NSInteger)index {
    // 可自定义文字属性 ...
    //    cell.textLabel.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5];
    //    cell.textLabel.textAlignment = NSTextAlignmentCenter;
    //    cell.textLabel.textColor = [UIColor whiteColor];
    cell.textLabel.text = [NSString stringWithFormat:@"      这是第: %ld 页", index];
    
    if (index%2 == 0) {
        UIImage *image = [UIImage imageNamed:@"1"];
        cell.imageView.image = image;
    }
    else {
        UIImage *image = [UIImage imageNamed:@"2"];
        cell.imageView.image = image;
    }
        

    
}

@end
