//
//  ViewController.m
//  TestTag
//
//  Created by Gaia on 2017/6/14.
//  Copyright © 2017年 月月. All rights reserved.
//

#import "ViewController.h"
#import "TagCollectionViewCell.h"

#import "CBCommon.h"
#import "Model.h"
#import "Helper.h"

#define RowCount 3
#define BtnHeight 60

@interface ViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UIAlertViewDelegate>

//添加费用标签按钮
@property (nonatomic, strong) UIButton *addCostTagBtn;
//费用标签输入框
@property (nonatomic, strong) UITextField *costTagTextField;
@property (nonatomic, strong) UIView *bgView;
//费用标签
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) UICollectionViewFlowLayout *flowLayout;
@property (nonatomic, strong) NSMutableArray *titlesArray;
@property (nonatomic, assign) CGFloat collectionViewHeight;
@property (nonatomic, copy) NSString *costTagBtnString;

@property (nonatomic, strong) Model *selectModel;
@property (nonatomic, strong) NSMutableArray *selectArray;
@property (nonatomic, strong) NSMutableArray *equalArray;
@property (nonatomic, strong) NSString *objString;

@property (nonatomic, assign) NSInteger indexPath;

@end

@implementation ViewController

- (NSMutableArray *)titlesArray {
    if (!_titlesArray) {
        _titlesArray = [NSMutableArray arrayWithCapacity:0];
    }
    return _titlesArray;
}

- (NSMutableArray *)equalArray {
    if (!_equalArray) {
        _equalArray = [NSMutableArray arrayWithCapacity:0];
    }
    return _equalArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.view.backgroundColor = [UIColor whiteColor];
    [self createCollectionView];
    
    self.selectArray=[NSMutableArray arrayWithCapacity:0];
    
    NSUserDefaults *defaults =[NSUserDefaults standardUserDefaults];
    NSArray *tagArray = [defaults objectForKey:@"costTagData"];
    
    self.titlesArray = [NSMutableArray arrayWithArray:tagArray];
    
    for (int i=0; i<self.titlesArray.count; i++) {
        Model *model=[[Model alloc]init];
        [self.selectArray addObject:model];
    }
    
    NSLog(@"self.titlesArrayData:%@",self.titlesArray);
    [self settingCollectionViewHeight];
    
    [self.collectionView reloadData];
}

- (void)createCollectionView {
    
    [self settingCollectionViewHeight];
    self.flowLayout  =[[UICollectionViewFlowLayout alloc] init];
    self.flowLayout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
    self.flowLayout.minimumInteritemSpacing = 0.0;
    self.flowLayout.minimumLineSpacing = 0.0;
    self.flowLayout.sectionFootersPinToVisibleBounds = YES;
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:UICollectionViewFlowLayout.new];
    self.collectionView.collectionViewLayout = self.flowLayout;
    
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    self.collectionView.backgroundColor = [UIColor whiteColor];
    self.collectionView.backgroundColor = HexColor(0xfafafa);
    self.collectionView.showsHorizontalScrollIndicator = NO;
    self.collectionView.showsVerticalScrollIndicator = NO;
    self.collectionView.alwaysBounceVertical = YES;
    self.collectionViewHeight = 10.0f;
    if (@available(iOS 11.0, *)) {
        self.collectionView.frame = CGRectMake(0, 88, CKScreenW, self.collectionViewHeight);
    } else {
        // Fallback on earlier versions
        self.collectionView.frame = CGRectMake(0, 64, CKScreenW, self.collectionViewHeight);
    }
    
    [self.collectionView registerClass:[TagCollectionViewCell class] forCellWithReuseIdentifier:@"TagCollectionViewCell"];
    [self.view addSubview:self.collectionView];
    self.addCostTagBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.addCostTagBtn setTitle:@"添加费用标签" forState:UIControlStateNormal];
    self.addCostTagBtn.titleLabel.textAlignment = NSTextAlignmentLeft;
    [self.addCostTagBtn setTitleColor:HexColor(0x04ADEB) forState:UIControlStateNormal];
    self.addCostTagBtn.titleLabel.font = [UIFont systemFontOfSize:14.0f];
    self.addCostTagBtn.frame = CGRectMake(16, CGRectGetMaxY(self.collectionView.frame)+10, 90, 30);
    [self.addCostTagBtn addTarget:self action:@selector(addCostTagBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.addCostTagBtn];
    
    [self.collectionView reloadData];
}

