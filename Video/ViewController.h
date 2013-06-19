//
//  ViewController.h
//  Video
//
//  Created by panda zheng on 13-4-7.
//  Copyright (c) 2013年 panda zheng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>

@interface ViewController : UIViewController
{
    MPMoviePlayerController *mpcontroller;
}

@property (nonatomic, strong) MPMoviePlayerController *mpcontroller;

@end
