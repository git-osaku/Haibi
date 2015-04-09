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
    
    settingNum = 1;
    _counter.text = @"0000回";
    
    count = 0;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)pushButton:(id)sender {
    
    // 乱数のシードを与える
    srand((unsigned)time(NULL));
    for (int i = 0; i <= settingNum; i++ ) {
        // 1から100までの乱数を発生させる */
        int n = random() % 100;
        
        if(n == 20){
            
            [_haibiImage setImage:[UIImage imageNamed:@"pikapika.png"]];
            
            _pusuButton.enabled = NO;
            break;
        }
    }
    count++;
    _counter.text = [NSString stringWithFormat:@"%04d回",count];
    

    
}
- (IBAction)pushReset:(id)sender {
    
    _counter.text = @"0000回転";
    
    count = 0;
    
    [_haibiImage setImage:[UIImage imageNamed:@"nopikapika.png"]];
    
    _pusuButton.enabled = YES;
}

@end
