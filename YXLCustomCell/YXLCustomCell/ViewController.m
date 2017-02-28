//
//  ViewController.m
//  YXLCustomCell
//
//  Created by 叶星龙 on 15/8/19.
//  Copyright (c) 2015年 北京美耶时尚信息科技有限公司. All rights reserved.
//

#import "ViewController.h"
#import "MiYiImageItem.h"
#import "MiYiItemGroup.h"
#import "MiYiLableItem.h"
#import "MiYiArrowItem.h"
#import "MiYiModificationNameVC.h"
#import "MiYiModificationIntroductionVC.h"
@interface ViewController ()

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addOne];
    [self addTow];
    // Do any additional setup after loading the view.
    
}

-(void)addOne
{
    MiYiItemGroup *group=[self addGroup];
    
    MiYiImageItem *itemOne =[MiYiImageItem itemWithTitle:@"头像" image:@"http://e.hiphotos.baidu.com/zhidao/pic/item/d043ad4bd11373f026051f58a10f4bfbfbed043a.jpg"];
    __block MiYiImageItem *itemOneBlock=itemOne;
    __block BOOL is;
    itemOne.operation=^{
        if (!is) {
            itemOneBlock.image =@"http://www.qqzhi.com/uploadpic/2014-09-05/160840259.jpg";
            [self.tableView reloadData];
            is=YES;
        }else
        {
            itemOneBlock.image =@"http://e.hiphotos.baidu.com/zhidao/pic/item/d043ad4bd11373f026051f58a10f4bfbfbed043a.jpg";
            [self.tableView reloadData];
            is=NO;
        }
        
        
           };
    
    
    group.items=@[itemOne];
}

-(void)addTow
{
    MiYiItemGroup *group=[self addGroup];
    
    MiYiLableItem *itemOne =[MiYiLableItem itemWithTitle:@"昵称"];
    itemOne.subtitle=@"默认";
    __block MiYiLableItem *itemOneBlock=itemOne;
    itemOne.operation=^{
        MiYiModificationNameVC *vc =[[MiYiModificationNameVC alloc]init];
        vc.block=^(NSString *name){
            itemOneBlock.subtitle=name;
            
            [self.tableView reloadData];
        };
        [self.navigationController pushViewController:vc animated:YES];
    };
    
    MiYiLableItem *itemTow =[MiYiLableItem itemWithTitle:@"超长文字"];
    itemTow.subtitle=@"测试谁谁谁谁谁谁谁谁谁谁谁谁谁谁谁";
    __block MiYiLableItem *itemTowBlock=itemTow;
    itemTow.operation=^{
        MiYiModificationIntroductionVC *vc =[[MiYiModificationIntroductionVC alloc]init];
        vc.block=^(NSString *name){
            itemTowBlock.subtitle=name;
            
            [self.tableView reloadData];
        };
        [self.navigationController pushViewController:vc animated:YES];
    };
    
    MiYiLableItem *itemTow1 =[MiYiLableItem itemWithIcon:nil title:@"点击修改颜色" color:[UIColor blackColor]];
    itemTow1.subtitle=@"默认";
    __block MiYiLableItem *itemTowBlock1=itemTow1;
    itemTow1.operation=^{
     
            itemTowBlock1.subtitle=@"修改后";
        itemTowBlock1.color= [UIColor redColor];
        
            [self.tableView reloadData];
        
    };
    
    MiYiLableItem *itemTow2 =[MiYiLableItem itemWithIcon:@"touxiang.jpg" title:@"icon" ];
    itemTow2.subtitle=@"icon";
    itemTow2.detailText=@"hahah";
    __block MiYiLableItem *itemTowBlock2=itemTow2;
    itemTow2.operation=^{
        
        itemTowBlock2.subtitle=@"修改后";
        
        [self.tableView reloadData];
        
    };
    
    MiYiLableItem *itemTow3 =[MiYiLableItem itemWithIcon:@"touxiang" title:@"纯纯的啥都没有" ];
    itemTow3.operation=^{
        
        
        [self.tableView reloadData];
        
    };
    
    
    MiYiArrowItem *itemTow4 =[MiYiArrowItem itemWithIcon:@"touxiang.jpg" title:@"纯纯的箭头都没有了" ];
    itemTow4.detailText=@"hahah";
    itemTow4.subtitle=@"奥神队";
    itemTow4.operation=^{
        
        
        [self.tableView reloadData];
        
    };
    
    MiYiArrowItem *itemTow5 =[MiYiArrowItem itemWithIcon:nil title:@"纯纯的都没有了" ];
    itemTow5.subtitle=@"";
    itemTow5.operation=^{
        
        
        [self.tableView reloadData];
        
    };
    
    
    group.items=@[itemOne,itemTow,itemTow1,itemTow2,itemTow3,itemTow4,itemTow5];
}



-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section ==0) {
        if (indexPath.row==0) {
            return 80;
        }
        
    }
    return 44;
}


@end
