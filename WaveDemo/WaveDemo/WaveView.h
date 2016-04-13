//
//  WaveView.h
//  WaveDemo
//
//  Created by jiejin on 16/4/8.
//  Copyright © 2016年 jiejin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WaveView : UIView

/**
 *  The speed of wave 波浪的快慢
 */
@property (nonatomic,assign)CGFloat waveSpeed;

/**
 *  The amplitude of wave 波浪的震荡幅度
 */
@property (nonatomic,assign)CGFloat waveAmplitude; // 波浪的震荡幅度

/**
 *  wave height  波浪高度
 */
@property (nonatomic, assign) CGFloat waveBottomHeight;

/**
 *  Start waving
 */
-(void)start;

/**
 *  Stop waving
 */
-(void)stop;

@end
