//
//  CellDetailViewController.m
//  iOSRookie
//
//  Created by Alan Ai on 2020/6/29.
//  Copyright © 2020 aijunda. All rights reserved.
//

#import "CellDetailViewController.h"
#import "DoublyLinkedList.h"
#import "ViewController.h"

@interface CellDetailViewController ()

@property (strong, nonatomic) UINavigationItem *navigationItem;
@property (strong, nonatomic) UIBarButtonItem *confirmButton;
@property (strong, nonatomic) UITextView *nodeIndexPrompt;
@property (strong, nonatomic) UITextField *nodeIndexField;
@property (strong, nonatomic) UITextView *nodeDataPrompt;
@property (strong, nonatomic) UITextField *nodeDataField;

- (void)addCell;

@end

@implementation CellDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem = [[UINavigationItem alloc] init];
    self.confirmButton = [[UIBarButtonItem alloc] initWithTitle:@"添加" style:UIBarButtonItemStyleDone target:self action:@selector(addCell)];
    self.navigationItem.rightBarButtonItem = self.confirmButton;
    
    NSLog(@"view frame width: %f", self.view.frame.size.width);
    NSLog(@"view frame height: %f", self.view.frame.size.width);
    NSLog(@"view bounds width: %f", self.view.bounds.size.width);
    NSLog(@"view bounds height: %f", self.view.bounds.size.width);
    self.nodeIndexPrompt = [[UITextView alloc] initWithFrame:CGRectMake(140, 120, 100, 30)];
    self.nodeIndexPrompt.text = @"节点位置：";
    self.nodeIndexPrompt.textAlignment = NSTextAlignmentCenter;
    [self.nodeIndexPrompt setFont:[UIFont systemFontOfSize:16]];
    [self.nodeIndexPrompt setUserInteractionEnabled:NO];
    [self.view addSubview:self.nodeIndexPrompt];
    
    self.nodeIndexField = [[UITextField alloc] initWithFrame:CGRectMake(140, 150, 100, 30)];
    self.nodeIndexField.borderStyle = UITextBorderStyleRoundedRect;
    self.nodeIndexField.placeholder = @"i.e.: 0";
    [self.nodeIndexField setKeyboardType:UIKeyboardTypeNumberPad];
    [self.view addSubview:self.nodeIndexField];
    
    self.nodeDataPrompt = [[UITextView alloc] initWithFrame:CGRectMake(140, 220, 100, 30)];
    self.nodeDataPrompt.text = @"节点内容：";
    self.nodeDataPrompt.textAlignment = NSTextAlignmentCenter;
    [self.nodeDataPrompt setFont:[UIFont systemFontOfSize:16]];
    [self.nodeDataPrompt setUserInteractionEnabled:NO];
    [self.view addSubview:self.nodeDataPrompt];
    
    self.nodeDataField = [[UITextField alloc] initWithFrame:CGRectMake(140, 250, 100, 30)];
    self.nodeDataField.borderStyle = UITextBorderStyleRoundedRect;
    self.nodeDataField.placeholder = @"i.e.: abc";
    [self.view addSubview:self.nodeDataField];
}


- (void)addCell {
    [self.navigationController popViewControllerAnimated:YES];
    NSInteger nodeIndex = [self.nodeIndexField.text integerValue];
    NSString *nodeData = self.nodeDataField.text;
    NSError *error = [[NSError alloc] init];
    BOOL isSuccessful = [self.delegate tableInsertCellWithData:nodeData atIndex:nodeIndex error:&error];
    if (!isSuccessful) {
        NSLog(@"Fail to insert cell");
        return;
    }
    NSLog(@"insert node: %@ at index: %ld", nodeData, nodeIndex);
}


@end
