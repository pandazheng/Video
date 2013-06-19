//
//  ViewController.m
//  Video
//
//  Created by panda zheng on 13-4-7.
//  Copyright (c) 2013年 panda zheng. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize mpcontroller;

- (void)viewDidLoad
{
    NSString *loc = [[NSBundle mainBundle] pathForResource:@"sample_iTunes" ofType:@"mov"];
    NSURL *url = [NSURL fileURLWithPath:loc];
    
    //初始化播放器
    mpcontroller = [[MPMoviePlayerController alloc] initWithContentURL:url];
    
    //把播放器的视图添加到当前视图下（作为子视图）
    [self.view addSubview:mpcontroller.view];
    
    //设置frame，让它显示在屏幕上，分别是X,Y，宽度和高度，你可以调整
    mpcontroller.view.frame = CGRectMake(-80,80,480,300);
    [mpcontroller.view setTransform:CGAffineTransformMakeRotation(90.0f*(M_PI/180.0f))];
    
    //设置电影结束后的回调方法，方法名为：callbackFunction，注册自己为observer
    //当MPMoviePlayerPlaybackDidFinishNotification事件发生时，就调用指定的方法
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(callbackFunction:) name:MPMoviePlayerPlaybackDidFinishNotification object:mpcontroller];
    
    //设置播放器的一些属性
    mpcontroller.fullscreen = YES;
    mpcontroller.scalingMode = MPMovieScalingModeAspectFill;
    
    //播放电影
    [mpcontroller play];
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

//电影结束后的回调方法
- (void) callbackFunction: (NSNotification*) notification
{
    MPMoviePlayerController *video = [notification object];
    //从通知中心注销自己
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:MPMoviePlayerPlaybackDidFinishNotification object:video];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
