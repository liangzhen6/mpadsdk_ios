//
//  MPBannerView.h
//  MPAdvertisementSDK
//
//  Created by shenzhenshihua on 2016/11/7.
//  Copyright © 2016年 shenzhenshihua. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MPBaseViewDelegate.h"
@interface MPBannerView : UIView

/**
 adUnitID 广告的请求id
 */
@property(nonatomic,copy)NSString *adID;


/**
 广告被加载的父视图控制器
 */
@property(nonatomic,strong)UIViewController * rootViewController;

/**
 加载成功或者失败的代理
 */
@property(nonatomic,weak)id<MPBaseViewDelegate> delegate;


/**
 开始加载
 */
- (void)loadRequest;


/**
 带着广告的id加载
 @param adID 广告的id
 */
- (void)loadRequestWithAdId:(NSString *)adID;


@end
