//
//  RootViewController.m
//  OpenCV-ObjC
//
//  Created by LiLe on 2018/10/9.
//  Copyright © 2018年 LiLe. All rights reserved.
//

#import "RootViewController.h"
#import "ImageConourExtractionController.h"
#import "FaceRecognitionController.h"

@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)imageConourExtraction {
    [self.navigationController pushViewController:[ImageConourExtractionController new] animated:YES];
}

- (IBAction)faceRecognition {
    [self.navigationController pushViewController:[FaceRecognitionController new] animated:YES];
}

@end
