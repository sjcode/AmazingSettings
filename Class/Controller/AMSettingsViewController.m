//
//  AMSettingsViewController.m
//  AmazingSettings
//
//  Created by sujian on 16/9/23.
//  Copyright © 2016年 sujian. All rights reserved.
//

#import "AMSettingsViewController.h"
#import "AMSettingsViewModel.h"
#import "AMSettingsSection.h"
#import "AMSettingsCell.h"
#import "AMSettingsElement+Appearance.h"
#import "AMSettingsTextElement.h"
#import "AMSettingsTextCell.h"
#import "AMSettingsEditViewController.h"

@interface AMSettingsViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong, readwrite) AMSettingsViewModel *viewModel;
@end

@implementation AMSettingsViewController

- (instancetype)initWithViewModel:(id)viewModel{
    self = [super init];
    if (self) {
        self.viewModel = viewModel;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView = ({
        UITableView *tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
        tableView.dataSource = self;
        tableView.delegate = self;
        tableView;
    });
    [self.view addSubview:self.tableView];
    
    [self.tableView registerClass:[AMSettingsCell class] forCellReuseIdentifier:@"AMSettingsCell"];
    [self.tableView registerClass:[AMSettingsTextCell class] forCellReuseIdentifier:@"AMSettingsTextCell"];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.viewModel.dataSource.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    AMSettingsSection *settingsSection = self.viewModel.dataSource[section];
    return settingsSection ? settingsSection.elements.count : 0;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    AMSettingsElement *element = [self elementAtIndexPath:indexPath];
    if ([element isKindOfClass:[AMSettingsTextElement class]]) {
        AMSettingsTextCell *cell = [tableView dequeueReusableCellWithIdentifier:@"AMSettingsTextCell" forIndexPath:indexPath];
        [cell configCell:element];
        return cell;
    }else{
        AMSettingsCell *cell = [tableView dequeueReusableCellWithIdentifier:@"AMSettingsCell" forIndexPath:indexPath];
        return cell;
    }
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    AMSettingsSection *settingsSection = self.viewModel.dataSource[indexPath.section];
    AMSettingsElement *element =  settingsSection.elements[indexPath.row];
    if(element.appearance.cellBackgroundColor){
        cell.contentView.backgroundColor = element.appearance.cellBackgroundColor;
    }
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    AMSettingsSection *settingsSection = self.viewModel.dataSource[section];
    return settingsSection.title;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    AMSettingsElement *element = [self elementAtIndexPath:indexPath];
    AMSettingsEditViewController *viewController = [[AMSettingsEditViewController alloc]init];
    viewController.element = (AMSettingsTextElement*)element;
    
    [self.navigationController pushViewController:viewController animated:YES];
}

- (AMSettingsElement*)elementAtIndexPath:(NSIndexPath*)indexPath{
    AMSettingsSection *settingssection = self.viewModel.dataSource[indexPath.section];
    AMSettingsElement *element = settingssection.elements[indexPath.row];
    return element;
}

- (UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}

@end
