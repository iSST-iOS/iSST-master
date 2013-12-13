//
//  ISSTProgramsApi.m
//  iSST
//
//  Created by liuyang_sy on 13-12-12.
//  Copyright (c) 2013年 LY. All rights reserved.
//

#import "ISSTProgramsApi.h"

@implementation ISSTProgramsApi

@synthesize datas;
@synthesize webApiDelegate;

- (void)requestProgramsListWithUserId:(NSString *)userId   //获取列表
{
    self.method_id = PROGRAMS_LIST;
    datas = [NSMutableData new];
    NSString *subUrl = [NSString stringWithFormat:@"/users/%@/shows",userId];
    [super requestWithSuburl:subUrl Method:@"GET" Delegate:self Info:@""];
}

- (void)voteWithUserId:(NSString *)userId WithShowID:(int)showId    //投票
{
    NSLog(@"connect error");
    self.method_id = VOTE;
    datas = [NSMutableData new];
    NSString *subUrl = [NSString stringWithFormat:@"/users/%@/shows/%d/votes", userId, showId];
    
    
    
    [super requestWithSuburl:subUrl Method:@"POST" Delegate:self Info:@""];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    NSLog(@"error=%@",[error localizedDescription]);
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    [datas setLength:0];
    NSLog(@"请求完成一步");
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [datas appendData:data];
    NSLog(@"请求完成部分");
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSLog(@"请求完成");
    if (self.method_id == PROGRAMS_LIST){
        NSLog(@"datas = %@", datas);
    } else if (self.method_id == VOTE) {
        NSLog(@"datas = %@", datas);
        NSDictionary *dict = (NSDictionary *)[NSJSONSerialization JSONObjectWithData:datas options:NSJSONReadingAllowFragments error:nil];
        [self.webApiDelegate requestDataOnSuccess:dict];
    }
}


@end
