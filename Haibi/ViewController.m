//
//  ViewController.m
//  Haibi
//
//  Created by 作田諒 on 2015/04/09.
//  Copyright (c) 2015年 myname. All rights reserved.
//

#import "ViewController.h"
#import "NSTimer+Blocks.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *haibiImage;
@property (weak, nonatomic) IBOutlet UIButton *pusuButton;
@property (weak, nonatomic) IBOutlet UILabel *counter;
@property (weak, nonatomic) IBOutlet UILabel *awardLabel;

@end

@implementation ViewController{
    
    int settingNum;
    int count;
    BOOL on;
    NSTimer *timer;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSMutableDictionary *defaults = [NSMutableDictionary dictionary];
    [defaults setObject:@"0" forKey:@"TotalCount"];
    [defaults setObject:@"0" forKey:@"Avarage"];
    [[NSUserDefaults standardUserDefaults] registerDefaults:defaults];
    
    
    _counter.text = @"0000回";
    
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
    
    
    if(n < 70 ){
        
        timer = [NSTimer scheduledTimerWithTimeInterval:0.2 block:^{
            
            if(on){
                
                [_haibiImage setImage:[UIImage imageNamed:@"hibi.png"]];
                
            } else {
                
                
                [_haibiImage setImage:[UIImage imageNamed:@"nohibi.png"]];
                
            }
            
            on = !on;
            
        } repeats:YES];
        _awardLabel.text = @"☆　通常点滅";
        
    } else if (n < 80) {
        
      
        timer = [NSTimer scheduledTimerWithTimeInterval:0.05 block:^{
            
            if(on){
                
                [_haibiImage setImage:[UIImage imageNamed:@"hibi.png"]];
                
            } else {
                
                
                [_haibiImage setImage:[UIImage imageNamed:@"nohibi.png"]];
                
            }
            
            on = !on;
            
        } repeats:YES];
        
        _awardLabel.text = @"☆☆　高速点滅";
        
    } else if (n < 90) {
        
        timer = [NSTimer scheduledTimerWithTimeInterval:0.2 block:^{
            
            if(on){
                
                [_haibiImage setImage:[UIImage imageNamed:@"hanahibi.png"]];
                
            } else {
                
                
                [_haibiImage setImage:[UIImage imageNamed:@"nohibi.png"]];
                
            }
            
            on = !on;
            
        } repeats:YES];
        
        _awardLabel.text = @"☆☆　花のみ点滅";
        
        
    } else if (n < 95) {
        
        [_haibiImage setImage:[UIImage imageNamed:@"hibi.png"]];
        
        _awardLabel.text = @"☆☆☆　点灯";
        
        
    } else {
        
        timer = [NSTimer scheduledTimerWithTimeInterval:0.2 block:^{
            
            if(on){
                
                [_haibiImage setImage:[UIImage imageNamed:@"happahibi.png"]];
                
            } else {
                
                
                [_haibiImage setImage:[UIImage imageNamed:@"nohibi.png"]];
                
            }
            
            on = !on;
            
        } repeats:YES];
        
        _awardLabel.text = @"☆☆☆　葉っぱのみ点滅";
        
    }

    
    _pusuButton.enabled = NO;
    
}



@end
