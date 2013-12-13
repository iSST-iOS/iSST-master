//
//  ProgramsCell.h
//  iSST
//
//  Created by liuyang_sy on 13-12-12.
//  Copyright (c) 2013年 LY. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ISSTProgramsApi.h"
#include "ISSTWebApiDelegate.h"

@interface ProgramsCell : UITableViewCell <ISSTWebApiDelegate>

@property (strong, nonatomic) NSString *userId;     //投票API所需的userId
@property (assign, nonatomic) int showId;     //投票API所需的showId

@property (weak, nonatomic) ISSTProgramsApi *programsApi;

@property (weak, nonatomic) IBOutlet UILabel *programs;   //节目列表

@property (weak, nonatomic) IBOutlet UILabel *programsState;    //节目状态

- (IBAction)vote:(id)sender;   //投票动作

@end
