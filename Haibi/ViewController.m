//
//  ViewController.m
//  Haibi
//
//  Created by 作田諒 on 2015/04/09.
//  Copyright (c) 2015年 myname. All rights reserved.
//

#import "ViewController.h"
#import "NSTimer+Blocks.h"
#import "HaibiModel.h"

#import "ResultView.h"

#import <AVFoundation/AVFoundation.h>


@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *haibiImage;
@property (weak, nonatomic) IBOutlet UIButton *pusuButton;
@property (weak, nonatomic) IBOutlet UILabel *counter;
@property (weak, nonatomic) IBOutlet UILabel *awardLabel;

@property (weak, nonatomic) IBOutlet UIButton *soundButton;

@end

@implementation ViewController{
    
    int settingNum;
    int count;
    BOOL flash;
    BOOL onSound;
    NSTimer *timer;
    AVAudioPlayer *sound;
    ResultView *resultView;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSMutableDictionary *defaults = [NSMutableDictionary dictionary];
    [defaults setObject:@"0" forKey:@"TotalCount"];
    [defaults setObject:@"0" forKey:@"TotalHaibi"];
    [defaults setObject:@"0" forKey:@"Complete"];
    
    //光り方
    [defaults setObject:[NSNumber numberWithBool:NO] forKey:@"nomalFlash"];
    [defaults setObject:[NSNumber numberWithBool:NO] forKey:@"speedFlash"];
    [defaults setObject:[NSNumber numberWithBool:NO] forKey:@"slowFlash"];
    [defaults setObject:[NSNumber numberWithBool:NO] forKey:@"flowerFlash"];
    [defaults setObject:[NSNumber numberWithBool:NO] forKey:@"leafFlash"];
    [defaults setObject:[NSNumber numberWithBool:NO] forKey:@"lightingFlash"];
    [defaults setObject:[NSNumber numberWithBool:NO] forKey:@"winkFlash"];
    [defaults setObject:[NSNumber numberWithBool:NO] forKey:@"thumderFlash"];
    [defaults setObject:[NSNumber numberWithBool:NO] forKey:@"bombFlash"];
    [defaults setObject:[NSNumber numberWithBool:NO] forKey:@"waveFlash"];
    
    [[NSUserDefaults standardUserDefaults] registerDefaults:defaults];
    
    resultView = [[NSBundle mainBundle] loadNibNamed:@"ResultView" owner:self options:nil][0];
    
    [self.view addSubview:resultView];
    
    resultView.center = self.view.center;
    
    resultView.hidden = YES;
    
    _counter.text = @"0000回";
    
    onSound = YES;
    
    count = 0;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)pushButton:(id)sender {
    
    
 // 乱数のシードを与える
    
    int n = arc4random() % 100 + 1;
    
    
    NSLog(@"%d",n);
    
    if(n == 20){
        
        [self bonus];
//        break;
    }
    
    count++;
    
    int i = [[NSUserDefaults standardUserDefaults] integerForKey:@"TotalCount"] + 1;
    [[NSUserDefaults standardUserDefaults] setInteger:i forKey:@"TotalCount"];
    
    _counter.text = [NSString stringWithFormat:@"%04d回転",count];
}


- (IBAction)pushReset:(id)sender {
    
    _counter.text = @"0000回転";
    
    count = 0;
    [timer invalidate];
    
    [_haibiImage setImage:[UIImage imageNamed:@"nohibi.png"]];
    
    
    
    
    _awardLabel.text = @"";
    
    _pusuButton.enabled = YES;
}


