//
//  FISJukeBoxViewController.h
//  JukeboxViews
//
//  Created by Yoseob Lee on 6/15/15.
//  Copyright (c) 2015 FIS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FISPlaylist.h"
#import <AVFoundation/AVFoundation.h>

@interface FISJukeBoxViewController : UIViewController
@property (nonatomic, strong) AVAudioPlayer *audioPlayer;

@end
