//
//  ViewController.m
//  Tap Me
//
//  Created by 林东杰 on 2/22/16.
//  Copyright © 2016 Joey. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
    @property (weak, nonatomic) IBOutlet UILabel *timerLabel;
    @property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
    @property (nonatomic) NSInteger count;
    @property (nonatomic) NSInteger seconds;
    @property (nonatomic) NSTimer *timer;

    @property (nonatomic) AVAudioPlayer *buttonBeep;
    @property (nonatomic) AVAudioPlayer *secondBeep;
    @property (nonatomic) AVAudioPlayer *backgroundMusic;

@end

@implementation ViewController



#pragma mark - Constants

#pragma mark - Variables

#pragma mark - Properties

#pragma mark - Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_tile"]];
    _scoreLabel.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"field_score"]];
    _timerLabel.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"field_time"]];
    
    _buttonBeep = [self setupAudioPlayerWithFile:@"ButtonTap" type:@"wav"];
    _secondBeep = [self setupAudioPlayerWithFile:@"SecondBeep" type:@"wav"];
    _backgroundMusic = [self setupAudioPlayerWithFile:@"HallOfTheMountainKing" type:@"mp3"];

    [self setupGame];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - TableView Delegate

#pragma mark - TableView Data Source

#pragma mark - Custom Delegate
-(void)UIAlertView:(UIAlertView *)UIAlertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    [self setupGame];
}

#pragma mark - Event Response

#pragma mark - Private Methods
-(IBAction)buttonPressed{
    _count++;
    _scoreLabel.text = [NSString stringWithFormat:@"Score\n%li",_count];
    
    [_buttonBeep play];
}

-(void)setupGame {
    //1
    _seconds = 10;
    _count = 0;
    
    //2
    _timerLabel.text = [NSString stringWithFormat:@"Time:%li",_seconds];
    _scoreLabel.text = [NSString stringWithFormat:@"Score\n%li",_count];
    
    //3
    _timer = [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(subtractTime) userInfo:nil repeats:YES];
    
    [_backgroundMusic setVolume:0.3];
    [_backgroundMusic play];
    
}

-(void)subtractTime {
    //1
    _seconds--;
    _timerLabel.text = [NSString stringWithFormat:@"Time:%li",_seconds];
    
    [_secondBeep play];
    //2
    if (_seconds == 0) {
        [_timer invalidate];
        
//        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Timer is up!" message:[NSString stringWithFormat:@"You scored %li point",_count] delegate:self cancelButtonTitle:@"Play Again" otherButtonTitles:@"Play Again", nil];
//        [alert show];
    }
    
}

-(AVAudioPlayer *)setupAudioPlayerWithFile:(NSString *)file type:(NSString *)type {
    //1
    NSString *path = [[NSBundle mainBundle] pathForResource:file ofType:type];
    NSURL *url=[NSURL fileURLWithPath:path];
    
    //2
    NSError *error;
    
    //3
    AVAudioPlayer *audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url fileTypeHint:nil error:&error];
    
    //4
    if (!audioPlayer) {
        NSLog(@"%@",[error description]);
    }
    return audioPlayer;
}
#pragma mark - Navigation


@end
































