//
//  ViewController.m
//  涂鸦
//
//  Created by iqeggandroid on 15/4/19.
//  Copyright (c) 2015年 bingoogolapple. All rights reserved.
//

#import "ViewController.h"
#import "BGAPaintView.h"
#import "MBProgressHUD+NJ.h"
#import "BGAHandleImageView.h"

@interface ViewController ()<UINavigationControllerDelegate, UIImagePickerControllerDelegate>
@property (weak, nonatomic) IBOutlet BGAPaintView *paintView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)lineWidthChanged:(UISlider *)sender {
    self.paintView.lineWidth = sender.value;
}

- (IBAction)onClickColorBtn:(UIButton *)sender {
    self.paintView.lineColor = sender.backgroundColor;
}

- (IBAction)clearScreen:(id)sender {
    [self.paintView clearScreen];
}

- (IBAction)undo:(id)sender {
    [self.paintView undo];
}

- (IBAction)eraser:(id)sender {
    self.paintView.lineColor = [UIColor whiteColor];
}

- (IBAction)selectPicture:(id)sender {
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    picker.delegate = self;
    [self presentViewController:picker animated:YES completion:nil];
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    [self dismissViewControllerAnimated:YES completion:nil];
    UIImage *pickImage = info[UIImagePickerControllerOriginalImage];
    BGAHandleImageView *handleImageView = [[BGAHandleImageView alloc] initWithFrame:self.paintView.frame];
    handleImageView.image = pickImage;
    handleImageView.block = ^(UIImage *image) {
        self.paintView.image = image;
    };
    [self.view addSubview:handleImageView];
}

- (IBAction)save:(id)sender {
    UIGraphicsBeginImageContextWithOptions(self.paintView.bounds.size, NO, 0.0);
    // 把画板上得内容渲染到上下文
    [self.paintView.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    UIImageWriteToSavedPhotosAlbum(newImage, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
}

// 保存相册后回调
- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo {
    if(error) {
        [MBProgressHUD showError:@"保存失败"];
    } else {
        [MBProgressHUD showSuccess:@"成功"];
    }
}

@end
