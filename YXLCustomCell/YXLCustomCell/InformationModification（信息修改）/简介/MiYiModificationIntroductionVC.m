//
//  MiYiModificationIntroductionVC.m
//  MiYi
//
//  Created by 叶星龙 on 15/8/11.
//  Copyright (c) 2015年 北京美耶时尚信息科技有限公司. All rights reserved.
//

#import "MiYiModificationIntroductionVC.h"
#import "MiYiTextView.h"


#define kWindowWidth  ([[UIScreen mainScreen]             bounds].size.width)
#define kWindowHeight ([[UIScreen mainScreen]             bounds].size.height)

#define Font(F)                 [UIFont systemFontOfSize:(F)]
@interface MiYiModificationIntroductionVC ()<UITextViewDelegate>

@property (weak ,nonatomic) MiYiTextView *textView;


@property (weak ,nonatomic) UILabel *statusLabel;
@end

@implementation MiYiModificationIntroductionVC


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    
    MiYiTextView *textView =[[MiYiTextView alloc]initWithFrame:(CGRect){0,84,kWindowWidth,150}];
    textView.delegate=self;
    textView.scrollEnabled=NO;
    textView.contentOffset=CGPointMake(kWindowWidth/2,textView.center.y-32);
    textView.placeholder = @"您有什么需求可以写在这里哦";
    textView.font=[UIFont systemFontOfSize:15];
    [self.view addSubview:textView];
    textView.keyboardType = UIKeyboardTypeDefault;
    textView.returnKeyType=UIReturnKeyDone;
  
    textView.layer.borderWidth = 0.5;
    textView.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    _textView =textView;
    
    NSString *statusLabelText =@"60/60";
    UILabel *statusLabel =[[UILabel alloc]init];
    CGSize statusLabelTextSize =[self TextSize:statusLabelText Font:11 label:statusLabel];
    statusLabel.frame =(CGRect){{textView.frame.size.width-statusLabelTextSize.width-10  ,CGRectGetMaxY(textView.frame)-100 },statusLabelTextSize};
    statusLabel.text=@"0/60";
    statusLabel.textColor = [UIColor lightGrayColor];
    statusLabel.textAlignment =NSTextAlignmentCenter;
    [textView addSubview:statusLabel];
    _statusLabel=statusLabel;
    
  
    UIButton *ok =[[UIButton alloc]initWithFrame:(CGRect){0,250,kWindowWidth,40}];
    
    ok.backgroundColor=[UIColor redColor];
    [ok setTitle:@"确定" forState:UIControlStateNormal];
    [ok setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [ok addTarget:self action:@selector(okClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:ok];
    
    // Do any additional setup after loading the view.
}

-(void)okClick
{

            _block(_textView.text);
            [self.navigationController popViewControllerAnimated:YES];
  
    
}



-(CGSize )TextSize:(NSString *)text Font:(int )font label:(UILabel *)label
{
    UIFont *labelfont=[UIFont systemFontOfSize:font];
    CGSize TextSize = [text sizeWithAttributes:[NSDictionary dictionaryWithObjectsAndKeys:labelfont,NSFontAttributeName,nil]];
    label.font =labelfont;
    label.text =text;
    return TextSize;
}
- (void)textViewDidChange:(UITextView *)textView{
    NSInteger number = [textView.text length];
    if (number > 60) {
        textView.text = [textView.text substringToIndex:60];
    }
    _statusLabel.text = [NSString stringWithFormat:@"%li/60",(long)[textView.text length]];
    
}
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range
 replacementText:(NSString *)text
{
    // Any new character added is passed in as the "text" parameter
    if ([text isEqualToString:@"\n"]) {
        // Be sure to test for equality using the "isEqualToString" message
        [textView resignFirstResponder];
        
        // Return FALSE so that the final '\n' character doesn't get added
        return FALSE;
    }
    // For any other character return TRUE so that the text gets added to the view
    return TRUE;
}

@end
