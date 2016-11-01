//
//  ZJPPTViewCustomCell.m
//  ZJPPTView
//
//  Created by ZeroJ on 16/10/9.
//  Copyright © 2016年 ZeroJ. All rights reserved.
//

#import "ZJPPTViewCustomCell.h"

@implementation ZJPPTViewCustomCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.imageView.contentMode = UIViewContentModeScaleToFill;
    self.imageView.clipsToBounds = YES;
}

@end
