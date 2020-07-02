//
//  ViewController.m
//  iOSRookie
//
//  Created by Alan on 2020/6/23.
//  Copyright © 2020 aijunda. All rights reserved.
//

#import "ViewController.h"
#import "DoublyLinkedList.h"
#import "CellDetailViewController.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource, DoublyLinkedListDelegate, CellCreationDelegate>

@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) NSIndexPath *selectedIndexPath;
@property (strong, nonatomic) DoublyLinkedList *dataSourceList;
@property (strong, nonatomic) UINavigationItem *navigationItem;
@property (strong, nonatomic) UIBarButtonItem *addButton;
@property (strong, nonatomic) UIBarButtonItem *cancelButton;
@property (strong, nonatomic) UIBarButtonItem *confirmButton;
@property BOOL shouldRemove;

- (void)addCell;
- (void)cancelRemoveCell;
- (void)confirmRemoveCell;
- (void)initializeDataSourceList;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initializeDataSourceList];
    self.tableView.frame = CGRectMake(0, 88, self.view.frame.size.width, self.view.frame.size.height - 88);
    [self.view addSubview:self.tableView];
    
    self.addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addCell)];
    self.cancelButton = [[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(cancelRemoveCell)];
    self.confirmButton = [[UIBarButtonItem alloc] initWithTitle:@"确定" style:UIBarButtonItemStyleDone target:self action:@selector(confirmRemoveCell)];
    
    self.navigationItem = [[UINavigationItem alloc] initWithTitle:[NSString stringWithFormat:@"节点数量: %lu", self.dataSourceList.size]];
    self.navigationItem.rightBarButtonItem = self.addButton;
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


- (void)addCell {
    CellDetailViewController *detailViewController = [[CellDetailViewController alloc] init];
    detailViewController.delegate = self;
    [self.navigationController pushViewController:detailViewController animated:YES];
}


- (void)cancelRemoveCell {
    NSLog(@"Cancel removing row: %ld", self.selectedIndexPath.row);
    [self.tableView deselectRowAtIndexPath:self.selectedIndexPath animated:YES];
    self.selectedIndexPath = nil;
    self.navigationItem.title = [NSString stringWithFormat:@"节点数量: %lu", self.dataSourceList.size];
    self.navigationItem.leftBarButtonItem = nil;
    self.navigationItem.rightBarButtonItem = self.addButton;
}


- (void)confirmRemoveCell {
    NSLog(@"Confirm removing row: %ld", self.selectedIndexPath.row);
    [self.dataSourceList removeNodeAtIndex:self.selectedIndexPath.row];
    self.selectedIndexPath = nil;
    [self.tableView reloadData];
    self.navigationItem.title = [NSString stringWithFormat:@"节点数量: %lu", self.dataSourceList.size];
    self.navigationItem.leftBarButtonItem = nil;
    self.navigationItem.rightBarButtonItem = self.addButton;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView selectRowAtIndexPath:indexPath animated:YES scrollPosition:UITableViewScrollPositionMiddle];
    self.selectedIndexPath = indexPath;
    NSLog(@"Select row: %ld", indexPath.row);
    self.navigationItem.title = @"是否删除节点";
    self.navigationItem.leftBarButtonItem = self.cancelButton;
    self.navigationItem.rightBarButtonItem = self.confirmButton;
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
    self.dataSourceList.delegate = self;
}


- (BOOL)tableInsertCellWithData:(id)cellData atIndex:(NSUInteger)cellIndex error:(NSError **)error {
    if ([self.dataSourceList insertNode:cellData atIndex:cellIndex] == NO) {
        return NO;
    }
    [self.tableView reloadData];
    return YES;
}


@end
