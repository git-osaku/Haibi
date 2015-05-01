//
//  ViewController.m
//  Haibi
//
//  Created by 作田諒 on 2015/04/09.
//  Copyright (c) 2015年 myname. All rights reserved.
//

#import "ViewController.h"
#import "NSTimer+Blocks.h"

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
    BOOL on;
    BOOL onSound;
    NSTimer *timer;
    AVAudioPlayer *sound;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSMutableDictionary *defaults = [NSMutableDictionary dictionary];
    [defaults setObject:@"0" forKey:@"TotalCount"];
    [defaults setObject:@"0" forKey:@"Avarage"];
    [[NSUserDefaults standardUserDefaults] registerDefaults:defaults];
    
    
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
    
    
    //通常点滅
    if(n <= 70 ){
        
        [self sound:@"bonus"];
        
        timer = [NSTimer scheduledTimerWithTimeInterval:0.2 block:^{
            
            if(on){
                
                [_haibiImage setImage:[UIImage imageNamed:@"hibi.png"]];
                
            } else {
                
                
                [_haibiImage setImage:[UIImage imageNamed:@"nohibi.png"]];
                
            }
            
            on = !on;
            
        } repeats:YES];
        _awardLabel.text = @"☆　通常点滅";
    
    //高速点滅
    } else if (n <= 75) {
        
        [self sound:@"bonus"];
      
        timer = [NSTimer scheduledTimerWithTimeInterval:0.05 block:^{
            
            if(on){
                
                [_haibiImage setImage:[UIImage imageNamed:@"hibi.png"]];
                
            } else {
                
                
                [_haibiImage setImage:[UIImage imageNamed:@"nohibi.png"]];
                
            }
            
            on = !on;
            
        } repeats:YES];
        
        _awardLabel.text = @"☆☆　高速点滅";
        
    //スロー点滅
    } else if (n <= 80) {
        
        [self sound:@"bonus"];
        
        timer = [NSTimer scheduledTimerWithTimeInterval:0.05 block:^{
            
            if(on){
                
                [_haibiImage setImage:[UIImage imageNamed:@"hibi.png"]];
                
            } else {
                
                
                [_haibiImage setImage:[UIImage imageNamed:@"nohibi.png"]];
                
            }
            
            on = !on;
            
        } repeats:YES];
        
        _awardLabel.text = @"☆☆　スロー点滅";
    
    //花のみ点滅
    } else if (n <= 85) {
        
        [self sound:@"bonus"];
        
        timer = [NSTimer scheduledTimerWithTimeInterval:0.2 block:^{
            
            if(on){
                
                [_haibiImage setImage:[UIImage imageNamed:@"hanahibi.png"]];
                
            } else {
                
                
                [_haibiImage setImage:[UIImage imageNamed:@"nohibi.png"]];
                
            }
            
            on = !on;
            
        } repeats:YES];
        
        _awardLabel.text = @"☆☆　花のみ点滅";
        
    //葉っぱのみ
    } else if (n <= 90) {
        
        [self sound:@"bonus"];
        
        timer = [NSTimer scheduledTimerWithTimeInterval:0.2 block:^{
            
            if(on){
                
                [_haibiImage setImage:[UIImage imageNamed:@"happahibi.png"]];
                
            } else {
                
                [_haibiImage setImage:[UIImage imageNamed:@"nohibi.png"]];
                
            }
            
            on = !on;
            
        } repeats:YES];
        
        _awardLabel.text = @"☆☆☆　葉っぱのみ点滅";
        
    //点灯
    } else if (n <= 92) {
        
        [self sound:@"bonus"];
        
        [_haibiImage setImage:[UIImage imageNamed:@"hibi.png"]];
        
        _awardLabel.text = @"☆☆☆　点灯";
        
    //瞬き
    } else if (n <= 94) {
        
        [self sound:@"bonus"];
        
        timer = [NSTimer scheduledTimerWithTimeInterval:0.1 block:^{
            
            if(on){
                
                [_haibiImage setImage:[UIImage imageNamed:@"hibi.png"]];
                
            } else {
                
                [_haibiImage setImage:[UIImage imageNamed:@"nohibi.png"]];
                [timer invalidate];
                
            }
            
            on = !on;
            
        } repeats:YES];
        
        _awardLabel.text = @"☆☆☆　瞬き";
        
    //雷
    } else if (n <= 96) {
        
        [self sound:@"thunder"];
        
        timer = [NSTimer scheduledTimerWithTimeInterval:0.2 block:^{
            
            if(on){
                
                [_haibiImage setImage:[UIImage imageNamed:@"hibi.png"]];
                
            } else {
                
                [_haibiImage setImage:[UIImage imageNamed:@"nohibi.png"]];
                
            }
            
            on = !on;
            
        } repeats:YES];
        
        _awardLabel.text = @"☆☆☆　雷";
        
    //爆発
    } else if (n <= 98) {
        
        [self sound:@"explosion"];
        
        timer = [NSTimer scheduledTimerWithTimeInterval:0.2 block:^{
            
            if(on){
                
                [_haibiImage setImage:[UIImage imageNamed:@"hibi.png"]];
                
            } else {
                
                [_haibiImage setImage:[UIImage imageNamed:@"nohibi.png"]];
                
            }
            
            on = !on;
            
        } repeats:YES];
        
        _awardLabel.text = @"☆☆☆　爆発";
    
        
    //津波
    } else {
        
        [self sound:@"wave"];
        
        timer = [NSTimer scheduledTimerWithTimeInterval:0.2 block:^{
            
            if(on){
                
                [_haibiImage setImage:[UIImage imageNamed:@"hibi.png"]];
                
            } else {
                
                [_haibiImage setImage:[UIImage imageNamed:@"nohibi.png"]];
                
            }
            
            on = !on;
            
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



@end
