//
//  HTTPRequest.m
//  HTTPRequest
//
//  Created by lijun on 16/12/13.
//
//

#import "HTTPRequest.h"

@interface HTTPRequest ()


@end

@implementation HTTPRequest

+(instancetype) sharedInstance {
    static dispatch_once_t onceToken;
    static HTTPRequest *sharedManager = nil;
    dispatch_once(&onceToken, ^{
        sharedManager = [[self class] manager];
    });
    return sharedManager;
}

+(id) allocWithZone:(struct _NSZone *)zone {
    return [self sharedInstance];
}

-(id) copy {
    return self;
}

-(nullable NSURLSessionDataTask *) jsonWithURLString:(NSString *)urlString parameters:(NSDictionary *)parameters success:(HTTPRequestJsonBlock)success error:(HTTPRequestErrorBlock)error {
    return [self jsonWithURLString:urlString parameters:parameters requestType:HTTPRequestTypeGet success:success error:error];
}

-(nullable NSURLSessionDataTask *) jsonWithURLString:(NSString *)urlString parameters:(NSDictionary *)parameters requestType:(HTTPRequestType)requestType success:(HTTPRequestJsonBlock)success error:(HTTPRequestErrorBlock)error {
    if (HTTPRequestTypeGet == requestType) {
       return [self GET:urlString parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            
        }];
    } else if (HTTPRequestTypePost == requestType) {
       return [self POST:urlString parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            
        }];
    }
    return nil;
}

#pragma mark-private 

-(void) p_defaultConfig {
    
}



@end
















































