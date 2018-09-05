//
//  Helper.h
//  TestTag
//
//  Created by Gaia on 2017/6/27.
//  Copyright © 2017年 月月. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Helper : NSObject
+(UIAlertController *)CustomTitleAlertTitle:(NSString *)title sureTtile:(NSString *)sureTitle cancelTitle:(NSString *)cancelTitle mesasge:(NSString *)message preferredStyle:(UIAlertControllerStyle )preferredStyle  confirmHandler:(void(^)(UIAlertAction *sure))confirmHandler cancleHandler:(void(^)(UIAlertAction *cancel))cancleHandler viewController:(UIViewController *)vc;

@end
