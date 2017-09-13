//
//  AMSettingsOptionViewController.m
//  AmazingSettings
//
//  Created by sujian on 16/9/28.
//  Copyright © 2016年 sujian. All rights reserved.
//

#import "AMSettingsOptionViewController.h"
#import "AMSettingsOptionElement.h"
#import "RACCommand+MBProgressHUD.h"
#import "AMSettingsOptionCell.h"
#import "AMSettingsElement+RACCommandSupport.h"

@interface AMSettingsOptionViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) UITableView *tableView;
@end

@implementation AMSettingsOptionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = self.element.title;
    self.tableView = ({
        UITableView *tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
        [tableView registerClass:[AMSettingsOptionCell class] forCellReuseIdentifier:@"AMSettingsOptionCell"];
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.tableFooterView = [[UIView alloc]init];
        tableView;
    });
    
    [self.view addSubview:self.tableView];
    @weakify(self)
    [self.element.rac_command addProgressHUDWithParentView:self.tableView
                                                processing:@"保存中..."
                                                 successed:@"保存成功"
                                                    failed:@"保存失败"
                                          successcompleted:^{
                                              @strongify(self)
                                              [self.navigationController popViewControllerAnimated:YES];
                                          } failcompleted:^{
                                              @strongify(self)
                                              [self.navigationController popViewControllerAnimated:YES];
                                          }];
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    self.navigationController.navigationBar.backItem.title = @"";
}

#pragma mark - UITableViewDataSource & UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.element.options.count;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    AMSettingsOptionCell *cell = [tableView dequeueReusableCellWithIdentifier:@"AMSettingsOptionCell" forIndexPath:indexPath];
    [cell configCell:self.element.options[indexPath.row]];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    for (AMSettingsOptionModel *model in self.element.options) {
        model.marked = NO;
    }
    AMSettingsOptionModel *model = self.element.options[indexPath.row];
    model.marked = YES;
    [self.tableView reloadData];
    [self.element.rac_command execute:indexPath];
}

- (UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}

@end
