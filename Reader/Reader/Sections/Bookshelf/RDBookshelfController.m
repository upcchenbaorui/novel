//
// Created by 陈保瑞 on 2020/10/24.
// Copyright (c) 2020 yuenov. All rights reserved.
//

#import "RDBookshelfController.h"
#import "RDRefreshHeader.h"
#import "RDBookshelfNoneCell.h"
#import "RDBookshelfSearchCell.h"
#import "RDBookDetailModel.h"
#import "RDReadRecordManager.h"
#import "RDBookshelfCell.h"
#import "RDConfigApi.h"
#import "RDConfigModel.h"
#import "RDCheckApi.h"
#import "RDCacheModel.h"
#import "RDReadHelper.h"
#import "RDCheckApi.h"
#import "RDCharpterApi.h"
#import "RDCharpterDataManager.h"
#import "LEEAlert.h"
#import "RDUserMsgManager.h"
#import "RDCharpterModel.h"
#import "RDNetWorkManager.h"
#import "RDDiscoverAllApi.h"
#import "RegisterModel.h"
#import "MyErrorView.h"

#define kItemCount ([RDUtilities iPad] ? 5 : 3)
#define kRDBookListUpdated @"kRDBookListUpdated"
#define kRDLikeUpdated @"kRDLikeUpdated"
#define KRDDeleteBook @"KRDDeleteBook"

@interface RDBookshelfController () <showErrorViewProtocol>

@property (nonatomic,strong) NSMutableArray *dataSource;
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSMutableArray *bookSource;
@property (nonatomic,strong) NSMutableArray *bookInfo;
@property (nonatomic,strong) NSMutableArray *guessYouWant;
@property (nonatomic,strong) MyErrorView *errorView;

@end

@implementation RDBookshelfController
-(void)viewDidLoad{
    [super viewDidLoad];
    [self addErrorView];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(bookChanged:) name:kRDBookListUpdated object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(userLikeChange:) name:kRDLikeUpdated object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(deleteBook:) name:KRDDeleteBook object:nil];
    
    [RDNetWorkManager userLikeBook:^(NetworkModel*  _Nonnull model, NSError * _Nullable error) {
        if(model) {
            if(model.data.category >= 1 && model.data.category <= 9) {
                RDDiscoverAllApi *api = [[RDDiscoverAllApi alloc] init];
                api.page = 1;
                api.size = 8;
                api.categoryId = model.data.category;
                api.type = @"CATEGORY";
                [api startWithCompletionBlock:^(RDBaseApi * _Nonnull request, NSString * _Nonnull error) {
                    if (!error) {
                        NSArray *list = api.list;
                        NSMutableArray *arr = [[NSMutableArray alloc] init];
                        for(RDLibraryDetailModel *item in list) {
                            [arr addObject:item.title];
                        }
                        self.guessYouWant = [arr mutableCopy];
                        [self.tableView reloadData];
                    }
                }];
            }
        }
    }];
    [self.view addSubview:self.topView];
    [self.view addSubview:self.tableView];
    
    [self requestConfigModel];
    [self checkBookUpdate];
    //如果异常退出是阅读状态，那么直接打开书籍
//    if([RDUserMsgManager userIsLogin]) {
//    RDBookDetailModel *book = [RDCacheModel sharedInstance].book;
//        if(book){
//             [RDReadHelper beginReadWithBookDetail:book animation:NO];
//        }
//    }
    
}

- (void)addErrorView {
    self.errorView = [[MyErrorView alloc] init];
    [self.view addSubview:self.errorView];
    [self.errorView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view);
        make.centerY.mas_equalTo(self.view).offset(-50);
        make.height.mas_equalTo(35);
    }];
    self.errorView.hidden = YES;
}

- (void)showErrorView:(NSString *)text {
    self.errorView.msgLabel.text = text;
    self.errorView.hidden = NO;
    [self.view bringSubviewToFront:self.errorView];
    [UIView animateWithDuration:1.5 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
            self.errorView.alpha = 0;
        } completion:^(BOOL finish){
            self.errorView.hidden = YES;
            self.errorView.alpha = 1;
        }
    ];
}

- (void)deleteBook:(NSNotification *)notification {
    NSDictionary *dic = notification.userInfo;
    NSNumber *num = [dic objectForKey:@"code"];
    NSInteger n = num.integerValue;
    if(n == 0) {
        [self showErrorView:@"删除成功"];
    } else if(n == 1) {
        [self showErrorView:@"网络异常，删除失败"];
    } else {
        [self showErrorView:@"删除失败"];
    }
}

