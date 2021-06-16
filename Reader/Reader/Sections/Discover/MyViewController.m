//
//  MyViewController.m
//  Reader
//
//  Created by 陈保瑞 on 2021/5/19.
//  Copyright © 2021 LSY. All rights reserved.
//

#import "MyViewController.h"
#import "RDMyTopView.h"
#import "MyTableViewCell.h"
#import "CommonStrings.h"
#import "MyErrorView.h"
#import "RDAboutUsControllerViewController.h"
#import "RDBrowseRecordViewController.h"
#import "RDReadRecordManager.h"
@interface MyViewController () <UITableViewDelegate,UITableViewDataSource,showErrorViewProtocol>

@property(nonatomic, strong) RDMyTopView *myTopView;
@property(nonatomic, strong) UITableView *myTableView;
@property(nonatomic, strong) NSMutableArray *arr;
@property(nonatomic, strong) MyErrorView *errorView;

@end

@implementation MyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupData];
    [self setupUIs];
    
    // Do any additional setup after loading the view.
}

- (void)setupData {
    self.arr = [[NSMutableArray alloc] init];
    [self.arr addObject:@(yijianfankui)];
    [self.arr addObject:@(liulanjilu)];
    [self.arr addObject:@(yuedupianhao)];
    [self.arr addObject:@(guanyuwomen)];
    [self.arr addObject:@(fenxinag)];
    [self.arr addObject:@(changjianwenti)];
    
}

- (void)setupUIs {
    
    self.myTopView = [[RDMyTopView alloc] init];
    self.myTopView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 210);
    [self.view addSubview:self.myTopView];
    
    self.myTableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    self.myTableView.delegate = self;
    self.myTableView.dataSource = self;
    [self.myTableView registerClass:[MyTableViewCell class] forCellReuseIdentifier:NSStringFromClass([MyTableViewCell class])];
    self.myTableView.backgroundColor = [UIColor whiteColor];
    self.myTableView.frame = CGRectMake(0, self.myTopView.bottom, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - self.myTopView.bottom);
    self.myTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:self.myTableView];
    
    self.errorView = [[MyErrorView alloc] init];
    [self.view addSubview:self.errorView];
    [self.errorView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(self.view);
        make.height.mas_equalTo(35);
    }];
    self.errorView.hidden = YES;
}

- (void)showErrorView:(NSString *)text {
    self.errorView.msgLabel.text = text;
    self.errorView.hidden = NO;
    [UIView animateWithDuration:1.5 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
            self.errorView.alpha = 0;
        } completion:^(BOOL finish){
            self.errorView.hidden = YES;
            self.errorView.alpha = 1;
        }
    ];
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 6;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewAutomaticDimension;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MyTableViewCell *cell = [self.myTableView dequeueReusableCellWithIdentifier:NSStringFromClass([MyTableViewCell class])];
    NSNumber *number = [self.arr objectAtIndex:indexPath.row];
    NSInteger num = number.integerValue; 
    [cell updateWithNumber:num];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSNumber *num = self.arr[indexPath.row];
    NSInteger type = num.integerValue;
    if(type == guanyuwomen) {
        RDAboutUsControllerViewController *VC = [[RDAboutUsControllerViewController alloc] init];
        VC.title = @"关于我们";
        VC.contentStr = @"欢迎对我们产品提出任何的意见与反馈\n\nQQ: 386470983\n\n开发团队：UPC软件1801小分队。\n\n项目成员：陈帮威、陈保瑞、来子愚、刘德鑫(排名不分先后，学号顺序)";
        [self.navigationController pushViewController:VC animated:YES];
        return;
    }
    else if(type == liulanjilu) {
        if([[RDReadRecordManager getAllBooks] count] <= 0) {
            [self showErrorView:@"本地暂无浏览记录"];
            return;
        }
        RDBrowseRecordViewController *VC = [[RDBrowseRecordViewController alloc] init];
        [self.navigationController pushViewController:VC animated:YES];
        return;
    }
    [self showErrorView:@"该服务未开通"];
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
