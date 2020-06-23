//
//  DoublyLinkedList.m
//  LearningObjectiveC
//
//  Created by Alan on 2020/6/22.
//  Copyright © 2020 aijunda. All rights reserved.
//

#import "DoublyLinkedList.h"
#import "DoublyLinkedListNode.h"

@interface DoublyLinkedList()

@property int size;

@end

@implementation DoublyLinkedList

- (void)addNode:(NSNumber *)newNodeData
{
    DoublyLinkedListNode *newNode = [[DoublyLinkedListNode alloc] init];
    newNode.nodeData = newNodeData;
    newNode.nextNode = nil;
    newNode.previousNode = nil;
    if (self.size == 0) {
        self.head = newNode;
    } else {
        DoublyLinkedListNode *iterator = self.head;
        while (iterator.nextNode != nil) {
            iterator = iterator.nextNode;
        }
        iterator.nextNode = newNode;
        newNode.previousNode = iterator;
    }
    self.size++;
}

- (BOOL)insertNode:(NSNumber *)newNodeData atIndex:(int)index
{
    DoublyLinkedListNode *newNode = [[DoublyLinkedListNode alloc] init];
    newNode.nodeData = newNodeData;
    newNode.nextNode = nil;
    newNode.previousNode = nil;
    if (index < 0 || index >= self.size) {
        NSLog(@"Fail to insert node, index out of bounds");
        return NO;
    }
    DoublyLinkedListNode *previousIterator = self.head;
    int iteratorIndex = 0;
    while (previousIterator.nextNode != nil && iteratorIndex < index - 1) {
        previousIterator = previousIterator.nextNode;
        iteratorIndex++;
    }
    DoublyLinkedListNode *postIterator = previousIterator.nextNode;
    previousIterator.nextNode = newNode;
    newNode.nextNode = postIterator;
    postIterator.previousNode = newNode;
    newNode.previousNode = previousIterator;
    self.size++;
    return YES;
}

- (NSNumber *)popHead
{
    if (self.size == 0) {
        return nil;
    }
    DoublyLinkedListNode *placeHolder = self.head;
    self.head = self.head.nextNode;
    self.head.previousNode = nil;
    NSNumber *popData = placeHolder.nodeData;
    placeHolder = nil;
    return popData;
}

//- (NSNumber *)deleteNodeAtIndex:(int)index
//{
//    if (index >= self.size) {
//        NSLog(@"Fail to delete node: index out of bounds");
//        return nil;
//    }
//    DoublyLinkedListNode *previousIterator = self.head;
//     
//}

- (void)printList
{
    DoublyLinkedListNode *iterator = self.head;
    NSMutableArray <NSNumber *> *printedArray = [[NSMutableArray alloc] init];
    while (iterator != nil) {
        [printedArray addObject:iterator.nodeData];
        iterator = iterator.nextNode;
    }
    NSLog(@"List: %@", printedArray);
}

- (BOOL)detectCycle
{
    if (self.size == 0) {
        return NO;
    }
    DoublyLinkedListNode *fastPointer = self.head;
    DoublyLinkedListNode *slowPointer = self.head;
    while (fastPointer.nextNode.nextNode != nil && slowPointer.nextNode != nil) {
        fastPointer = fastPointer.nextNode.nextNode;
        slowPointer = slowPointer.nextNode;
        if ([fastPointer.nodeData isEqualToNumber:slowPointer.nodeData]) {
            return YES;
        }
    }
    return NO;
}

+ (DoublyLinkedList *)makeDoublyLinkedListFromNSArray:(NSArray <NSNumber *> *)array
{
    DoublyLinkedList *doublyLinkedList = [[DoublyLinkedList alloc] init];
    for (NSNumber *number in array) {
        [doublyLinkedList addNode:number];
    }
    return doublyLinkedList;
}

@end
