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

- (void)addNode:(id)newNodeData {
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

- (DoublyLinkedListNode *)nodeAtIndex:(NSUInteger)index {
    if (index < 0 || index >= self.size) {
        NSLog(@"Fail to fetch node: index out of bounds");
        return nil;
    }
    DoublyLinkedListNode *iterator = self.head;
    while (iterator != nil && index > 0) {
        iterator = iterator.nextNode;
        index--;
    }
    return iterator;
}

- (BOOL)insertNode:(id)newNodeData atIndex:(NSUInteger)index {
    if (self.size == 0) {
        [self addNode:newNodeData];
        return YES;
    }
    DoublyLinkedListNode *previousNeighbor = [self nodeAtIndex:index - 1];
    if (previousNeighbor == nil) {
        NSLog(@"Fail to insert node: index out of bounds");
        return NO;
    }
    if (previousNeighbor.nextNode == nil) {
        [self addNode:newNodeData];
        return YES;
    }
    DoublyLinkedListNode *nextNeighbor = previousNeighbor.nextNode;
    DoublyLinkedListNode *newNode = [[DoublyLinkedListNode alloc] init];
    newNode.nodeData = newNodeData;
    newNode.nextNode = nextNeighbor;
    newNode.previousNode = previousNeighbor;
    previousNeighbor.nextNode = newNode;
    nextNeighbor.previousNode = newNode;
    return YES;
}

/**
 * Remove node at given index
 *
 * @param index index of the node to be removed
 * @return data of the removed node
 */
- (id)removeNodeAtIndex:(NSUInteger)index {
    DoublyLinkedListNode *targetNode = [self nodeAtIndex:index];
    if (targetNode == nil) {
        NSLog(@"Fail to delete node: index out of bounds");
        return nil;
    }
    DoublyLinkedListNode *previousNeighbor = targetNode.previousNode;
    DoublyLinkedListNode *nextNeighbor = targetNode.nextNode;
    id targetNodeData = targetNode.nodeData;
    previousNeighbor.nextNode = nextNeighbor;
    nextNeighbor.previousNode = previousNeighbor;
    [self.delegate listDidRemoveNode:targetNode];
    targetNode = nil;
    return targetNodeData;
}

- (id)removeHead {
    if (self.size == 0) {
        return nil;
    }
    DoublyLinkedListNode *headNode = self.head;
    id headData = headNode.nodeData;
    self.head = headNode.nextNode;
    self.head.previousNode = nil;
    [self.delegate listDidRemoveNode:headNode];
    headNode = nil;
    return headData;
}

- (void)printList {
    DoublyLinkedListNode *iterator = self.head;
    NSMutableArray *printedArray = [[NSMutableArray alloc] init];
    while (iterator != nil) {
        [printedArray addObject:iterator.nodeData];
        iterator = iterator.nextNode;
    }
    NSLog(@"List: %@", printedArray);
}

- (BOOL)detectCycle {
    if (self.size == 0) {
        return NO;
    }
    DoublyLinkedListNode *fastPointer = self.head;
    DoublyLinkedListNode *slowPointer = self.head;
    while (fastPointer.nextNode.nextNode != nil && slowPointer.nextNode != nil) {
        fastPointer = fastPointer.nextNode.nextNode;
        slowPointer = slowPointer.nextNode;
        if ([fastPointer.nodeData isEqual:slowPointer.nodeData]) {
            return YES;
        }
    }
    return NO;
}

+ (DoublyLinkedList *)makeDoublyLinkedListFromNSArray:(NSArray *)array {
    DoublyLinkedList *doublyLinkedList = [[DoublyLinkedList alloc] init];
    for (id arrayItem in array) {
        [doublyLinkedList addNode:arrayItem];
    }
    return doublyLinkedList;
}

@end
