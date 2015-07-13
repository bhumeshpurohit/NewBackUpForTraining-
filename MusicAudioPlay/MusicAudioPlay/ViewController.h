//
//  ViewController.h
//  MusicAudioPlay
//
//  Created by Bhumesh on 26/06/15.
//  Copyright (c) 2015 Zaptech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface ViewController : UIViewController
@property (nonatomic, retain) IBOutlet UIButton *playPauseButton;
@property (nonatomic, retain) IBOutlet UISlider *volumeControl;
@property (nonatomic, retain) IBOutlet UILabel *alertLabel;

@property (nonatomic, retain) AVAudioPlayer *audioPlayer;

- (IBAction)volumeDidChange:(id)slider; //handle the slider movement
- (IBAction)togglePlayingState:(id)button; //handle the button tapping

- (void)playAudio; //play the audio
- (void)pauseAudio; //pause the audio
- (void)togglePlayPause; //toggle the state of the audio
@end