- (void)userLikeChange:(NSNotification *)notification {
    NSDictionary *dic = notification.userInfo;
    NSNumber *num = [dic objectForKey:@"category"];
    NSInteger category = num.integerValue;
    if(category >= 1 && category <= 9) {
        RDDiscoverAllApi *api = [[RDDiscoverAllApi alloc] init];
        api.page = 1;
        api.size = 8;
        api.categoryId = category;
        api.type = @"CATEGORY";
        [api startWithCompletionBlock:^(RDBaseApi * _Nonnull request, NSString * _Nonnull error) {
            if (!error) {
                NSArray *list = api.list;
                NSMutableArray *arr = [[NSMutableArray alloc] init];
                for(RDLibraryDetailModel *item in list) {
                    [arr addObject:item.title];
                }
                self.guessYouWant = [arr mutableCopy];
                [self.tableView reloadData];
            }
        }];
    }

    
}

- (NSMutableArray *)guessYouWant {
    if(!_guessYouWant) {
        _guessYouWant = [[NSMutableArray alloc] init];
    }
    return _guessYouWant;
}

- (NSMutableArray *)bookInfo {
    if(!_bookInfo) {
        _bookInfo = [[NSMutableArray alloc] init];
    }
    return _bookInfo;
}

- (void)bookChanged:(NSNotification *)notification {
    
    NSDictionary *userInfo = notification.userInfo;
    NSArray<BookInfoModel> *bookInfo = [userInfo objectForKey:@"bookInfo"];
    NSMutableArray *bookInfos = [[NSMutableArray alloc] init];
    for(BookInfoModel *book in bookInfo) {
        RDBookDetailModel *model = [[RDBookDetailModel alloc] init];
        model.bookId = book.bookId;
        model.coverImg = book.imageUrl;
        model.title = book.bookName;
        [bookInfos addObject:model];
    }
    self.bookInfo = bookInfos;
    [self pp_reload:bookInfos];
}

- (void)pp_reload:(NSArray *)bookInfo {
    [self.dataSource removeAllObjects];
    [self.bookSource removeAllObjects];
    [self.dataSource addObject:@"RDBookshelfSearchCell"];

    
    
    NSArray *books = bookInfo;
    
    _tableView.mj_header =books.count>0?[RDRefreshHeader headerWithRefreshingTarget:self refreshingAction:@selector(headerFresh)]:nil;
    
    if (books.count == 0) {
        [self.dataSource addObject:@"RDBookshelfNoneCell"];
    }
    else{
        NSMutableArray *array;
        for (int i=0; i<books.count; i++) {
            if (i%kItemCount == 0) {
                array = [NSMutableArray array];
                [self.bookSource addObject:array];
            }
           // RDBookDetailModel *record = [RDReadRecordManager getReadRecordWithBookId:290633];
//            RDBookDetailModel *model = [[RDBookDetailModel alloc] init];
//            RDBookDetailModel *tmp = books[i];
//            model.bookId = tmp.bookId;
            [array addObject:books[i]];
        }
        [self.dataSource addObjectsFromArray:self.bookSource];
    }
    
    
    [self.tableView reloadData];
}
//更新配置文件
- (void)requestConfigModel
{
    RDConfigApi *api = [[RDConfigApi alloc] init];
    [api startWithCompletionBlock:^(RDBaseApi * _Nonnull request, NSString * _Nonnull error) {
        if (!error) {
            RDConfigModel *configModel = [api configModel];
            [[RDConfigModel getModel] copyFrom:configModel];
            [[RDConfigModel getModel] archive];
        }
    }];
}

//检查书籍上的书籍是否有更新
-(void)checkBookUpdate
{
    NSArray *array = [RDReadRecordManager getAllOnBookshelfPram];
    if (array.count == 0) {
        if (self.tableView.mj_header.isRefreshing) {
            [self.tableView.mj_header endRefreshing];
        }
        return;
    }
    RDCheckApi *api = [[RDCheckApi alloc] init];
    api.books = array;
    [api startWithCompletionBlock:^(RDBaseApi * _Nonnull request, NSString * _Nonnull error) {
        if (self.tableView.mj_header.isRefreshing) {
            [self.tableView.mj_header endRefreshing];
        }
        if (!error) {
            NSArray *array =  [api updateBooks];
            for (NSDictionary *dic in array) {
                RDCharpterApi *api = [[RDCharpterApi alloc] init];
                api.bookId = [dic[@"bookId"] integerValue];
                api.chapterId = [dic[@"chapterId"] integerValue];
                [api startWithCompletionBlock:^(RDBaseApi * _Nonnull request, NSString * _Nonnull error) {
                    if (self.tableView.mj_header.isRefreshing) {
                        [self.tableView.mj_header endRefreshing];
                    }
                    if (!error) {
                        NSArray *charpters = [api charpters];
                        [RDReadRecordManager updateOnBookselfUpdateWithBookId:api.bookId update:YES];
                        [self p_reload];
                        dispatch_async(dispatch_get_global_queue(0, 0), ^{
                            [RDCharpterDataManager insertObjectsWithCharpters:charpters];
                        });
                    }
                }];
            }
            
        }
    }];
    
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self p_reload];
}
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        _tableView.backgroundColor = RDBackgroudColor;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.estimatedRowHeight = 0;
        _tableView.estimatedSectionHeaderHeight = 0;
        _tableView.estimatedSectionFooterHeight = 0;
    }
    return _tableView;
}
-(NSMutableArray *)dataSource{
    if (!_dataSource) {
        _dataSource = [NSMutableArray array];
    }
    return _dataSource;
}

