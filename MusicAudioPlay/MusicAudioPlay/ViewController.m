//
//  ViewController.m
//  MusicAudioPlay
//
//  Created by Bhumesh on 26/06/15.
//  Copyright (c) 2015 Zaptech. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize playPauseButton;
@synthesize volumeControl;
@synthesize alertLabel;
@synthesize audioPlayer;

- (IBAction)volumeDidChange:(UISlider *)slider {
    //Handle the slider movement
    [audioPlayer setVolume:[slider value]];
}

- (IBAction)togglePlayingState:(id)button {
    //Handle the button pressing
    [self togglePlayPause];
}
- (void)viewDidLoad {
    [super viewDidLoad];
  
//   NSURL *audioFileLocationURL = [[NSBundle mainBundle] URLForResource:@"sound" withExtension:@"caf"];
//   NSURL *tmp=[NSURL fileURLWithPath:@"sound.caf"];
// 
//    NSData *audioData = [NSData dataWithContentsOfURL:tmp];
//    NSString *docDirPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
//    NSString *filePath = [NSString stringWithFormat:@"%@/%@.caf", docDirPath , @"sound"];
//    [audioData writeToFile:filePath atomically:YES];
//    
//    NSError *error;
//    NSURL *fileURL = [NSURL fileURLWithPath:filePath];
//    audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:fileURL error:&error];
//    if (audioPlayer == nil) {
//        NSLog(@"AudioPlayer did not load properly: %@", [error description]);
//    } else {
//        [audioPlayer play];
//    }
    
    // Construct URL to sound file
    NSString *path = [NSString stringWithFormat:@"%@/sound.mp3", [[NSBundle mainBundle] resourcePath]];
    NSURL *soundUrl = [NSURL fileURLWithPath:path];
    
    // Create audio player object and initialize with URL to sound
    audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:soundUrl error:nil];
    [audioPlayer play];
    
    
    
    
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    
    //Once the view has loaded then we can register to begin recieving controls and we can become the first responder
    [[UIApplication sharedApplication] beginReceivingRemoteControlEvents];
    [self becomeFirstResponder];
}
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    //End recieving events
    [[UIApplication sharedApplication] endReceivingRemoteControlEvents];
    [self resignFirstResponder];
}
- (void)playAudio {
    //Play the audio and set the button to represent the audio is playing
    [audioPlayer play];
    [playPauseButton setTitle:@"Pause" forState:UIControlStateNormal];
}
- (void)pauseAudio {
    //Pause the audio and set the button to represent the audio is paused
    [audioPlayer pause];
    [playPauseButton setTitle:@"Play" forState:UIControlStateNormal];
}

- (void)togglePlayPause {
    //Toggle if the music is playing or paused
    if (!self.audioPlayer.playing) {
        [self playAudio];
        
    } else if (self.audioPlayer.playing) {
        [self pauseAudio];
        
    }
}
-(BOOL)canBecomeFirstResponder {
    return YES;
}

- (void)remoteControlReceivedWithEvent:(UIEvent *)event {
    //if it is a remote control event handle it correctly
    if (event.type == UIEventTypeRemoteControl) {
        if (event.subtype == UIEventSubtypeRemoteControlPlay) {
            [self playAudio];
        } else if (event.subtype == UIEventSubtypeRemoteControlPause) {
            [self pauseAudio];
        } else if (event.subtype == UIEventSubtypeRemoteControlTogglePlayPause) {
            [self togglePlayPause];
        }
    }
}

@end
