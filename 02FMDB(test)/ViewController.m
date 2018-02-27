//
//  ViewController.m
//  02FMDB(test)
//
//  Created by pengpeng yan on 16/3/16.
//  Copyright © 2016年 peng yan. All rights reserved.
//

#import "ViewController.h"
#import "Model.h"
#import "DataBaseManager.h"
@interface ViewController ()
@property(nonatomic,strong)UITextField *field1;
@property(nonatomic,strong)UITextField *field2;
@property(nonatomic,strong)UITextField *field3;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 50, 70, 20);
    button.backgroundColor = [UIColor orangeColor];
    [button setTitle:@"添加信息" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(addClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    UIButton * button2=[UIButton buttonWithType:UIButtonTypeCustom];
    button2.frame=CGRectMake(90, 50, 70, 20);
    button2.backgroundColor=[UIColor orangeColor];
    [button2 setTitle:@"删除信息" forState:UIControlStateNormal];
    [button2 addTarget:self action:@selector(deleteClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button2];
    
    UIButton * button3=[UIButton buttonWithType:UIButtonTypeCustom];
    button3.frame=CGRectMake(180, 50, 70, 20);
    button3.backgroundColor=[UIColor orangeColor];
    [button3 setTitle:@"更改信息" forState:UIControlStateNormal];
    [button3 addTarget:self action:@selector(updateClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button3];
    
    UIButton * button4=[UIButton buttonWithType:UIButtonTypeCustom];
    button4.frame=CGRectMake(270, 50, 70, 20);
    button4.backgroundColor=[UIColor orangeColor];
    [button4 setTitle:@"查询信息" forState:UIControlStateNormal];
    [button4 addTarget:self action:@selector(readClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button4];
    
    self.field1 = [[UITextField alloc] initWithFrame:CGRectMake(0, 90, 80, 20)];
    self.field1.placeholder = @"姓名";
    self.field1.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:self.field1];
    
    self.field2 = [[UITextField alloc] initWithFrame:CGRectMake(120, 90, 80, 20)];
    self.field2.placeholder = @"年龄";
    self.field2.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:self.field2];
    
    self.field3 = [[UITextField alloc] initWithFrame:CGRectMake(240, 90, 80, 20)];
    self.field3.placeholder = @"学号";
    self.field3.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:self.field3];

}
//添加信息
- (void)addClick:(UIButton *)btn{
//    Model *model = [[Model alloc] initWithModelName:@"大大" number:@1 age:@11];
//   BOOL isAdd = [[DataBaseManager shaerManager] insertModel:model];
//    if (isAdd) {
//        NSLog(@"添加成功");
//    }else{
//        NSLog(@"添加失败");
//    }
    Model *model = [[Model alloc] initWithModelName:self.field1.text number:self.field3.text age:self.field2.text];
    BOOL isAdd = [[DataBaseManager shaerManager] insertModel:model];
    if (isAdd) {
                NSLog(@"添加成功");
            }else{
                NSLog(@"添加失败");
            }

}
//查询信息
- (void)readClick:(UIButton *)btn{
    NSArray *array = [[DataBaseManager shaerManager] readData:nil];
    NSLog(@"%@",array);
}
//删除信息
- (void)deleteClick:(UIButton *)btn{
   NSString *deleteString = @"delete from t_model where name = '大大'";
   BOOL isDelete = [[DataBaseManager shaerManager] deleteData:deleteString];
    if (isDelete) {
        NSLog(@"删除成功");
    }else{
        NSLog(@"删除失败");
    }
}






@end
