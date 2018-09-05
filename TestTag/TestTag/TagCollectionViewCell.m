//
//  TagCollectionViewCell.m
//  TestTag
//
//  Created by Gaia on 2017/6/14.
//  Copyright © 2017年 月月. All rights reserved.
//

#import "TagCollectionViewCell.h"
#import "Masonry.h"
#import "CBCommon.h"
#import "Model.h"

@implementation TagCollectionViewCell
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self setUpStyle];
    }
    return self;
}
- (void)setUpStyle {
    self.cellBgView = UIView.new;
    self.cellBgView.backgroundColor = [UIColor whiteColor];
    [self.contentView addSubview:self.cellBgView];
    [self.cellBgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(CKScreenW/3);
        make.height.mas_equalTo(60);
    }];
    
    self.costTagBtn = UIButton.new;
    self.costTagBtn.layer.cornerRadius = 5.0f;
    self.costTagBtn.layer.masksToBounds = YES;
    self.costTagBtn.backgroundColor = [UIColor whiteColor];
    self.costTagBtn.layer.borderColor = HexColor(0x979797).CGColor;
    self.costTagBtn.layer.borderWidth = 0.7f;
    [self.costTagBtn setTitleColor:HexColor(0x979797) forState:UIControlStateNormal];
    self.costTagBtn.titleLabel.font = [UIFont systemFontOfSize:14.0f];
    [self.cellBgView addSubview:self.costTagBtn];
    [self.costTagBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(self.costTagBtn.superview);
        make.width.mas_equalTo(CKScreenW/3-20);
        make.height.mas_equalTo(40);
    }];
}

- (void)cellWithData:(Model *)model {
    if (model.isSelected) {
        self.costTagBtn.backgroundColor = HexColor(0x04ADEB);
        self.costTagBtn.layer.borderColor = [UIColor clearColor].CGColor;
        self.costTagBtn.layer.borderWidth = 0.7f;
        
    } else {
        self.costTagBtn.backgroundColor = [UIColor whiteColor];
        self.costTagBtn.layer.borderColor = HexColor(0x979797).CGColor;
        self.costTagBtn.layer.borderWidth = 0.7f;
    }
}

@end
