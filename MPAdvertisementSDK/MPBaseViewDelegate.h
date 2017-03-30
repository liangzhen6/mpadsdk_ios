//
//  MPBaseViewDelegate.h
//  MPAdvertisementSDK
//
//  Created by shenzhenshihua on 2016/11/7.
//  Copyright © 2016年 shenzhenshihua. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MPBannerView;

@protocol MPBaseViewDelegate <NSObject>

@optional

- (void)adViewDidSuccess:(MPBannerView *)bannerView;

- (void)adView:(MPBannerView *)bannerView didFailWithError:(NSError *)error;


@end



