//
//  FOXSakuraViewController.m
//  CAEmitterAnimation
//
//  Created by XFoxer on 16/4/26.
//  Copyright © 2016年 XFoxer. All rights reserved.
//

#import "FOXSakuraViewController.h"

@interface FOXSakuraViewController ()

@end

@implementation FOXSakuraViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self createEmitterView];
}




- (void)createEmitterView
{
    UIImageView *backgroundView = [[UIImageView alloc]initWithFrame:self.view.bounds];
    [backgroundView setImage:[UIImage imageNamed:@"sakuraTree_1"]];
    [backgroundView setContentMode:UIViewContentModeScaleAspectFill];
    [self.view addSubview:backgroundView];
    
    
    CAEmitterLayer *dropEmitterLayer = [CAEmitterLayer layer];
    dropEmitterLayer.emitterPosition = CGPointMake(100, -30);
    dropEmitterLayer.emitterSize     = CGSizeMake(self.view.bounds.size.width*2, 0);
    dropEmitterLayer.emitterMode     = kCAEmitterLayerOutline;
    dropEmitterLayer.emitterShape    = kCAEmitterLayerLine;
    dropEmitterLayer.renderMode      = kCAEmitterLayerAdditive;
    
    
    CAEmitterCell *dropCell = [CAEmitterCell emitterCell];
    dropCell.contents = (__bridge id)[UIImage imageNamed:@"sakura_2"].CGImage;
    
    //花瓣缩放比例
    dropCell.scale = 0.02;
    dropCell.scaleRange = 0.5;
    
    //每秒产生的花瓣数量
    dropCell.birthRate = 8;
    dropCell.lifetime = 80;
    
    //每秒花瓣变成透明的速度
    dropCell.alphaSpeed = - 0.01;
    
    //秒速 。。。
    dropCell.velocity = 40;
    dropCell.velocityRange = 60;
    
    //花瓣掉落的角度范围
    dropCell.emissionRange = M_PI;
    
    //花瓣旋转的速度
    dropCell.spin = M_PI_4;
    
    // 阴影化开的程度（就像墨水滴在宣纸上化开那样）
    dropEmitterLayer.shadowRadius = 8;
    dropEmitterLayer.shadowOpacity =1;
    dropEmitterLayer.shadowOffset = CGSizeMake(3, 3);
    dropEmitterLayer.shadowColor = [UIColor whiteColor].CGColor;
    
    dropEmitterLayer.emitterCells = [NSArray arrayWithObject:dropCell];
    [backgroundView.layer addSublayer:dropEmitterLayer];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
