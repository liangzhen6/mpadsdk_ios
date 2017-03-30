//
//  MPBannerView.m
//  MPAdvertisementSDK
//
//  Created by shenzhenshihua on 2016/11/7.
//  Copyright © 2016年 shenzhenshihua. All rights reserved.
//

#import "MPBannerView.h"
#import "DownloadData.h"
@interface MPBannerView ()<UIWebViewDelegate>
@property(nonatomic,strong)UIWebView *webView;
@end

@implementation MPBannerView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self initView];
        
    }
    
    return self;
}
- (void)initView{
    _webView = [[UIWebView alloc] initWithFrame:self.bounds];
    [self addSubview:_webView];
    
    _webView.userInteractionEnabled = NO;
    _webView.delegate = self;
    
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(touchAction:)];
    [self addGestureRecognizer:tap];


}
- (void)touchAction:(UIGestureRecognizer *)gestur{

    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://www.baidu.com"]];
    

}

- (void)loadRequest{

    if (self.adID.length) {
        [DownloadData downloadDataWithUrlStr:self.adID andDownloadBlock:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
            if (error) {//加载数据失败
                if ([self.delegate respondsToSelector:@selector(adView:didFailWithError:)]) {
                    [self.delegate adView:self didFailWithError:error];
                }
            }else{//加载数据成功
             [_webView loadData:data MIMEType:@"image/gif" textEncodingName:nil baseURL:nil];
            }
            
        }];
    }else{
        NSLog(@"NOadUnitID");
    }
}

- (void)loadRequestWithAdId:(NSString *)adID{
    self.adID = adID;
    [self loadRequest];
    
}

//加载成功完成 添加颜色
- (void)webViewDidFinishLoad:(UIWebView *)webView{
   [webView stringByEvaluatingJavaScriptFromString:@"document.getElementsByTagName('body')[0].style.background='#2E2E2E'"];
    if ([self.delegate respondsToSelector:@selector(adViewDidSuccess:)]) {
        [self.delegate adViewDidSuccess:self];
    }

}


/**
 webView加载失败的方法
 */
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    if ([self.delegate respondsToSelector:@selector(adView:didFailWithError:)]) {
        [self.delegate adView:self didFailWithError:error];
    }

}


//重写drawRect方法为了让webViwe的frame与superView一样
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    // Drawing code
    
     self.webView.frame = CGRectMake(0, 0, rect.size.width, rect.size.height);
    
    
}


@end