-(void)bonus{
    
    // 乱数のシードを与える
    int n = arc4random() % 100 + 1;
    
    int i = [[NSUserDefaults standardUserDefaults] integerForKey:@"TotalHaibi"] + 1;
    [[NSUserDefaults standardUserDefaults] setInteger:i forKey:@"TotalHaibi"];
    
    //通常点滅
    if(n <= 70 ){
        
        if ([[NSUserDefaults standardUserDefaults] boolForKey:@"nomalFlash"] == NO) {
            
            [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"nomalFlash"];
            
            int i = [[NSUserDefaults standardUserDefaults] integerForKey:@"Complete"] + 10;
            [[NSUserDefaults standardUserDefaults] setInteger:i forKey:@"Complete"];
        };
        
        [self sound:@"bonus"];
        
        timer = [NSTimer scheduledTimerWithTimeInterval:0.2 block:^{
            
            if(flash){
                
                [_haibiImage setImage:[UIImage imageNamed:@"hibi.png"]];
                
            } else {
                
                
                [_haibiImage setImage:[UIImage imageNamed:@"nohibi.png"]];
                
            }
            
            flash = !flash;
            
        } repeats:YES];
        _awardLabel.text = @"☆　通常点滅";
    
    //高速点滅
    } else if (n <= 75) {
        
        if ([[NSUserDefaults standardUserDefaults] boolForKey:@"speedFlash"] == NO) {
            
            [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"speedFlash"];
            
            int i = [[NSUserDefaults standardUserDefaults] integerForKey:@"Complete"] + 10;
            [[NSUserDefaults standardUserDefaults] setInteger:i forKey:@"Complete"];
        };
        
        [self sound:@"bonus"];
      
        timer = [NSTimer scheduledTimerWithTimeInterval:0.05 block:^{
            
            if(flash){
                
                [_haibiImage setImage:[UIImage imageNamed:@"hibi.png"]];
                
            } else {
                
                
                [_haibiImage setImage:[UIImage imageNamed:@"nohibi.png"]];
                
            }
            
            flash = !flash;
            
        } repeats:YES];
        
        _awardLabel.text = @"☆☆　高速点滅";
        
    //スロー点滅
    } else if (n <= 80) {
        
        if ([[NSUserDefaults standardUserDefaults] boolForKey:@"slowFlash"] == NO) {
            
            [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"slowFlash"];
            
            int i = [[NSUserDefaults standardUserDefaults] integerForKey:@"Complete"] + 10;
            [[NSUserDefaults standardUserDefaults] setInteger:i forKey:@"Complete"];
        };
        
        [self sound:@"bonus"];
        
        timer = [NSTimer scheduledTimerWithTimeInterval:1.0 block:^{
            
            if(flash){
                
                [_haibiImage setImage:[UIImage imageNamed:@"hibi.png"]];
                
            } else {
                
                
                [_haibiImage setImage:[UIImage imageNamed:@"nohibi.png"]];
                
            }
            
            flash = !flash;
            
        } repeats:YES];
        
        _awardLabel.text = @"☆☆　スロー点滅";
    
    //花のみ点滅
    } else if (n <= 85) {
        
        if ([[NSUserDefaults standardUserDefaults] boolForKey:@"flowerFlash"] == NO) {
            
            [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"flowerFlash"];
            
            int i = [[NSUserDefaults standardUserDefaults] integerForKey:@"Complete"] + 10;
            [[NSUserDefaults standardUserDefaults] setInteger:i forKey:@"Complete"];
        };
        
        [self sound:@"bonus"];
        
        timer = [NSTimer scheduledTimerWithTimeInterval:0.2 block:^{
            
            if(flash){
                
                [_haibiImage setImage:[UIImage imageNamed:@"hanahibi.png"]];
                
            } else {
                
                
                [_haibiImage setImage:[UIImage imageNamed:@"nohibi.png"]];
                
            }
            
            flash = !flash;
            
        } repeats:YES];
        
        _awardLabel.text = @"☆☆　花のみ点滅";
        
    //葉っぱのみ
    } else if (n <= 90) {
        
        if ([[NSUserDefaults standardUserDefaults] boolForKey:@"leafFlash"] == NO) {
            
            [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"leafFlash"];
            
            int i = [[NSUserDefaults standardUserDefaults] integerForKey:@"Complete"] + 10;
            [[NSUserDefaults standardUserDefaults] setInteger:i forKey:@"Complete"];
        };
        
        
        [self sound:@"bonus"];
        
        timer = [NSTimer scheduledTimerWithTimeInterval:0.2 block:^{
            
            if(flash){
                
                [_haibiImage setImage:[UIImage imageNamed:@"happahibi.png"]];
                
            } else {
                
                [_haibiImage setImage:[UIImage imageNamed:@"nohibi.png"]];
                
            }
            
            flash = !flash;
            
        } repeats:YES];
        
        _awardLabel.text = @"☆☆☆　葉っぱのみ点滅";
        
    //点灯
    } else if (n <= 92) {
        
        if ([[NSUserDefaults standardUserDefaults] boolForKey:@"lightingFlash"] == NO) {
            
            [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"lightingFlash"];
            
            int i = [[NSUserDefaults standardUserDefaults] integerForKey:@"Complete"] + 10;
            [[NSUserDefaults standardUserDefaults] setInteger:i forKey:@"Complete"];
        };
        
        [self sound:@"bonus"];
        
        [_haibiImage setImage:[UIImage imageNamed:@"hibi.png"]];
        
        _awardLabel.text = @"☆☆☆　点灯";
        
    //瞬き
    } else if (n <= 94) {
        
        if ([[NSUserDefaults standardUserDefaults] boolForKey:@"winkFlash"] == NO) {
            
            [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"winkFlash"];
            
            int i = [[NSUserDefaults standardUserDefaults] integerForKey:@"Complete"] + 10;
            [[NSUserDefaults standardUserDefaults] setInteger:i forKey:@"Complete"];
        };
        
        [self sound:@"bonus"];
        
        timer = [NSTimer scheduledTimerWithTimeInterval:0.1 block:^{
            
            if(flash){
                
                [_haibiImage setImage:[UIImage imageNamed:@"hibi.png"]];
                
            } else {
                
                [_haibiImage setImage:[UIImage imageNamed:@"nohibi.png"]];
                [timer invalidate];
                
            }
            
            flash = !flash;
            
        } repeats:YES];
        
        _awardLabel.text = @"☆☆☆　瞬き";
        
    //雷
    } else if (n <= 96) {
        
        if ([[NSUserDefaults standardUserDefaults] boolForKey:@"thumderFlash"] == NO) {
            
            [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"thumderFlash"];
            
            int i = [[NSUserDefaults standardUserDefaults] integerForKey:@"Complete"] + 10;
            [[NSUserDefaults standardUserDefaults] setInteger:i forKey:@"Complete"];
        };
        
        [self sound:@"thunder"];
        
        timer = [NSTimer scheduledTimerWithTimeInterval:0.2 block:^{
            
            if(flash){
                
                [_haibiImage setImage:[UIImage imageNamed:@"hibi.png"]];
                
            } else {
                
                [_haibiImage setImage:[UIImage imageNamed:@"nohibi.png"]];
                
            }
            
            flash = !flash;
            
        } repeats:YES];
        
        _awardLabel.text = @"☆☆☆　雷";
        
    //爆発
    } else if (n <= 98) {
        
        if ([[NSUserDefaults standardUserDefaults] boolForKey:@"bombFlash"] == NO) {
            
            [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"bombFlash"];
            
            int i = [[NSUserDefaults standardUserDefaults] integerForKey:@"Complete"] + 10;
            [[NSUserDefaults standardUserDefaults] setInteger:i forKey:@"Complete"];
        };
        
        [self sound:@"explosion"];
        
        timer = [NSTimer scheduledTimerWithTimeInterval:0.2 block:^{
            
            if(flash){
                
                [_haibiImage setImage:[UIImage imageNamed:@"hibi.png"]];
                
            } else {
                
                [_haibiImage setImage:[UIImage imageNamed:@"nohibi.png"]];
                
            }
            
            flash = !flash;
            
        } repeats:YES];
        
        _awardLabel.text = @"☆☆☆　爆発";
    
        
    //津波
    } else {
        
        if ([[NSUserDefaults standardUserDefaults] boolForKey:@"waveFlash"] == NO) {
            
            [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"waveFlash"];
            
            int i = [[NSUserDefaults standardUserDefaults] integerForKey:@"Complete"] + 10;
            [[NSUserDefaults standardUserDefaults] setInteger:i forKey:@"Complete"];
        };
        
        [self sound:@"wave"];
        
        timer = [NSTimer scheduledTimerWithTimeInterval:0.2 block:^{
            
            if(flash){
                
                [_haibiImage setImage:[UIImage imageNamed:@"hibi.png"]];
                
            } else {
                
                [_haibiImage setImage:[UIImage imageNamed:@"nohibi.png"]];
                
            }
            
            flash = !flash;
            
        } repeats:YES];
        
        _awardLabel.text = @"☆☆☆　津波";
        
    }
    
    _pusuButton.enabled = NO;
    
}

