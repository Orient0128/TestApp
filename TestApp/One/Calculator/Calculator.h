//
//  Calculator.h
//  TestApp
//
//  Created by Orient on 16/6/12.
//  Copyright © 2016年 Orient. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Calculator : UIViewController

@property (retain,nonatomic) UIButton *button;
@property (retain,nonatomic) UILabel *label;
@property (retain,nonatomic) NSMutableString *string;

@property (assign,nonatomic) double num1, num2;
@property (assign,nonatomic) NSString *str;




@end
