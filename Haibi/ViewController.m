//
//  ViewController.m
//  Haibi
//
//  Created by 作田諒 on 2015/04/09.
//  Copyright (c) 2015年 myname. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *haibiImage;
@property (weak, nonatomic) IBOutlet UIButton *pusuButton;
@property (weak, nonatomic) IBOutlet UILabel *counter;

@end

@implementation ViewController{
    
    int settingNum;
    int count;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _counter.text = @"0000回";
    
    count = 0;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)pushButton:(id)sender {
    
    
 // 乱数のシードを与える
    
    int n = rand() % 100 + 1;
    
    
    NSLog(@"%d",n);
    
    if(n == 20){
        
        [self bonus];
//        break;
    }
    
    count++;
    _counter.text = [NSString stringWithFormat:@"%04d回転",count];
    

    
}


- (IBAction)pushReset:(id)sender {
    
    _counter.text = @"0000回転";
    
    count = 0;
    
    [_haibiImage setImage:[UIImage imageNamed:@"nohibi.png"]];
    
    _pusuButton.enabled = YES;
}


-(void)bonus{
    
    // 乱数のシードを与える
    int n = rand() % 100 + 1;
    
    if(n < 10 ){
        
        [_haibiImage setImage:[UIImage imageNamed:@"hibi.png"]];
        
        _pusuButton.enabled = NO;
        
    } else if (n < 30) {
        
        [_haibiImage setImage:[UIImage imageNamed:@"happahibi.png"]];
        
        _pusuButton.enabled = NO;
        
        
    } else {
        
        [_haibiImage setImage:[UIImage imageNamed:@"hanahibi.png"]];
        
        _pusuButton.enabled = NO;
        
    }
        
}

@end