- (IBAction)soundSwitch:(id)sender {
    

    if(onSound){
        
        [_soundButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [_soundButton setTitle:@"Sound OFF" forState:UIControlStateNormal];
        
        
    } else {
        
        [_soundButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_soundButton setTitle:@"Sound ON" forState:UIControlStateNormal];
    }
    
    onSound = !onSound;
    
}

-(void)sound:(NSString*)name{
    
    if(onSound){
        
        NSString *sePath = [[NSBundle mainBundle] pathForResource:name ofType:@"mp3"];
        
        NSURL *seUrl = [NSURL fileURLWithPath:sePath];
        
        sound = [[AVAudioPlayer alloc] initWithContentsOfURL:seUrl error:nil];
        [sound setNumberOfLoops:0];
        [sound play];
    }
}

- (IBAction)pushResult:(id)sender {
    
    resultView.hidden = !resultView.hidden;
    
    resultView.totalTap.text =
    [NSString stringWithFormat:@"%d回",[[NSUserDefaults standardUserDefaults] integerForKey:@"TotalCount"]];
    
    resultView.totalHaibi.text =
    [NSString stringWithFormat:@"%d回",[[NSUserDefaults standardUserDefaults] integerForKey:@"TotalHaibi"]];
    
    resultView.complete.text =
    [NSString stringWithFormat:@"%d/100",[[NSUserDefaults standardUserDefaults] integerForKey:@"Complete"]];
}


@end
