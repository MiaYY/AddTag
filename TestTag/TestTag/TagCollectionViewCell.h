//
//  TagCollectionViewCell.h
//  TestTag
//
//  Created by Gaia on 2017/6/14.
//  Copyright © 2017年 月月. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Model;
@interface TagCollectionViewCell : UICollectionViewCell
@property (nonatomic, strong) UIView *cellBgView;
//标签按钮
@property (nonatomic, strong) UIButton *costTagBtn;
- (void)cellWithData:(Model *)model;

@end
