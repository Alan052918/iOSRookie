//
//  ViewController.m
//  iOSRookie
//
//  Created by Alan on 2020/6/23.
//  Copyright © 2020 aijunda. All rights reserved.
//

#import "ViewController.h"
#import "DoublyLinkedList.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource, DoublyLinkedListDelegate>

@property (strong, nonatomic) UINavigationBar *navigationBar;
@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) NSIndexPath *selectedIndexPath;
@property (strong, nonatomic) DoublyLinkedList *dataSourceList;

- (void)onTapCancel;
- (void)onTapConfirm;
- (void)initializeDataSourceList;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initializeDataSourceList];
    
    self.tableView.frame = CGRectMake(0, 88, self.view.frame.size.width, self.view.frame.size.height - 88);
    [self.view addSubview:self.tableView];
    
    self.navigationBar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, 40, self.view.frame.size.width, 48)];
    UINavigationItem* navItem = [[UINavigationItem alloc] initWithTitle:[NSString stringWithFormat:@"节点数量: %lu", self.dataSourceList.size]];
    [self.navigationBar setItems:@[navItem]];
    [self.navigationBar setBarTintColor:[UIColor whiteColor]];
    [self.view addSubview:self.navigationBar];
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSourceList.size;
}


- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"cellIdentifier";
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if(cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    cell.textLabel.text = (NSString *)[self.dataSourceList nodeAtIndex:indexPath.row].nodeData;
    return cell;
}


- (void)onTapCancel {
    NSLog(@"Cancel removing row: %ld", self.selectedIndexPath.row);
    [self.tableView deselectRowAtIndexPath:self.selectedIndexPath animated:YES];
    self.selectedIndexPath = nil;
    self.navigationBar.topItem.title = [NSString stringWithFormat:@"节点数量: %lu", self.dataSourceList.size];
    self.navigationBar.topItem.leftBarButtonItem = nil;
    self.navigationBar.topItem.rightBarButtonItem = nil;
}


- (void)onTapConfirm {
    NSLog(@"Confirm removing row: %ld", self.selectedIndexPath.row);
    [self.dataSourceList removeNodeAtIndex:self.selectedIndexPath.row];
    self.selectedIndexPath = nil;
    [self.tableView reloadData];
    self.navigationBar.topItem.title = [NSString stringWithFormat:@"节点数量: %lu", self.dataSourceList.size];
    self.navigationBar.topItem.leftBarButtonItem = nil;
    self.navigationBar.topItem.rightBarButtonItem = nil;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView selectRowAtIndexPath:indexPath animated:YES scrollPosition:UITableViewScrollPositionMiddle];
    self.selectedIndexPath = indexPath;
    NSLog(@"Select row: %ld", indexPath.row);
    self.navigationBar.topItem.title = @"是否删除节点";
    
    UIBarButtonItem *cancelButton = [[UIBarButtonItem alloc] init];
    cancelButton.title = @"取消";
    cancelButton.target = self;
    cancelButton.action = @selector(onTapCancel);
    self.navigationBar.topItem.leftBarButtonItem = cancelButton;
    
    UIBarButtonItem *confirmButton = [[UIBarButtonItem alloc] init];
    confirmButton.title = @"确定";
    confirmButton.target = self;
    confirmButton.action = @selector(onTapConfirm);
    self.navigationBar.topItem.rightBarButtonItem = confirmButton;
}


- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [_tableView reloadData];
}


- (UITableView *)tableView {
    if (_tableView != nil) {
        return _tableView;
    }
    _tableView = [[UITableView alloc] initWithFrame:[[UIScreen mainScreen] bounds] style:UITableViewStylePlain];
    _tableView.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
    _tableView.delegate = self;
    _tableView.dataSource = self;
    return _tableView;
}


- (void)initializeDataSourceList {
    self.dataSourceList = [[DoublyLinkedList alloc] init];
    for (int i = 1; i <= 100; i++) {
        [self.dataSourceList addNode:[NSString stringWithFormat:@"%d", i]];
    }
}


@end
