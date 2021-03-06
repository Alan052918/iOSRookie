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

@protocol DoublyLinkedListDelegate <NSObject>

- (void)initializeDataSourceList;
@optional
- (NSMutableArray *)nodeDataArray;
- (BOOL)nodeShouldRemove:(NSInteger)index;
- (void)listDidRemoveNode:(DoublyLinkedListNode *)removedNode;

@end

@interface DoublyLinkedList : NSObject

@property NSInteger size;
@property (strong, nonatomic, readwrite, nullable) DoublyLinkedListNode *head;
@property (strong, nonatomic, readwrite, nullable) id <DoublyLinkedListDelegate> delegate;

- (BOOL)addNode:(id)newNodeData;
- (DoublyLinkedListNode *)nodeAtIndex:(NSUInteger)index;
- (BOOL)insertNode:(id)newNodeData atIndex:(NSUInteger)index;

//- (BOOL)xx_insertNode:(id)nodeData atIndex:(NSUInteger)index error:(NSError **)error;
 
- (id)removeNodeAtIndex:(NSUInteger)index;
- (id)removeHead;
- (void)printList;
- (BOOL)detectCycle;

+ (DoublyLinkedList *)makeDoublyLinkedListFromNSArray:(NSArray *)array;

@end

NS_ASSUME_NONNULL_END
