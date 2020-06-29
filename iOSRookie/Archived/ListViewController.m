////
////  ListViewController.m
////  iOSRookie
////
////  Created by Alan on 2020/6/24.
////  Copyright © 2020 aijunda. All rights reserved.
////
//
//#import "ListViewController.h"
//#import "DoublyLinkedList.h"
//#import "DoublyLinkedListNode.h"
//#import "DoublyLinkedListDelegate.h"
//
//@interface ListViewController ()
//
//@property (strong, nonatomic) DoublyLinkedList *dataSourceList;
//
//@end
//
//@implementation ListViewController
//
//- (void)viewDidLoad {
//    [super viewDidLoad];
//    
//    NSArray *array = @[@1, @2, @3, @12, @23, @"Hello"];
//    DoublyLinkedList *doublyLinkedList = [DoublyLinkedList makeDoublyLinkedListFromNSArray:array];
//    [doublyLinkedList printList];  // 1, 2, 3, 12, 23, Hello
//    
////    DoublyLinkedListDelegate *delegate = [[DoublyLinkedListDelegate alloc] init];
//    ListViewController *delegateLVC = [[ListViewController alloc] init];
////    doublyLinkedList.delegate = delegate;
//    doublyLinkedList.delegate = delegateLVC;
//    
//    DoublyLinkedListNode *doublyLinkedListedNode = [doublyLinkedList nodeAtIndex:5];
//    NSLog(@"Data of node at index 5: %@", doublyLinkedListedNode.nodeData);  // Data of node at index 5: Hello
//    
//    [doublyLinkedList addNode:@24];
//    [doublyLinkedList printList];  // 1, 2, 3, 12, 23, Hello, 24
//    
//    [doublyLinkedList insertNode:@YES atIndex:2];
//    [doublyLinkedList printList];  // 1, 2, 1, 3, 12, 23, Hello, 24
//    
//    [doublyLinkedList removeHead];
//    [doublyLinkedList printList];  // 2, 1, 3, 12, 23, Hello, 24
//    
//    [doublyLinkedList removeNodeAtIndex:3];
//    [doublyLinkedList printList]; // 2, 1, 12, 23, Hello, 24
//    
//    DoublyLinkedListNode *pointer = doublyLinkedList.head;
//    while (pointer.nextNode != nil) {
//        pointer = pointer.nextNode;
//    }
//    pointer.nextNode = doublyLinkedList.head.nextNode.nextNode;
//    NSString *cycleDetected = ([doublyLinkedList detectCycle] == 1) ? @"YES" : @"NO";
//    NSLog(@"Detecting cycle: %@", cycleDetected);  // Detecting cycle: YES
//    
//    self.dataSourceList = doublyLinkedList;
//}
//
//- (void)prepareDataSourceList {
//    NSMutableArray *marray = [[NSMutableArray alloc] init];
//    for (int i = 1; i <= 100; i++) {
//        [marray addObject:[NSString stringWithFormat:@"%d", i]];
//    }
//    NSArray *array = [NSArray arrayWithArray:marray];
//    self.dataSourceList = [DoublyLinkedList makeDoublyLinkedListFromNSArray:array];
//}
//
//- (NSArray *)nodeDataArray {
//    NSMutableArray *array = [[NSMutableArray alloc] init];
//    DoublyLinkedListNode *iterator = self.dataSourceList.head;
//    while (iterator != nil) {
//        [array addObject:iterator.nodeData];
//        iterator = iterator.nextNode;
//    }
//    return array;
//}
//
////- (void)nodeShouldRemove {
////
////}
//
//- (void)listDidRemoveNode:(DoublyLinkedListNode *)removedNode {
//    NSLog(@"Successfully removed node: %@", removedNode.nodeData);
//}
//
//@end
