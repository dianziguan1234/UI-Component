//
//  MiYiModificationNameVC.m
//  MiYi
//
//  Created by 叶星龙 on 15/8/10.
//  Copyright (c) 2015年 北京美耶时尚信息科技有限公司. All rights reserved.
//

#import "MiYiModificationNameVC.h"
#import "MiYiTextField.h"


#define kWindowWidth  ([[UIScreen mainScreen]             bounds].size.width)
#define kWindowHeight ([[UIScreen mainScreen]             bounds].size.height)

#define Font(F)                 [UIFont systemFontOfSize:(F)]
@interface MiYiModificationNameVC ()


@property (nonatomic ,weak)MiYiTextField *name;
@end

@implementation MiYiModificationNameVC


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    
    MiYiTextField *name =[[MiYiTextField alloc]initWithFrame:(CGRect){0,64+15,kWindowWidth,49}];
    name.textField.text=@"默认";
    name.textField.textAlignment=NSTextAlignmentCenter;
    name.isSpecialCharacters=YES;
    name.isWordLimit=YES;
    name.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:name];
    _name=name;
    
 
    UIButton *ok =[[UIButton alloc]initWithFrame:(CGRect){0,CGRectGetMaxY(name.frame)+20,kWindowWidth,49}];
    
    ok.backgroundColor=[UIColor redColor];
    [ok setTitle:@"确定" forState:UIControlStateNormal];
    [ok setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [ok addTarget:self action:@selector(okClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:ok];
    
    
    // Do any additional setup after loading the view.
}

-(void)okClick
{

            _block(_name.textField.text);
            [self.navigationController popViewControllerAnimated:YES];

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
