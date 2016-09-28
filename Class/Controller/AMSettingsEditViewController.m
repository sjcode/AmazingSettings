//
//  AMSettingsEditViewController.m
//  AmazingSettings
//
//  Created by sujian on 16/9/23.
//  Copyright © 2016年 sujian. All rights reserved.
//

#import "AMSettingsEditViewController.h"
#import <ReactiveCocoa.h>
#import "AMSettingsElement+RACCommandSupport.h"
#import "RACCommand+MBProgressHUD.h"
#import "AMSettingsTextElement.h"
#import "AMSettingsTextCell.h"
#import "MBProgressHUD.h"

@interface AMSettingsEditViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UITextField *textField;
@end

@implementation AMSettingsEditViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    self.navigationController.navigationBar.backItem.title = @"";
    self.tableView = ({
        UITableView *tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
        tableView.dataSource = self;
        tableView.delegate = self;
        tableView;
    });
    [self.tableView registerClass:[AMTextEntryTableViewCell class] forCellReuseIdentifier:@"AMTextEntryTableViewCell"];
    [self.view addSubview:self.tableView];
    
    UITapGestureRecognizer *gestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideKeyboard)];
    [self.tableView addGestureRecognizer:gestureRecognizer];
    
    
    UIBarButtonItem *right = [[UIBarButtonItem alloc]initWithTitle:@"Save" style:UIBarButtonItemStylePlain target:self action:@selector(onSave:)];
    self.navigationItem.rightBarButtonItem = right;
    
    UIBarButtonItem *left = [[UIBarButtonItem alloc]initWithTitle:@"Cancel" style:UIBarButtonItemStylePlain target:self action:@selector(onCancel:)];
    self.navigationItem.leftBarButtonItem = left;
    @weakify(self)
    [self.element.rac_command addProgressHUDWithParentView:self.navigationController.view
                                                processing:@"Saving..."
                                                 successed:@"Successed"
                                                    failed:@"Fail"
                                          successcompleted:^{
                                              @strongify(self)
                                              [self.navigationController popViewControllerAnimated:YES];
                                          } failcompleted:^{
                                              @strongify(self)
                                              [self.navigationController popViewControllerAnimated:YES];
                                          }];
}

- (void) hideKeyboard {
    [self.view endEditing:YES];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    AMTextEntryTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"AMTextEntryTableViewCell" forIndexPath:indexPath];
    AMSettingsTextElement *element = (AMSettingsTextElement*)self.element;
    cell.textField.text = element.value;
    cell.textField.placeholder = element.placeholder;
    //cell.textField.maxLength = element.maxLength;

    
    self.textField = cell.textField;
    return cell;
}

- (void)onSave:(id)sender{
    [self.view endEditing:YES];
    if (self.textField.text.length < self.element.mixLength) {
        NSString *message = [NSString stringWithFormat:@"%@至少%ld个字",self.title,self.element.mixLength];
        MBProgressHUD *progressHUD = [MBProgressHUD showHUDAddedTo:self.navigationController.view animated:YES];
        progressHUD.customView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"icon_progress_failed"]];
        progressHUD.mode = MBProgressHUDModeCustomView;
        progressHUD.labelText = message;
        [progressHUD hide:YES afterDelay:1];
    }else{
        [self.element.rac_command execute:self.textField.text];
    }
}

- (void)onCancel:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
}


@end
