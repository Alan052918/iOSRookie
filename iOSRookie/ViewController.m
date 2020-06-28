//
//  ViewController.m
//  iOSRookie
//
//  Created by Alan on 2020/6/23.
//  Copyright © 2020 aijunda. All rights reserved.
//

#import "ViewController.h"
#import "DoublyLinkedListDelegate.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@property (strong,nonatomic) UITableView *tableView;
@property (strong,nonatomic) NSArray *content;

@end

@implementation ViewController

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"cellIdentifier";
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if(cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    cell.textLabel.text =  [self.content objectAtIndex:indexPath.row];
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.content.count;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    DoublyLinkedListDelegate *doublyLinkedListDelegate = [[DoublyLinkedListDelegate alloc] init];
    [doublyLinkedListDelegate prepareDataSourceList];
    NSArray *array = [doublyLinkedListDelegate nodeDataArray];
    self.content = array;

    UINavigationBar* navbar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 64)];
    UINavigationItem* navItem = [[UINavigationItem alloc] initWithTitle:[NSString stringWithFormat:@"Node number: %lu", (unsigned long)array.count]];
    navbar.barTintColor = [UIColor whiteColor];
    [navbar setItems:@[navItem]];
    [self.view addSubview:navbar];
    
    self.tableView.frame = CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height - 64);
    [self.view addSubview:self.tableView];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self.tableView reloadData];
}

- (UITableView *)tableView {
    if (_tableView != nil) {
        return _tableView;
    }
    _tableView = [[UITableView alloc]
                              initWithFrame:[[UIScreen mainScreen] bounds]
                              style:UITableViewStylePlain];
    _tableView.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
    _tableView.delegate = self;
    _tableView.dataSource = self;
    return _tableView;
}

@end
