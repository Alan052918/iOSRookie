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
    self.navigationItem = [[UINavigationItem alloc] init];
    self.confirmButton = [[UIBarButtonItem alloc] initWithTitle:@"添加" style:UIBarButtonItemStyleDone target:self action:@selector(addCell)];
    self.navigationItem.rightBarButtonItem = self.confirmButton;
    
    self.nodeIndexField = [[UITextField alloc] initWithFrame:CGRectMake(0, 150, 100, 30)];
    self.nodeIndexField.borderStyle = UITextBorderStyleRoundedRect;
    [self.nodeIndexField setKeyboardType:UIKeyboardTypeNumberPad];
    [self.view addSubview:self.nodeIndexField];
    
    self.nodeDataField = [[UITextField alloc] initWithFrame:CGRectMake(0, 250, 100, 30)];
    self.nodeDataField.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:self.nodeDataField];
    
    self.delegate = self.navigationController.viewControllers.firstObject;
}


- (void)addCell {
    [self.navigationController popViewControllerAnimated:YES];
    NSInteger nodeIndex = [self.nodeIndexField.text integerValue];
    NSString *nodeData = self.nodeDataField.text;
    [self.delegate insertCellWithData:nodeData atIndex:nodeIndex];
    NSLog(@"insert node: %@ at index: %ld", nodeData, nodeIndex);
}


@end
