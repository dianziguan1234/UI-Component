//
//  MiYiMultiTheStyleTableView.h
//  MiYi
//
//  Created by 叶星龙 on 15/8/10.
//  Copyright (c) 2015年 北京美耶时尚信息科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MiYiItemGroup;
@interface MiYiMultiTheStyleTableView : UIViewController


@property (nonatomic ,strong) UITableView            *tableView;

@property (strong, nonatomic) NSMutableArray         *groups;
- (MiYiItemGroup *)addGroup;

@end
