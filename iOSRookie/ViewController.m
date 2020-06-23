//
//  ViewController.m
//  iOSRookie
//
//  Created by Alan on 2020/6/23.
//  Copyright © 2020 aijunda. All rights reserved.
//

#import "ViewController.h"
#import "./DoublyLinkedList/DoublyLinkedList.h"
#import "./DoublyLinkedList/DoublyLinkedListNode.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSArray *array = @[@1, @2, @3, @12, @23];
    
    // construct linked list from NSNumber array
    DoublyLinkedList *doublyLinkedList = [DoublyLinkedList makeDoublyLinkedListFromNSArray:array];
    [doublyLinkedList printList];
    
    // insert new node at given index
    [doublyLinkedList insertNode:@35 atIndex:2];
    [doublyLinkedList printList];
    
    // cycle detection
    DoublyLinkedListNode *pointer = doublyLinkedList.head;
    while (pointer.nextNode != nil) {
        pointer = pointer.nextNode;
    }
    pointer.nextNode = doublyLinkedList.head;
    NSString *cycleDetected = ([doublyLinkedList detectCycle] == 1) ? @"YES" : @"NO";
    NSLog(@"Detecting cycle: %@", cycleDetected);
}


@end
