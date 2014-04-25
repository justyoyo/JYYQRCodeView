//
//  JYYViewController.m
//  Example
//
//  Created by Tom Hutchinson on 12/02/2014.
//  Copyright (c) 2014 JustYoyo Ltd. All rights reserved.
//

#import "JYYViewController.h"
#import "JYYQRCodeImageView.h"

@interface JYYViewController ()

@property (strong, nonatomic) IBOutlet JYYQRCodeImageView *qrcodeImageView;

@end

@implementation JYYViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [_qrcodeImageView encodeString:@"Hello World!" withErrorCorrectionLevel:ErrorCorrectionLevelLow];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
