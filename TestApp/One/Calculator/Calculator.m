//
//  Calculator.m
//  TestApp
//
//  Created by Orient on 16/6/12.
//  Copyright © 2016年 Orient. All rights reserved.
//

#import "Calculator.h"
#import "QuartzCore/QuartzCore.h"

@interface Calculator ()

@end

@implementation Calculator

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    self.label = [[UILabel alloc] initWithFrame:CGRectMake(140, 100, 100, 150)];
    self.label.backgroundColor = [UIColor whiteColor];
    self.label.textColor = [UIColor blackColor];
    self.label.lineBreakMode = NSLineBreakByWordWrapping;//据计算结果重新设置label尺寸
    self.label.numberOfLines = 0;//上两行设置自动换行
    self.label.text = @"我要离开这套路的城市";
    self.label.font = [UIFont systemFontOfSize:20];
    [self.view addSubview:_label];
    
    NSArray *array = @[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9"];
    int n = 0;
    for (int i = 0;i < 3; i++) {
        for (int j = 0;j < 3; j++) {
            self.button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
            self.button.frame = CGRectMake(50+65*j, 250+65*i, 60, 60);
            [self.button setTitle:[array objectAtIndex:n++] forState:UIControlStateNormal];
            [self.view addSubview:_button];
            [self.button addTarget:self action:@selector(shuzi:) forControlEvents:UIControlEventTouchUpInside];//addTarget:self 的意思是说，这个方法在本类中也可以传入其他类的指针

        }
    }
    
    
    UIButton *button0 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button0 setFrame:CGRectMake(115, 445, 60, 60)];
    [button0 setTitle:@"0" forState:UIControlStateNormal];
    [button0 addTarget:self action:@selector(shuzi:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button0];
    
    
    NSArray *array1 = @[@"+",@"-",@"*",@"/"];
    for (int i = 0; i < 4; i++) {
        UIButton *button1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [button1 setFrame:CGRectMake(245, 250+65*i, 60, 60)];
        [button1 setTitle:[array1 objectAtIndex:i] forState:UIControlStateNormal];
        [button1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self.view addSubview:button1];
        [button1 addTarget:self action:@selector(go:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    UIButton *button2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button2 setFrame:CGRectMake(180, 445, 60, 60)];
    [button2 setTitle:@"=" forState:UIControlStateNormal];
    [button2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button2 addTarget:self action:@selector(go:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:button2];
    
    UIButton *button3 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button3 setFrame:CGRectMake(140, 510, 90, 60)];
    [button3 setTitle:@"AC" forState:UIControlStateNormal];
    [button3 setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [button3 addTarget:self action:@selector(clean:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:button3];
    
    
    UIButton *button4 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button4 setFrame:CGRectMake(50, 445, 60, 60)];
    [button4 setTitle:@"." forState:UIControlStateNormal];
    [button4 setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [button4 addTarget:self action:@selector(shuzi:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:button4];
    
    
    UIButton *button5 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button5 setFrame:CGRectMake(50, 510, 90, 60)];
    [button5 setTitle:@"Del" forState:UIControlStateNormal];
    [button5 setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [button5 addTarget:self action:@selector(back:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button5];
    
    self.string = [[NSMutableString alloc] init];
    self.str = [[NSString alloc] init];
}

- (void)shuzi:(id)sender {

    [self.string appendString:[sender currentTitle]];//数字连续输入
    self.label.text = [NSString stringWithString:_string];
    self.num1 = [self.label.text doubleValue];//保存输入值
    
    
}

- (void)go:(id)sender {

    if ([self.str isEqualToString:@""]) {
        
        self.num2 = self.num1;
        self.label.text = [NSString stringWithString:_string];
        [self.string setString:@""];
        self.str = [sender currentTitle];//保存运算符
        [self.string appendString:self.string];
        self.label.text = [NSString stringWithString:_string];
        [self.string setString:@""];
    }
    
    else {
        
        if ([self.str isEqualToString:@"+"]) {
            
            [self.string setString:@""];
            self.num2 +=self.num1;
            
            if ([[sender currentTitle]isEqualToString:@"="]) {
                
                self.label.text = [NSString stringWithFormat:@"%f",self.num2];
                self.str =@"";
            }
            else if ([[sender currentTitle]isEqualToString:@"+"] || [[sender currentTitle]isEqualToString:@"-"] || [[sender currentTitle]isEqualToString:@"*"] || [[sender currentTitle]isEqualToString:@"/"]) {
                
                self.label.text = [NSString stringWithFormat:@"%f",self.num2];
                [self.string setString:@""];
                self.str = [sender currentTitle];
                [self.string appendString:self.str];
                [self.string setString:@""];
            }
        }
        
        else if ([self.str isEqualToString:@"-"]) {
            
            [self.string setString:@""];
            self.num2 -= self.num1;
            
            if ([[sender currentTitle]isEqualToString:@"="]) {
                
                self.label.text = [NSString stringWithFormat:@"%f",self.num2];
                self.str = @"";
            }
            else if ([[sender currentTitle]isEqualToString:@"+"] || [[sender currentTitle]isEqualToString:@"-"] || [[sender currentTitle]isEqualToString:@"*"] || [[sender currentTitle]isEqualToString:@"/"]) {
                
                self.label.text = [NSString stringWithFormat:@"%f",self.num2];
                [self.string setString:@""];
                self.str = [sender currentTitle];
                [self.string appendString:self.str];
                [self.string setString:@""];
            }
        }

        else if ([self.str hasPrefix:@"*"]) {
            
            [self.string setString:@""];
            self.num2 *= self.num1;
            
            if ([[sender currentTitle]isEqualToString:@"="]) {
                
                self.label.text = [NSString stringWithFormat:@"%f",self.num2];
                self.str = @"";
            }
            
            else if ([[sender currentTitle]isEqualToString:@"+"] || [[sender currentTitle]isEqualToString:@"-"] || [[sender currentTitle]isEqualToString:@"*"] || [[sender currentTitle]isEqualToString:@"/"]) {
                
                self.label.text = [NSString stringWithFormat:@"%f",self.num2];
                [self.string setString:@""];
                self.str = [sender currentTitle];
                [self.string appendString:self.str];
                [self.string setString:@""];
            }
        }
        
        else if ([self.str isEqualToString:@"/"]) {
            
            [self.string setString:@""];
            self.num2 /= self.num1;
            
            if ([[sender currentTitle]isEqualToString:@"="]) {
                
                self.label.text = [NSString stringWithFormat:@"%f",self.num2];
                self.str = @"";
            }
            
            else if ([[sender currentTitle]isEqualToString:@"+"] || [[sender currentTitle]isEqualToString:@"-"] || [[sender currentTitle]isEqualToString:@"*"] || [[sender currentTitle]isEqualToString:@"/"]) {
                
                self.label.text = [NSString stringWithFormat:@"%f",self.num2];
                [self.string setString:@""];
                self.str = [sender currentTitle];
                [self.string appendString:self.str];
                [self.string setString:@""];
            }
        }
    }
}

- (void)clean:(id)sender {
    
    [self.string setString:@""];
    self.num1 = 0;
    self.num2 = 0;
    self.label.text = @"我要离开这套路的城市";
    
}

- (void)back:(id)sender {
    
    if (![self.label.text isEqualToString:@""] && ![self.label.text isEqualToString:@"我要离开这套路的城市"]) {   //判断不为空
        [self.string deleteCharactersInRange:NSMakeRange([self.string length]-1, 1 )];//删除最后一个字符
        self.label.text = [NSString stringWithString:_string];//显示结果
    }
    else {
        
        [self clean:nil];
        
//        [self.string setString:@""];
//        self.num1 = 0;
//        self.num2 = 0;
//        self.label.text = @"我要离开这套路的城市";

    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}



@end
