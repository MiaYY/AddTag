//
//  Helper.m
//  TestTag
//
//  Created by Gaia on 2017/6/27.
//  Copyright © 2017年 月月. All rights reserved.
//

#import "Helper.h"

@implementation Helper

//有(自己定义title sureTitle cancelTitle)按钮的
+(UIAlertController *)CustomTitleAlertTitle:(NSString *)title sureTtile:(NSString *)sureTitle cancelTitle:(NSString *)cancelTitle mesasge:(NSString *)message preferredStyle:(UIAlertControllerStyle )preferredStyle  confirmHandler:(void(^)(UIAlertAction *sure))confirmHandler cancleHandler:(void(^)(UIAlertAction *cancel))cancleHandler viewController:(UIViewController *)vc{
    UIAlertController *alertController=[UIAlertController alertControllerWithTitle:title message:message preferredStyle:preferredStyle];
    UIAlertAction *confirmAction=[UIAlertAction actionWithTitle:sureTitle style:UIAlertActionStyleDefault handler:confirmHandler];
    UIAlertAction *cancleAction = [UIAlertAction actionWithTitle:cancelTitle style:UIAlertActionStyleCancel handler:cancleHandler];
    
    [alertController addAction:confirmAction];
    [alertController addAction:cancleAction];
    
    [vc presentViewController:alertController animated:YES completion:nil];
    
    return alertController;
}

@end
