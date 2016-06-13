//
//  VC1.m
//  TestApp
//
//  Created by Orient on 16/6/12.
//  Copyright © 2016年 Orient. All rights reserved.
//

#import "VC1.h"
#import "Calculator.h"
#import "demo1.h"
#import "demo2.h"
#import "demo3.h"

@interface VC1 ()

@property (strong, nonatomic) NSArray *demos;

@end

@implementation VC1

static NSString * const ID = @"cell";

- (NSArray *)demos {
    
    if (_demos == nil) {
        
        _demos = @[@"Calculator",@"demo1",@"demo2",@"demo3"];
    }

    return _demos;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"demo";
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:ID];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 1;//分区
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 4;//cell quantity
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID forIndexPath:indexPath];
    cell.textLabel.text = self.demos[indexPath.row];
    // Configure the cell...
    
    return cell;
}




- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    switch (indexPath.row) {
        
        case 0:{
            [self.navigationController pushViewController:[[Calculator alloc] init] animated:YES];
            break;
        }
        case 1:{
            [self.navigationController pushViewController:[[demo1 alloc] init] animated:YES];
            break;
        }
        case 2:{
            [self.navigationController pushViewController:[[demo2 alloc] init] animated:YES];
            break;
        }
        case 3:{
            [self.navigationController pushViewController:[[demo3 alloc] init] animated:YES];
            break;
        }
        default:
            break;
    }
    
}



@end
