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
#import "AMSettingsOptionElement.h"
#import "AMSettingsOptionViewController.h"
#import "AMSettingsImageElement.h"
#import "AMSettingsImageCell.h"
#import "AMSettingsImageController.h"


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
    self.navigationController.navigationBar.backItem.title = @"";
    self.tableView = ({
        UITableView *tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
        tableView.dataSource = self;
        tableView.delegate = self;
        tableView;
    });
    [self.view addSubview:self.tableView];
    
    [self.tableView registerClass:[AMSettingsCell class] forCellReuseIdentifier:@"AMSettingsCell"];
    [self.tableView registerClass:[AMSettingsTextCell class] forCellReuseIdentifier:@"AMSettingsTextCell"];
    [self.tableView registerClass:[AMSettingsImageCell class] forCellReuseIdentifier:@"AMSettingsImageCell"];
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
    }else if([element isKindOfClass:[AMSettingsOptionElement class]]){
        AMSettingsTextCell *cell = [tableView dequeueReusableCellWithIdentifier:@"AMSettingsTextCell" forIndexPath:indexPath];
        [cell configCell:element];
        return cell;
    }else if([element isKindOfClass:[AMSettingsImageElement class]]){
        AMSettingsImageCell *cell = [tableView dequeueReusableCellWithIdentifier:@"AMSettingsImageCell" forIndexPath:indexPath];
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

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    AMSettingsElement *element = [self elementAtIndexPath:indexPath];
    if([element isKindOfClass:[AMSettingsImageElement class]]){
        return 70;
    }else{
        return 44;
    }
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    AMSettingsSection *settingsSection = self.viewModel.dataSource[section];
    return settingsSection.title;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    UIViewController *viewController;
    AMSettingsElement *element = [self elementAtIndexPath:indexPath];
    if ([element isKindOfClass:[AMSettingsTextElement class]]) {
        AMSettingsEditViewController *editViewController = [[AMSettingsEditViewController alloc]init];
        editViewController.element = (AMSettingsTextElement*)element;
        viewController = editViewController;
    }else if([element isKindOfClass:[AMSettingsOptionElement class]]){
        AMSettingsOptionViewController *optionViewController = [[AMSettingsOptionViewController alloc]init];
        optionViewController.element = (AMSettingsOptionElement*)element;
        viewController = optionViewController;
    }else if([element isKindOfClass:[AMSettingsImageElement class]]){
        AMSettingsImageController *imageController = [[AMSettingsImageController alloc]init];
        imageController.element = (AMSettingsImageElement*)element;
        viewController = imageController;
    }
    if (viewController) {
        [self.navigationController pushViewController:viewController animated:YES];
    }   
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
