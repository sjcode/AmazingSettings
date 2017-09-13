//
//  AMSettingsImageController.m
//  AmazingSettings
//
//  Created by sujian on 16/9/29.
//  Copyright © 2016年 sujian. All rights reserved.
//

#import "AMSettingsImageController.h"
#import "AMSettingsElement+RACCommandSupport.h"
#import <MBProgressHUD.h>
#import <SDWebImage/UIImageView+WebCache.h>
#import "AMSettingsImageElement.h"
#import "RACCommand+MBProgressHUD.h"
#import "WLActionSheet.h"

@interface AMSettingsImageController ()<UIScrollViewDelegate,UINavigationControllerDelegate, UIImagePickerControllerDelegate>
@property (nonatomic, strong) UIImageView *imageView;
@end

@implementation AMSettingsImageController


- (void)viewDidLoad{
    [super viewDidLoad];
    
    self.title = self.element.title;
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIBarButtonItem *left = [[UIBarButtonItem alloc]initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(onCancel:)];
    self.navigationItem.leftBarButtonItem = left;
    
    UIButton *more = [UIButton buttonWithType:UIButtonTypeCustom];
    [more setImage:[UIImage imageNamed:@"icon_popmenu"] forState:UIControlStateNormal];
    [more sizeToFit];
    [more addTarget:self action:@selector(open:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *right = [[UIBarButtonItem alloc]initWithCustomView:more];
    self.navigationItem.rightBarButtonItem = right;
    
    _imageView = [[UIImageView alloc]initWithFrame:self.view.bounds];
    _imageView.contentMode = UIViewContentModeScaleAspectFit;
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:self.element.imagefile] placeholderImage:[UIImage imageNamed:@"bk_pic_placeholder"]];
    
    [self.view addSubview:_imageView];
    
    @weakify(self)
    
    [self.element.rac_command addProgressHUDWithParentView:self.view processing:@"保存中..." successed:@"保存成功" failed:@"保存失败" successcompleted:^{
        @strongify(self)
        [self.navigationController popViewControllerAnimated:YES];
    } failcompleted:^{
        @strongify(self)
        [self.navigationController popViewControllerAnimated:YES];
    }];
}

- (void)open:(id)sender{
    @weakify(self)
    WLActionSheet *sheet = [[WLActionSheet alloc] initWithTitle:@"选择图片" cancelTitle:@"取消" otherTitles:@[@"拍照",@"相册"]];
    sheet.destructiveButtonIndex = 0;
    [sheet showView];
    [sheet dismissForCompletionHandle:^(NSInteger clickedIndex, BOOL isCancel) {
        NSLog(@"%@ == %@", @(clickedIndex), isCancel ? @"YES" : @"NO");
        if (!isCancel) {
            UIImagePickerController *picker = [[UIImagePickerController alloc]init];
            picker.delegate = self;
            picker.sourceType = clickedIndex == 1 ? UIImagePickerControllerSourceTypePhotoLibrary : UIImagePickerControllerSourceTypeCamera;
            picker.allowsEditing = YES;
            if(clickedIndex == 0){
                picker.cameraDevice = UIImagePickerControllerCameraDeviceRear;
            }
            
            [[self rac_signalForSelector:@selector(imagePickerController:didFinishPickingMediaWithInfo:) fromProtocol:@protocol(UIImagePickerControllerDelegate)]subscribeNext:^(RACTuple *tuple) {
                NSDictionary *info = tuple.second;
                [picker dismissViewControllerAnimated:YES completion:^{
                    @strongify(self)
                    [self.element.rac_command execute:[info objectForKey:UIImagePickerControllerEditedImage]];
                }];
            }];
            [[self rac_signalForSelector:@selector(imagePickerControllerDidCancel:) fromProtocol:@protocol(UIImagePickerControllerDelegate)]subscribeNext:^(id x) {
                NSLog(@"imagePickerControllerDidCancel");
                [picker dismissViewControllerAnimated:YES completion:^{}];
            }];
            
            picker.navigationBar.translucent = NO;
            picker.navigationBar.barTintColor = [UIColor colorWithWhite:0.126 alpha:1.000];
            picker.navigationBar.tintColor = [UIColor whiteColor];
            
            [self presentViewController:picker animated:YES completion:nil];
        }
    }];
}

- (void)onCancel:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
}

- (UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}
@end
