//
//  HTTPRequest.h
//  HTTPRequest
//
//  Created by lijun on 16/12/13.
//
//

#import <Foundation/Foundation.h>
#import <AFNetworking.h>

typedef NS_ENUM(NSUInteger, HTTPRequestType) {
    HTTPRequestTypeGet,
    HTTPRequestTypePost,
};

// 异步多线程请求
// 取消所有请求/取消单个请求

@interface HTTPRequest : AFHTTPSessionManager

typedef void(^HTTPRequestJsonBlock)(id json);
typedef void(^HTTPRequestErrorBlock)(NSError *error);

+(instancetype) sharedInstance;

-(NSURLSessionDataTask *) jsonWithURLString:(NSString *)urlString parameters:(NSDictionary *)parameters success:(HTTPRequestJsonBlock)success error:(HTTPRequestErrorBlock)error;

-(NSURLSessionDataTask *) jsonWithURLString:(NSString *)urlString parameters:(NSDictionary *)parameters requestType:(HTTPRequestType)requestType success:(HTTPRequestJsonBlock)success error:(HTTPRequestErrorBlock)error;



-(void) cancelAllRequest;



@end
