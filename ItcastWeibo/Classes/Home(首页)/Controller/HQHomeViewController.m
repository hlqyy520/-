//
//  HQHomeViewController.m
//  HQWeibo
//
//  Created by apple on 15-2-5.
//  Copyright (c) 2014年 HaoLiqiang All rights reserved.
//

#import "HQHomeViewController.h"
#import "HQBadgeButton.h"
#import "UIBarButtonItem+MJ.h"
#import "HQTitleButton.h"
#import "AFNetworking.h"
#import "HQAccountTool.h"
#import "HQAccount.h"
#import "UIImageView+WebCache.h"
#import "HQStatus.h"
#import "HQUser.h"
#import "HQStatusFrame.h"
#import "MJExtension.h"
#import "HQStatusCell.h"
#import "HQUser.h"
#import "MJRefresh.h"

@interface HQHomeViewController () <MJRefreshBaseViewDelegate>
@property (nonatomic, weak) HQTitleButton *titleButton;
@property (nonatomic, strong) NSMutableArray *statusFrames;
@property (nonatomic, weak) MJRefreshFooterView *footer;
@property (nonatomic, weak) MJRefreshHeaderView *header;
@end

@implementation HQHomeViewController

- (NSMutableArray *)statusFrames
{
    if (_statusFrames == nil) {
        _statusFrames = [NSMutableArray array];
    }
    return _statusFrames;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // 0.集成刷新控件
    [self setupRefreshView];
    
    // 1.设置导航栏的内容
    [self setupNavBar];
    
    // 2.获得用户信息
    [self setupUserData];
}

- (void)viewDidAppear:(BOOL)animated {}

/**
 *  获得用户信息
 */
- (void)setupUserData
{
    // 1.创建请求管理对象
    AFHTTPRequestOperationManager *mgr = [AFHTTPRequestOperationManager manager];
    
    // 2.封装请求参数
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"access_token"] = [HQAccountTool account].access_token;
    params[@"uid"] = @([HQAccountTool account].uid);
    
    // 3.发送请求
    [mgr GET:@"https://api.weibo.com/2/users/show.json" parameters:params
     success:^(AFHTTPRequestOperation *operation, id responseObject) {
         // 字典转模型
         HQUser *user = [HQUser objectWithKeyValues:responseObject];
         // 设置标题文字
         [self.titleButton setTitle:user.name forState:UIControlStateNormal];
         // 保存昵称
         HQAccount *account = [HQAccountTool account];
         account.name = user.name;
         [HQAccountTool saveAccount:account];
     } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
         
     }];
}

/**
 *  集成刷新控件
 */
- (void)setupRefreshView
{
    // 1.下拉刷新
    MJRefreshHeaderView *header = [MJRefreshHeaderView header];
    header.scrollView = self.tableView;
    header.delegate = self;
    // 自动进入刷新状态
    [header beginRefreshing];
    self.header = header;
    
    // 2.上拉刷新(上拉加载更多数据)
    MJRefreshFooterView *footer = [MJRefreshFooterView footer];
    footer.scrollView = self.tableView;
    footer.delegate = self;
    self.footer = footer;
//    footer.beginRefreshingBlock = ^(MJRefreshBaseView *refreshView){
//        HQLog(@"refreshing.....");
//    };
}

- (void)dealloc
{
    // 释放内存
    [self.header free];
    [self.footer free];
}

/**
 *  刷新控件进入开始刷新状态的时候调用
 */
- (void)refreshViewBeginRefreshing:(MJRefreshBaseView *)refreshView
{
    if ([refreshView isKindOfClass:[MJRefreshFooterView class]]) { // 上拉刷新
        [self loadMoreData];
    } else { // 下拉刷新
        [self loadNewData];
    }
}

/**
 *  发送请求加载更多的微博数据
 */
