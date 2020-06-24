//
//  ListViewController.m
//  iOSRookie
//
//  Created by Alan on 2020/6/24.
//  Copyright © 2020 aijunda. All rights reserved.
//

#import "ListViewController.h"
#import "DoublyLinkedList.h"
#import "DoublyLinkedListNode.h"
#import "DoublyLinkedListDelegate.h"

@implementation ListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // construct linked list from NSNumber array
    NSArray *array = @[@1, @2, @3, @12, @23, @"Hello"];
    DoublyLinkedList *doublyLinkedList = [DoublyLinkedList makeDoublyLinkedListFromNSArray:array];
    [doublyLinkedList printList];  // 1, 2, 3, 12, 23, Hello
    
    // set delegate
    DoublyLinkedListDelegate *delegate = [[DoublyLinkedListDelegate alloc] init];
    ListViewController *delegateLVC = [[ListViewController alloc] init];
//    doublyLinkedList.delegate = delegate;
    doublyLinkedList.delegate = delegateLVC;
    
    // get node at given index
    DoublyLinkedListNode *doublyLinkedListedNode = [doublyLinkedList getNodeAtIndex:5];
    NSLog(@"Data of node at index 5: %@", doublyLinkedListedNode.nodeData);
    
    // add node
    [doublyLinkedList addNode:@24];
    [doublyLinkedList printList];  // 1, 2, 3, 12, 23, Hello, 24
    
    // insert new node at given index
    [doublyLinkedList insertNode:@YES atIndex:2];
    [doublyLinkedList printList];  // 1, 2, 1, 3, 12, 23, Hello, 24
    
    // remove head
    [doublyLinkedList removeHead];
    [doublyLinkedList printList];  // 2, 1, 3, 12, 23, Hello, 24
    
    // remove node at given index
    [doublyLinkedList removeNodeAtIndex:3];
    [doublyLinkedList printList]; // 2, 1, 12, 23, Hello, 24
    
    // cycle detection
    DoublyLinkedListNode *pointer = doublyLinkedList.head;
    while (pointer.nextNode != nil) {
        pointer = pointer.nextNode;
    }
    pointer.nextNode = doublyLinkedList.head.nextNode.nextNode;
    NSString *cycleDetected = ([doublyLinkedList detectCycle] == 1) ? @"YES" : @"NO";
    NSLog(@"Detecting cycle: %@", cycleDetected);  // Detecting cycle: YES
}

//- (void)nodeShouldRemove {
//
//}

- (void)listDidRemoveNode:(DoublyLinkedListNode *)removedNode {
    NSLog(@"Successfully removed node: %@", removedNode.nodeData);
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
