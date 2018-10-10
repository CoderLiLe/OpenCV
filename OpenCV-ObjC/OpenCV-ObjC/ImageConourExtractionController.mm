//
//  ImageConourExtractionController.m
//  OpenCV-ObjC
//
//  Created by LiLe on 2018/10/9.
//  Copyright © 2018年 LiLe. All rights reserved.
//

#import <opencv2/opencv.hpp>
#import <opencv2/imgproc/types_c.h>
#import <opencv2/imgcodecs/ios.h>

#import "ImageConourExtractionController.h"

@interface ImageConourExtractionController ()
{
    cv::Mat cvImage;
}

@property (strong, nonatomic) UIImageView *imgView;
@end

@implementation ImageConourExtractionController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    _imgView = [[UIImageView alloc] initWithFrame:CGRectMake(30, 180, self.view.frame.size.width-60, 280)];
    _imgView.layer.borderColor = [UIColor orangeColor].CGColor;
    _imgView.layer.borderWidth = 1;
    [self.view addSubview:_imgView];
    
    UIImage *image = [UIImage imageNamed:@"a"];
    
    UIImageToMat(image, cvImage);
    
    if (!cvImage.empty()) {
        cv::Mat gray;
        // 将图像转换为灰度显示
        cv::cvtColor(cvImage, gray, CV_RGB2GRAY);
        // 应用高斯滤波器去除小的边缘
        cv::GaussianBlur(gray, gray, cv::Size(5, 5), 1.2, 1.2);
        // 计算与画布边缘
        cv::Mat edges;
        cv::Canny(gray, edges, 0, 50);
        // 使用白色填充
        cvImage.setTo(cv::Scalar::all(255));
        // 修改边缘颜色
        cvImage.setTo(cv::Scalar(0, 128, 255, 255), edges);
        // 将Mat转换为UIImage显示
        self.imgView.image = MatToUIImage(cvImage);
    }
}

@end
