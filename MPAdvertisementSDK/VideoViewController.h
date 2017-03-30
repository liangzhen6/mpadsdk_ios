//
//  VideoViewController.h
//  MPAdvertisementSDK
//
//  Created by mac on 2016/11/8.
//  Copyright © 2016年 shenzhenshihua. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VideoViewController : UIViewController

/**
 播放接口url
 */
@property (nonatomic,copy) NSString *videoUrl;

/**
 销毁控制器
 */
-(void)dismiss;

@end
