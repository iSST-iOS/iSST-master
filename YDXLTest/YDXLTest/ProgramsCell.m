//
//  ProgramsCell.m
//  iSST
//
//  Created by liuyang_sy on 13-12-12.
//  Copyright (c) 2013年 LY. All rights reserved.
//

#import "ProgramsCell.h"

@implementation ProgramsCell

@synthesize userId, showId, programsApi;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)requestDataOnSuccess:(id)backToControllerData;
{
    NSDictionary *dict = (NSDictionary*)backToControllerData;
    NSString *codeString  = [dict objectForKey:@"code"];
    //NSString *messageString = [dict objectForKey:@"message"];
    if (![codeString isEqualToString:@"0"]) {  //返回结果正确
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"投票完成" message:@"谢谢你投的宝贵一票" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil];
        [alert show];
    } else {     //返回结果错误
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"投票出错" message:@"请返回重新投票" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil];
        [alert show];
    }
}

- (void)requestDataOnFail:(NSString *)error
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"您好:" message:error delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil];
    [alert show];
}

- (IBAction)vote:(id)sender {
    self.programsApi = [[ISSTProgramsApi alloc] init];
    self.programsApi.webApiDelegate =self;
    self.userId = @"1";
    self.showId = 1;
    NSLog(@"点解了此处");
    [self.programsApi voteWithUserId:self.userId WithShowID:self.showId];
    NSLog(@"点解了此处11");
}

@end
