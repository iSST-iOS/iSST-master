//
//  VoteProgramsViewController.h
//  iSST
//
//  Created by liuyang_sy on 13-12-11.
//  Copyright (c) 2013年 LY. All rights reserved.
//

#import <UIKit/UIKit.h>
#include "ProgramsCell.h"
#include "ISSTProgramsApi.h"
#include "ISSTWebApiDelegate.h"

@interface VoteProgramsViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, ISSTWebApiDelegate>

@property (weak, nonatomic) ISSTProgramsApi *programsApi;

- (IBAction)refreshTableView:(id)sender;  //刷新列表

@end
