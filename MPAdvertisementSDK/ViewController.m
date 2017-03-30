//
//  ViewController.m
//  MPAdvertisementSDK
//
//  Created by shenzhenshihua on 2016/11/4.
//  Copyright © 2016年 shenzhenshihua. All rights reserved.
//

#import "ViewController.h"
#import "MPBannerView.h"
#import "Masonry.h"
#import "VideoViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.view.backgroundColor = [UIColor redColor];
    
//    [self initView];
//    [self initVideo];
    UIButton * btn  = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    btn.backgroundColor = [UIColor redColor];
    [btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)initVideo{
//    VideoView *videoView = [[VideoView alloc]initWithFrame:self.view.bounds];
//    [self.view addSubview:videoView];
//    videoView.url = @"https://framework.realtime.co/blog/img/ios10-video.mp4";//@"vidoeUrl";
//    VideoViewController *VC= [[VideoViewController alloc] init];
//    VC.videoUrl = @"https://framework.realtime.co/blog/img/ios10-video.mp4";
//    
//    VC.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
//    VC.modalPresentationStyle = UIModalPresentationFullScreen;
//    [self presentViewController:VC animated:YES completion:^{
//        
//    }];
   
}


- (void)btnAction:(UIButton *)btn{

    VideoViewController *VC= [[VideoViewController alloc] init];
    VC.videoUrl = @"https://framework.realtime.co/blog/img/ios10-video.mp4";
    //    VC.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    //    VC.modalPresentationStyle = UIModalPresentationFullScreen;
    [self presentViewController:VC animated:YES completion:nil];
    
    
    NSURL * url= [NSURL URLWithString:@"https://framework.rig/ios10-video.mp4"];
    
    [self validateUrl:url];
    
    
}
- (void)initView{

    MPBannerView * bnner = [[MPBannerView alloc] init];
//    bnner.frame = CGRectMake(0, 0, 300, 50);

    bnner.backgroundColor = [UIColor redColor];
    [self.view addSubview:bnner];
    
//    self.view.backgroundColor = [UIColor redColor];
    
//    bnner.frame = CGRectMake(10, 10, 300, 50);
    [bnner mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(10);
        make.left.equalTo(self.view).offset(10);
        
        make.size.mas_equalTo(CGSizeMake(350, 60));
    }];
    bnner.adID = @"http://creative.mingpao.com/image/201610/jump-gleneagles_350x60_20161003_Rotational_Baby_Banner_App_Banner.gif";
    
    [bnner loadRequest];

}




- (NSURL *)smartURLForString:(NSString *)str
{
    NSURL *     result;
    NSString *  trimmedStr;
    NSRange     schemeMarkerRange;
    NSString *  scheme;
    
    assert(str != nil);
    
    result = nil;
    
    trimmedStr = [str stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    if ( (trimmedStr != nil) && (trimmedStr.length != 0) ) {
        schemeMarkerRange = [trimmedStr rangeOfString:@"://"];
        
        if (schemeMarkerRange.location == NSNotFound) {
            result = [NSURL URLWithString:[NSString stringWithFormat:@"http://%@", trimmedStr]];
        } else {
            scheme = [trimmedStr substringWithRange:NSMakeRange(0, schemeMarkerRange.location)];
            assert(scheme != nil);
            
            if ( ([scheme compare:@"http"  options:NSCaseInsensitiveSearch] == NSOrderedSame)
                || ([scheme compare:@"https" options:NSCaseInsensitiveSearch] == NSOrderedSame) ) {
                result = [NSURL URLWithString:trimmedStr];
            } else {
                // It looks like this is some unsupported URL scheme.
            }
        }
    }
    
    return result;
}

-(void) validateUrl: (NSURL *) candidate {
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:candidate];
    [request setHTTPMethod:@"HEAD"];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSLog(@"error %@",error);
        if (error) {
            NSLog(@"不可用");
            
        }else{
            NSLog(@"可用");
        }
    }];
    [task resume];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
