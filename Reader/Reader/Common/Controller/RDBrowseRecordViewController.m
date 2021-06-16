//
//  RDBrowseRecordViewController.m
//  Reader
//
//  Created by 陈保瑞 on 2021/6/16.
//  Copyright © 2021 LSY. All rights reserved.
//

#import "RDBrowseRecordViewController.h"
#import "RDReadRecordManager.h"
#import "RDBrowerRecordCell.h"
#import "RDCharpterModel.h"
@interface RDBrowseRecordViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *bookView;
@property (nonatomic, strong) NSMutableArray *dataSource;
@end

@implementation RDBrowseRecordViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.dataSource = [[NSMutableArray alloc] initWithArray:[RDReadRecordManager getAllBooks]];
    
    self.topView = [[RDTopView alloc] initWithBackStyle];
    self.topView.titleLabel.text = @"浏览记录";
    [self.view addSubview:self.topView];
    
    self.bookView = [[UITableView alloc] init];
    
    self.bookView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    self.bookView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.bookView registerClass:[RDBrowerRecordCell class] forCellReuseIdentifier:NSStringFromClass([RDBrowerRecordCell class])];
    self.bookView.dataSource = self;
    self.bookView.delegate = self;
    
    [self.view addSubview:self.bookView];
    [self.bookView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.topView.bottom);
        make.left.right.bottom.mas_equalTo(0);
    }];
    
    // Do any additional setup after loading the view.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.dataSource count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    RDBrowerRecordCell *cell = [self.bookView dequeueReusableCellWithIdentifier:NSStringFromClass([RDBrowerRecordCell class])];
    cell.model = [self.dataSource objectAtIndex:indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    RDBookDetailModel *model = [self.dataSource objectAtIndex:indexPath.row];
    [RDReadHelper beginReadWithBookDetail:model];
}

@end
