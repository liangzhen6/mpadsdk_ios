//
//  DownloadData.h
//  MPAdvertisementSDK
//
//  Created by shenzhenshihua on 2016/11/4.
//  Copyright © 2016年 shenzhenshihua. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DownloadData : NSObject

///** 请求类型
// - DownloadTypeGet: get 请求
// - DownloadTypePost: post 请求
// */
//typedef NS_ENUM(NSInteger,DownloadType){
//    
//    DownloadTypeGet = 0,
//    
//    DownloadTypePost
//
//};

+ (void)downloadDataWithUrlStr:(nullable NSString *)urlStr andDownloadBlock:(nullable void(^)(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error))downloadBlock;

@end
