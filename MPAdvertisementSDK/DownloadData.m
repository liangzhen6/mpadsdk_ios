//
//  DownloadData.m
//  MPAdvertisementSDK
//
//  Created by shenzhenshihua on 2016/11/4.
//  Copyright © 2016年 shenzhenshihua. All rights reserved.
//

#import "DownloadData.h"


@implementation DownloadData

+ (void)downloadDataWithUrlStr:(nullable NSString *)urlStr andDownloadBlock:(nullable void(^)(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error))downloadBlock;{
    if (!urlStr.length) {
        NSLog(@"urlIsInvalid");
        return;
    }
    NSURLSession * session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];//[[NSURLSession alloc] init];

    NSURL * url = [NSURL URLWithString:urlStr];
    
    NSURLSessionTask * task = [session dataTaskWithURL:url completionHandler:downloadBlock];
    
    [task resume];
    

}


@end
