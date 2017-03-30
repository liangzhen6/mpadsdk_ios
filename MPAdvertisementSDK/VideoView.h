//
//  VideoView.h
//  MPAdvertisementSDK
//
//  Created by mac on 2016/11/8.
//  Copyright © 2016年 shenzhenshihua. All rights reserved.
//

#import <UIKit/UIKit.h>
@class VideoView;
@protocol VideoViewDelegate <NSObject>

@required

- (void)videoViewDismissVideoViewController:(VideoView *)videoView;

@end
@interface VideoView : UIView
@property (nonatomic,copy) NSString *url;
@property (nonatomic,weak) id<VideoViewDelegate>delegate;
@end
