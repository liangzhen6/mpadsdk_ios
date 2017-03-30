//
//  VideoViewController.m
//  MPAdvertisementSDK
//
//  Created by mac on 2016/11/8.
//  Copyright © 2016年 shenzhenshihua. All rights reserved.
//

#import "VideoViewController.h"
#import "VideoView.h"
@interface VideoViewController ()<VideoViewDelegate>
@property (nonatomic,weak)VideoView *videoView;
@end

@implementation VideoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor greenColor];
    [self initSubView];

}

- (void)initSubView
{
    VideoView *videoView = [[VideoView alloc]initWithFrame:self.view.bounds];
    [self.view addSubview:videoView];
    videoView.delegate = self;
    videoView.url = self.videoUrl;//@"vidoeUrl";
    self.videoView = videoView;
}

#pragma mark 销毁控制器
- (void)dismiss
{
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (void)videoViewDismissVideoViewController:(VideoView *)videoView
{
    [self dismiss];
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    if (self.videoView) {
         [self.videoView removeFromSuperview];
        self.videoView = nil;
    }

    [self dismiss];

    NSLog(@"touch began");
}
@end
