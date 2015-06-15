//
//  FISJukeBoxViewController.m
//  JukeboxViews
//
//  Created by Yoseob Lee on 6/15/15.
//  Copyright (c) 2015 FIS. All rights reserved.
//

#import "FISJukeBoxViewController.h"

@interface FISJukeBoxViewController ()
@property (nonatomic, strong) FISPlaylist *playlist;
@property (weak, nonatomic) IBOutlet UITextView *playlistView;
@property (weak, nonatomic) IBOutlet UITextField *songChoice;


- (IBAction)playButton:(id)sender;
- (IBAction)stopButton:(id)sender;
- (IBAction)sortByTitle:(id)sender;
- (IBAction)sortByArtist:(id)sender;
- (IBAction)sortByAlbum:(id)sender;

@end

@implementation FISJukeBoxViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.playlist = [[FISPlaylist alloc]init];
    [self updatePlaylistView];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation
 

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)playButton:(id)sender {
    NSNumber *songNumber = [NSNumber numberWithInteger:[self.songChoice.text integerValue]];
    FISSong *song = [self.playlist songAtPosition:songNumber];

    NSString *songFile = song.fileName;
    [self setupAVAudioPlayWithFileName:songFile];
    [self.audioPlayer play];
}

- (IBAction)stopButton:(id)sender {
    [self.audioPlayer stop];
}

- (IBAction)sortByTitle:(id)sender {
    [self.playlist sortSongsByTitle];
    [self updatePlaylistView];
}

- (IBAction)sortByArtist:(id)sender {
    [self.playlist sortSongsByArtist];
    [self updatePlaylistView];
}

- (IBAction)sortByAlbum:(id)sender {
    [self.playlist sortSongsByAlbum];
    [self updatePlaylistView];
}


- (void)updatePlaylistView
{
    NSString *string = [NSString stringWithFormat:@"%@", self.playlist];
    self.playlistView.text = string;
}

- (void)setupAVAudioPlayWithFileName:(NSString *)fileName
{
    NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                         pathForResource:fileName
                                         ofType:@"mp3"]];
    NSError *error;
    self.audioPlayer = [[AVAudioPlayer alloc]
                        initWithContentsOfURL:url
                        error:&error];
    if (error)
    {
        NSLog(@"Error in audioPlayer: %@",
              [error localizedDescription]);
    } else {
        [self.audioPlayer prepareToPlay];
    }
}

@end
