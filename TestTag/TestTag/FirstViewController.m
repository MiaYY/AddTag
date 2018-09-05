//
//  FirstViewController.m
//  TestTag
//
//  Created by Gaia on 2017/6/19.
//  Copyright © 2017年 月月. All rights reserved.
//

#import "FirstViewController.h"
#import "Masonry.h"
#import "CBCommon.h"

#import "ViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *buttonTag = [UIButton buttonWithType:UIButtonTypeCustom];
    [buttonTag setTitle:@"点击" forState:UIControlStateNormal];
    [buttonTag setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    buttonTag.backgroundColor = [UIColor redColor];
    [buttonTag addTarget:self action:@selector(buttonTagClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:buttonTag];
    [buttonTag mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(buttonTag.superview);
        make.size.mas_equalTo(60);
    }];
}

- (void)buttonTagClicked:(UIButton *)btn {
    
//    NSString *path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
//    NSFileManager *fileManager = [NSFileManager defaultManager];
//    NSLog(@"string:%@",path);
////    NSArray *tempFileList = [[NSArray alloc] initWithArray:[fileManager contentsOfDirectoryAtPath:path error:nil]];
//    NSDictionary *fileAttributes = [fileManager fileAttributesAtPath:path traverseLink:YES];
//    NSLog(@"@@");
//    if (fileAttributes != nil) {
//        NSNumber *fileSize;
//        NSString *fileOwner, *creationDate;
//        NSDate *fileModDate;
//        //NSString *NSFileCreationDate
//        //文件大小
//        if (fileSize == [fileAttributes objectForKey:NSFileSize]) {
//            NSLog(@"File size: %qi\n", [fileSize unsignedLongLongValue]);
//        }
//        //文件创建日期
//        if (creationDate == [fileAttributes objectForKey:NSFileCreationDate]) {
//            NSLog(@"File creationDate: %@\n", creationDate);
//            //textField.text=NSFileCreationDate;
//        }
//        //文件所有者
//        if (fileOwner == [fileAttributes objectForKey:NSFileOwnerAccountName]) {
//            NSLog(@"Owner: %@\n", fileOwner);
//        }
//        //文件修改日期
//        if (fileModDate == [fileAttributes objectForKey:NSFileModificationDate]) {
//            NSLog(@"Modification date: %@\n", fileModDate);
//        }
//    }
//    else {
//        NSLog(@"Path (%@) is invalid.", path);
//    }
//    return;
    
    ViewController *viewC = [[ViewController alloc] init];
    [self.navigationController pushViewController:viewC animated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