- (void)loadMoreData
{
    // 1.创建请求管理对象
    AFHTTPRequestOperationManager *mgr = [AFHTTPRequestOperationManager manager];
    
    // 2.封装请求参数
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"access_token"] = [HQAccountTool account].access_token;
    params[@"count"] = @5;
    if (self.statusFrames.count) {
        HQStatusFrame *statusFrame = [self.statusFrames lastObject];
        // 加载ID <= max_id的微博
        long long maxId = [statusFrame.status.idstr longLongValue] - 1;
        params[@"max_id"] = @(maxId);
    }
    
    // 3.发送请求
    [mgr GET:@"https://api.weibo.com/2/statuses/home_timeline.json" parameters:params
     success:^(AFHTTPRequestOperation *operation, id responseObject) {
         // 将字典数组转为模型数组(里面放的就是HQStatus模型)
         NSArray *statusArray = [HQStatus objectArrayWithKeyValuesArray:responseObject[@"statuses"]];
         // 创建frame模型对象
         NSMutableArray *statusFrameArray = [NSMutableArray array];
         for (HQStatus *status in statusArray) {
             HQStatusFrame *statusFrame = [[HQStatusFrame alloc] init];
             // 传递微博模型数据
             statusFrame.status = status;
             [statusFrameArray addObject:statusFrame];
         }
         
         // 添加新数据到旧数据的后面
         [self.statusFrames addObjectsFromArray:statusFrameArray];
         
         // 刷新表格
         [self.tableView reloadData];
         
         // 让刷新控件停止显示刷新状态
         [self.footer endRefreshing];
     } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
         // 让刷新控件停止显示刷新状态
         [self.footer endRefreshing];
     }];
}

/**
 *  // 刷新数据(向新浪获取更新的微博数据)
 */
- (void)loadNewData
{
    // 1.创建请求管理对象
    AFHTTPRequestOperationManager *mgr = [AFHTTPRequestOperationManager manager];
    
    // 2.封装请求参数
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"access_token"] = [HQAccountTool account].access_token;
    params[@"count"] = @5;
    if (self.statusFrames.count) {
        HQStatusFrame *statusFrame = self.statusFrames[0];
        // 加载ID比since_id大的微博
        params[@"since_id"] = statusFrame.status.idstr;
    }
    
    // 3.发送请求
    [mgr GET:@"https://api.weibo.com/2/statuses/home_timeline.json" parameters:params
     success:^(AFHTTPRequestOperation *operation, id responseObject) {
         // 将字典数组转为模型数组(里面放的就是HQStatus模型)
         NSArray *statusArray = [HQStatus objectArrayWithKeyValuesArray:responseObject[@"statuses"]];
         // 创建frame模型对象
         NSMutableArray *statusFrameArray = [NSMutableArray array];
         for (HQStatus *status in statusArray) {
             HQStatusFrame *statusFrame = [[HQStatusFrame alloc] init];
             // 传递微博模型数据
             statusFrame.status = status;
             [statusFrameArray addObject:statusFrame];
         }
         
         // 将最新的数据追加到旧数据的最前面
         // 旧数据: self.statusFrames
         // 新数据: statusFrameArray
         NSMutableArray *tempArray = [NSMutableArray array];
         // 添加statusFrameArray的所有元素 添加到 tempArray中
         [tempArray addObjectsFromArray:statusFrameArray];
         // 添加self.statusFrames的所有元素 添加到 tempArray中
         [tempArray addObjectsFromArray:self.statusFrames];
         self.statusFrames = tempArray;
         
         // 刷新表格
         [self.tableView reloadData];
         
         // 让刷新控件停止显示刷新状态
         [self.header endRefreshing];
         
         // 显示最新微博的数量(给用户一些友善的提示)
         [self showNewStatusCount:statusFrameArray.count];
     } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
         // 让刷新控件停止显示刷新状态
         [self.header endRefreshing];
     }];
}

/**
 *  显示最新微博的数量
 *
 *  @param count 最新微博的数量
 */
