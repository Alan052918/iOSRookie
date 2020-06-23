//
//  DoublyLinkedList.h
//  LearningObjectiveC
//
//  Created by Alan on 2020/6/22.
//  Copyright © 2020 aijunda. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DoublyLinkedListNode.h"

NS_ASSUME_NONNULL_BEGIN

@interface DoublyLinkedList : NSObject

@property (strong, nonatomic, readwrite, nullable) DoublyLinkedListNode *head;

- (void)addNode:(NSNumber *)newNodeData;
- (BOOL)insertNode:(NSNumber *)newNodeData atIndex:(int)index;
- (NSNumber *)popHead;
//- (NSNumber *)deleteNodeAtIndex:(int)index;
- (void)printList;
- (BOOL)detectCycle;

+ (DoublyLinkedList *)makeDoublyLinkedListFromNSArray:(NSArray *)array;

@end

NS_ASSUME_NONNULL_END
