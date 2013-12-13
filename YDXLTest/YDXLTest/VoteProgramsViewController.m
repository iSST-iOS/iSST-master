//
//  VoteProgramsViewController.m
//  iSST
//
//  Created by liuyang_sy on 13-12-11.
//  Copyright (c) 2013年 LY. All rights reserved.
//

#import "VoteProgramsViewController.h"

@interface VoteProgramsViewController ()

@end

@implementation VoteProgramsViewController

@synthesize programsApi;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.programsApi = [[ISSTProgramsApi alloc] init];
    self.programsApi.webApiDelegate =self;
	// Do any additional setup after loading the view.
    NSString *userId = @"1";
    [self.programsApi requestProgramsListWithUserId:userId];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"programs";
    ProgramsCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    if (cell == nil) {
        cell = [[ProgramsCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    return cell;

}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (void)requestDataOnSuccess:(id)backToControllerData;
{}

- (void)requestDataOnFail:(NSString *)error
{}

- (IBAction)refreshTableView:(id)sender {
    NSString *userId = @"1";
    [self.programsApi requestProgramsListWithUserId:userId];
}
@end