-(NSMutableArray *)bookSource
{
    if (!_bookSource) {
        _bookSource = [NSMutableArray array];
    }
    return _bookSource;
}

- (RDTopView *)topView {
    if (!_topView) {
        _topView = [[RDTopView alloc] init];
        _topView.titleLabel.text = @"书架";
        _topView.titleLabel.font = RDBoldFont17;
    }

    return _topView;
}

#pragma mark - Delegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataSource.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    id model = [self.dataSource objectAtIndexSafely:indexPath.row];
    if ([model isKindOfClass:[NSString class]] && [model isEqualToString:@"RDBookshelfSearchCell"]) {
        RDBookshelfSearchCell *cell = [tableView dequeueReusableCellWithIdentifier:model];
        if (!cell) {
            cell = [[RDBookshelfSearchCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:model];
        }
        cell.guess = self.guessYouWant;
        return cell;
    }
    if ([model isKindOfClass:[NSString class]] && [model isEqualToString:@"RDBookshelfNoneCell"]) {
        RDBookshelfNoneCell *cell = [tableView dequeueReusableCellWithIdentifier:model];
        if (!cell) {
            cell = [[RDBookshelfNoneCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:model];
        }
        return cell;
    }
    
    if ([model isKindOfClass:NSArray.class]) {
        RDBookshelfCell *cell = [tableView dequeueReusableCellWithIdentifier:@"RDBookshelfCell"];
        if (!cell) {
            cell = [[RDBookshelfCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"RDBookshelfCell"];
            
            __weak typeof(self) weakSelf = self;
            [cell setNeedReload:^{
                [weakSelf p_reload];
            }];
        }
        cell.books = model;
        return cell;
    }
    
    return [UITableViewCell new];
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    id model = [self.dataSource objectAtIndexSafely:indexPath.row];
    if ([model isKindOfClass:[NSString class]] && [model isEqualToString:@"RDBookshelfSearchCell"]){
        return 80;
    }
    if ([model isKindOfClass:[NSString class]] && [model isEqualToString:@"RDBookshelfNoneCell"]){
        return ScreenHeight-80-[UIView navigationBar]-[UIView tarBar]-[UIView statusBar];
    }
    if ([model isKindOfClass:NSArray.class]) {
        return [RDBookshelfCell cellHeight];
    }
    return CGFLOAT_MIN;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return CGFLOAT_MIN;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return CGFLOAT_MIN;
}
#pragma mark - action

-(void)p_reload
{
    if(self.bookInfo.count == 0) return;
    if([self.bookInfo isEqual:self.dataSource]) return;
    [self.dataSource removeAllObjects];
    [self.bookSource removeAllObjects];
    [self.dataSource addObject:@"RDBookshelfSearchCell"];

    
    
    NSArray *books = [self.bookInfo copy];
    
    _tableView.mj_header =books.count>0?[RDRefreshHeader headerWithRefreshingTarget:self refreshingAction:@selector(headerFresh)]:nil;
    
    if (books.count == 0) {
        [self.dataSource addObject:@"RDBookshelfNoneCell"];
    }
    else{
        NSMutableArray *array;
        for (int i=0; i<books.count; i++) {
            if (i%kItemCount == 0) {
                array = [NSMutableArray array];
                [self.bookSource addObject:array];
            }
           // RDBookDetailModel *record = [RDReadRecordManager getReadRecordWithBookId:290633];
//            RDBookDetailModel *model = [[RDBookDetailModel alloc] init];
//            RDBookDetailModel *tmp = books[i];
//            model.bookId = tmp.bookId;
            [array addObject:books[i]];
        }
        [self.dataSource addObjectsFromArray:self.bookSource];
    }
    
    
    [self.tableView reloadData];
}

-(void)headerFresh
{
//    [self checkBookUpdate];
    [RDNetWorkManager reloadBooks];
    if (self.tableView.mj_header.isRefreshing) {
        [self.tableView.mj_header endRefreshing];
    }
    
}

-(void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    self.tableView.frame = CGRectMake(0, self.topView.bottom, self.view.width, self.view.height-self.topView.bottom);
}
@end
