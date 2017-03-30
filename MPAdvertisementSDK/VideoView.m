//
//  VideoView.m
//  MPAdvertisementSDK
//
//  Created by mac on 2016/11/8.
//  Copyright © 2016年 shenzhenshihua. All rights reserved.
//

#import "VideoView.h"
#import <MediaPlayer/MediaPlayer.h>
@interface VideoView()
@property (nonatomic,strong)MPMoviePlayerController *playerController;
@property(nonatomic,weak)UIActivityIndicatorView * activiityIndicator;//小菊花

@end
@implementation VideoView

/**
 初始化操作
 */
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self initNotification];
    }
    return self;
}

#pragma mark 监听播放通知
- (void)initNotification
{
     [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(playFinish:) name:MPMoviePlayerPlaybackDidFinishNotification object:nil];
//    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(playLoadState:) name:MPMoviePlayerLoadStateDidChangeNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(playerPlaybackState:) name:MPMoviePlayerPlaybackStateDidChangeNotification object:nil];
}
#pragma mark 播放完成
- (void)playFinish:(NSNotification *)noti
{

    [UIView animateWithDuration:0.5 animations:^{
         [self removeFromSuperview];
        if ([self.delegate respondsToSelector:@selector(videoViewDismissVideoViewController:)]) {
            [self.delegate videoViewDismissVideoViewController:self];
        }
    }];
}

#pragma mark 缓存状态监听

/**
 MPMovieLoadStateUnknown        = 0,//状态未知
 MPMovieLoadStatePlayable       = 1 << 0,//缓存数据足够开始播放，但是视频并没有缓存完全
 MPMovieLoadStatePlaythroughOK  = 1 << 1, //已经缓存完成，如果设置了自动播放，这时会自动播放
 MPMovieLoadStateStalled        = 1 << 2, //数据缓存已经停止，播放将暂停

 */
- (void)playLoadState:(NSNotification *)noti
{
   // NSLog(@"%zd",self.playerController.loadState);

/**       [self.activiityIndicator stopAnimating];
//    }else{
////    if (self.playerController.loadState == MPMovieLoadStatePlayable||self.playerController.loadState==MPMovieLoadStateStalled) {  //已经缓存完成，如果设置了自动播放，这时会自动播放       
 NSLog(@"777%zd",self.playerController.loadState);
//        [self.activiityIndicator startAnimating]; //菊花转动
 
 typedef NS_ENUM(NSInteger, MPMoviePlaybackState) {
 MPMoviePlaybackStateStopped,//停止播放
 MPMoviePlaybackStatePlaying,//正在播放
 MPMoviePlaybackStatePaused,//暂停播放
 MPMoviePlaybackStateInterrupted,//中断播放
 MPMoviePlaybackStateSeekingForward,//快进
 MPMoviePlaybackStateSeekingBackward//快退
 };
 
 
*/

//    if (self.playerController.playbackState == MPMoviePlaybackStatePlaying) {
//        [self.activiityIndicator stopAnimating];
//    }else{
//        [self.activiityIndicator startAnimating];
//    }


    switch (self.playerController.loadState) {

        case MPMovieLoadStatePlayable:
        {
//            [self.playerController play];
//            [self.activiityIndicator stopAnimating];
        }
            // 可播放
   
            break;

        case MPMovieLoadStatePlaythroughOK:
        {
//            [self.playerController play];
//            [self.activiityIndicator stopAnimating];

        }
            // 状态为缓冲几乎完成，可以连续播放

            break;

        case MPMovieLoadStateStalled:

        {
//            [self.playerController pause];
//            [self.activiityIndicator startAnimating];

        }
            // 缓冲中

            break;

        case MPMovieLoadStateUnknown:
            
            //未知状态
            
            break;
            
        default:
            
            break;
            
    }
}


#pragma mark 播放状态的代理
/*
typedef NS_ENUM(NSInteger, MPMoviePlaybackState) {
    MPMoviePlaybackStateStopped,//停止播放
    MPMoviePlaybackStatePlaying,//正在播放
    MPMoviePlaybackStatePaused,//暂停播放
    MPMoviePlaybackStateInterrupted,//中断播放
    MPMoviePlaybackStateSeekingForward,//快进
    MPMoviePlaybackStateSeekingBackward//快退
};

*/
- (void)playerPlaybackState:(NSNotification *)noti
{

       if (self.playerController.playbackState == MPMoviePlaybackStatePlaying) {
           //播放状态
           [self.activiityIndicator stopAnimating];
       }else{
           //非播放状态
           [self.activiityIndicator startAnimating];
       }



}

#pragma mark 传递url播放视频
- (void)setUrl:(NSString *)url
{
    _url = [url copy];
    self.playerController.contentURL = [NSURL URLWithString:url];
    [self.playerController play];
}
#pragma mark - 懒加载代码

- (MPMoviePlayerController *)playerController
{
    if (_playerController == nil) {
        // 1.获取视频的URL
        NSURL *url = [NSURL URLWithString:self.url];

        // 2.创建播放控制器
        _playerController = [[MPMoviePlayerController alloc] initWithContentURL:url];

        [self addSubview:_playerController.view];
        // 3.设置属性
        _playerController.controlStyle = MPMovieControlStyleFullscreen;
        _playerController.shouldAutoplay = YES;//自动播放
        _playerController.backgroundView.backgroundColor = [UIColor grayColor];
        [_playerController setFullscreen:YES animated:YES];
//        _playerController.scalingMode = MPMovieScalingModeAspectFit;
        _playerController.controlStyle = MPMovieControlStyleNone;//无控制器
    }
    return _playerController;
}
#pragma mark 菊花
- (UIActivityIndicatorView *)activiityIndicator
{
    if (!_activiityIndicator) {
        UIActivityIndicatorView *indicatorView = [[UIActivityIndicatorView alloc]init];
        [self addSubview:indicatorView];
        indicatorView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.75];
        indicatorView.layer.cornerRadius = 5;
        indicatorView.layer.masksToBounds = YES;
         _activiityIndicator = indicatorView;
        _activiityIndicator.hidesWhenStopped = YES;
        _activiityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyleWhiteLarge;
        [_activiityIndicator stopAnimating];
    }
    return _activiityIndicator;
}
#pragma mark 布局子控件
- (void)layoutSubviews
{
    [super layoutSubviews];
     _playerController.view.frame =[UIScreen mainScreen].bounds;
    _activiityIndicator.frame = CGRectMake(0, 0, 50, 50);
    _activiityIndicator.center = self.center;

}
#pragma mark 移除观察者
- (void)dealloc
{
    [self.playerController.view removeFromSuperview];
    self.playerController = nil;
    self.activiityIndicator = nil;
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}

@end
