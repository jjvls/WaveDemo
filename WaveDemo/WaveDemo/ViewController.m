//
//  ViewController.m
//  WaveDemo
//
//  Created by jiejin on 16/4/8.
//  Copyright © 2016年 jiejin. All rights reserved.
//

#import "ViewController.h"
#import "WaveView.h"
#import "AnimatonBottonView.h"

@interface ViewController ()<AnimatonBottonViewDelegate>

@property (nonatomic, strong) WaveView *waveView;
@property (nonatomic, assign) BOOL isWaving;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.


    _waveView = [[WaveView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.bounds), CGRectGetHeight(self.view.bounds) - 0)];
    _waveView.waveSpeed = 6.0f;
    _waveView.waveAmplitude = 20.0f;
    _waveView.waveBottomHeight = 20;
     _waveView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:_waveView];
    [_waveView start];
    
    AnimatonBottonView *buttonView = [[AnimatonBottonView alloc] initWithFrame:CGRectMake(100, 200, 200, 60)];
    buttonView.delegate = self;
    buttonView.center = CGPointMake(self.view.center.x, self.view.center.y + 200);
    [self.view addSubview:buttonView];
    
    self.isWaving = YES;
}

#pragma mark - AnimatonBottonViewDelegate

- (void)buttonDidClick
{
    
    _waveView.waveBottomHeight += 20;
    if(self.isWaving){
    
        self.isWaving = NO;
        [_waveView stop];
    }else{
    
        self.isWaving = YES;
        [_waveView start];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