#pragma mark ---UICollectionViewDelegate && DataSource---
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.titlesArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    TagCollectionViewCell *costTagCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"TagCollectionViewCell" forIndexPath:indexPath];

    NSLog(@"self.titlesArrayData******:%@",self.titlesArray);
    [costTagCell.costTagBtn setTitle:self.titlesArray[indexPath.row] forState:UIControlStateNormal];
    [costTagCell.costTagBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    [costTagCell.costTagBtn setTitle:self.titlesArray[indexPath.row] forState:UIControlStateSelected];
    [costTagCell.costTagBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
    
    [costTagCell.costTagBtn addTarget:self action:@selector(costTagBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    costTagCell.cellBgView.backgroundColor = [UIColor whiteColor];
    costTagCell.costTagBtn.tag = indexPath.row;
    self.indexPath = costTagCell.costTagBtn.tag;
#pragma mark ---添加长按手势删除---
    costTagCell.costTagBtn.userInteractionEnabled = YES;
    UILongPressGestureRecognizer *longGR = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longGR:)];
    [costTagCell.costTagBtn addGestureRecognizer:longGR];
    
    Model *model =self.selectArray[indexPath.row];
    [costTagCell cellWithData:model];
    
    return costTagCell;
}

#pragma mark ---长按删除---
- (void)longGR:(UILongPressGestureRecognizer *)longGR {
    [Helper CustomTitleAlertTitle:@"删除费用标签" sureTtile:@"确定" cancelTitle:@"取消" mesasge:@"确定要删除此费用标签吗" preferredStyle:UIAlertControllerStyleAlert confirmHandler:^(UIAlertAction *sure) {
        
        [self.titlesArray removeObjectAtIndex:longGR.view.tag];
        [self.selectArray removeObjectAtIndex:longGR.view.tag];
        
        [self.collectionView reloadData];
        [self settingCollectionViewHeight];
    } cancleHandler:^(UIAlertAction *cancel) {
        
    } viewController:self];
}


#pragma mark --UICollectionViewDelegateFlowLayout--
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {//定义每个UICollectionView 的大小
    
    return CGSizeMake(CKScreenW/3, 60);
}

#pragma mark ---标签按钮点击事件---
- (void)costTagBtnClicked:(UIButton *)btn {
    if (self.selectModel) {
        self.selectModel.isSelected = !self.selectModel.isSelected;
    }
   _selectModel = self.selectArray[btn.tag];
    self.costTagBtnString = self.titlesArray[btn.tag];
    if (!_selectModel.isSelected) {
        _selectModel.isSelected = !_selectModel.isSelected;
            }
    [self.collectionView reloadData];
}
#pragma mark ---添加费用标签按钮点击事件---
- (void)addCostTagBtnClicked:(UIButton *)costBtn {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"添加费用标签" message:@"" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    [alert setAlertViewStyle:UIAlertViewStylePlainTextInput];
    self.costTagTextField = [alert textFieldAtIndex:0];
    self.costTagTextField.placeholder = @"请输入费用标签名称";
    [alert show];
}

#pragma mark ---alertViewDelegate---
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex == 1) {
            self.costTagTextField = [alertView textFieldAtIndex:0];
            if (self.costTagTextField.text.length == 0) {
                NSLog(@"费用标签不能为空");
                return;
            }
            
            if (self.titlesArray.count == 0) {
                [self.titlesArray addObject:self.costTagTextField.text];
            } else {
                [self.titlesArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                    self.objString = obj;
                }];
                if (![self.costTagTextField.text isEqualToString:self.objString]) {
                    [self.titlesArray addObject:self.costTagTextField.text];
                    
                } else {
                    NSLog(@"不能重复添加");
                    return ;
                }
            }
            NSUserDefaults *defaults =[NSUserDefaults standardUserDefaults];
            NSArray *titleArray = [NSArray arrayWithArray:self.titlesArray];
            [defaults setObject:titleArray forKey:@"costTagData"];
            
            for (int i=0; i<self.titlesArray.count; i++) {
                Model *model=[[Model alloc]init];
                [self.selectArray addObject:model];
            }
        [self.collectionView reloadData];
        [self settingCollectionViewHeight];
    }
}

- (void)settingCollectionViewHeight {
    
    if (self.titlesArray.count % RowCount == 0) {
        self.collectionViewHeight = ((BtnHeight) * self.titlesArray.count / RowCount);
    } else {
        self.collectionViewHeight = ((BtnHeight) * ((self.titlesArray.count / RowCount) + 1));
    }

//    self.collectionView.frame = CGRectMake(0, 64, CKScreenW, self.collectionViewHeight);
    if (@available(iOS 11.0, *)) {
        self.collectionView.frame = CGRectMake(0, 88, CKScreenW, self.collectionViewHeight);
    } else {
        // Fallback on earlier versions
        self.collectionView.frame = CGRectMake(0, 64, CKScreenW, self.collectionViewHeight);
    }
    self.addCostTagBtn.frame = CGRectMake(16, CGRectGetMaxY(self.collectionView.frame)+10, 90, 30);
    
    [self.collectionView reloadData];
}


- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSArray *titleArray = [NSArray arrayWithArray:self.titlesArray];
    [defaults setObject:titleArray forKey:@"costTagData"];
    [self.collectionView reloadData];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
