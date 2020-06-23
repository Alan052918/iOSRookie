//
//  DoublyLinkedListNode.h
//  LearningObjectiveC
//
//  Created by Alan on 2020/6/22.
//  Copyright © 2020 aijunda. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class DoublyLinkedListNode;
@protocol NodeDataSource <NSObject>

- (void)detailForNode:(DoublyLinkedListNode *)node;

@end

@interface DoublyLinkedListNode : NSObject

//@property (strong, readwrite, nonatomic, nonnull) NSNumber *nodeData;
@property (nonatomic, weak) id <NodeDataSource> nodeData;
@property (strong, readwrite, nonatomic, nullable) DoublyLinkedListNode *nextNode;
@property (weak, readwrite, nonatomic, nullable) DoublyLinkedListNode *previousNode;

@end

NS_ASSUME_NONNULL_END