- (void)showNewStatusCount:(int)count
{
    // 1.创建一个按钮
    UIButton *btn = [[UIButton alloc] init];
    // below : 下面  btn会显示在self.navigationController.navigationBar的下面
    [self.navigationController.view insertSubview:btn belowSubview:self.navigationController.navigationBar];
    
    // 2.设置图片和文字
    btn.userInteractionEnabled = NO;
    [btn setBackgroundImage:[UIImage resizedImageWithName:@"timeline_new_status_background"] forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:14];
    if (count) {
        NSString *title = [NSString stringWithFormat:@"共有%d条新的微博", count];
        [btn setTitle:title forState:UIControlStateNormal];
    } else {
        [btn setTitle:@"没有新的微博数据" forState:UIControlStateNormal];
    }
    
    // 3.设置按钮的初始frame
    CGFloat btnH = 30;
    CGFloat btnY = 64 - btnH;
    CGFloat btnX = 0;
    CGFloat btnW = self.view.frame.size.width - 2 * btnX;
    btn.frame = CGRectMake(btnX, btnY, btnW, btnH);
    
    // 4.通过动画移动按钮(按钮向下移动 btnH + 1)
    [UIView animateWithDuration:0.7 animations:^{
        
        btn.transform = CGAffineTransformMakeTranslation(0, btnH);
        
    } completion:^(BOOL finished) { // 向下移动的动画执行完毕后
        
        // 建议:尽量使用animateWithDuration, 不要使用animateKeyframesWithDuration
        [UIView animateWithDuration:0.7 delay:1.0 options:UIViewAnimationOptionCurveLinear animations:^{
            btn.transform = CGAffineTransformIdentity;
        } completion:^(BOOL finished) {
            // 将btn从内存中移除
            [btn removeFromSuperview];
        }];
        
    }];
}

/**
 *  设置导航栏的内容
 */
- (void)setupNavBar
{
    // 左边按钮
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithIcon:@"navigationbar_friendsearch" highIcon:@"navigationbar_friendsearch_highlighted" target:self action:@selector(findFriend)];
    
    // 右边按钮
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithIcon:@"navigationbar_pop" highIcon:@"navigationbar_pop_highlighted" target:self action:@selector(pop)];
    
    // 中间按钮
    HQTitleButton *titleButton = [HQTitleButton titleButton];
    // 图标
    [titleButton setImage:[UIImage imageWithName:@"navigationbar_arrow_down"] forState:UIControlStateNormal];
    // 位置和尺寸
    titleButton.frame = CGRectMake(0, 0, 0, 40);
    // 文字
    if ([HQAccountTool account].name) {
        [titleButton setTitle:[HQAccountTool account].name forState:UIControlStateNormal];
    } else {
        [titleButton setTitle:@"首页" forState:UIControlStateNormal];
    }
    [titleButton addTarget:self action:@selector(titleClick:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.titleView = titleButton;
    self.titleButton = titleButton;
    
    self.tableView.backgroundColor = HQGlobalBg;
    self.tableView.contentInset = UIEdgeInsetsMake(0, 0, HQStatusTableBorder, 0);
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}

- (void)titleClick:(HQTitleButton *)titleButton
{
    if (titleButton.currentImage == [UIImage imageWithName:@"navigationbar_arrow_up"]) {
        [titleButton setImage:[UIImage imageWithName:@"navigationbar_arrow_down"] forState:UIControlStateNormal];
    } else {
        [titleButton setImage:[UIImage imageWithName:@"navigationbar_arrow_up"] forState:UIControlStateNormal];
    }
}

- (void)findFriend
{
    HQLog(@"findFriend");
}

- (void)pop
{
    HQLog(@"pop");
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.statusFrames.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 1.创建cell
    HQStatusCell *cell = [HQStatusCell cellWithTableView:tableView];
    
    // 2.传递frame模型
    cell.statusFrame = self.statusFrames[indexPath.row];
    
    return cell;
}

#pragma mark - 代理方法
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    HQStatusFrame *statusFrame = self.statusFrames[indexPath.row];
    return statusFrame.cellHeight;
}
@end