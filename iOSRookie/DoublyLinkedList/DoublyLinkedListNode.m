//
//  DoublyLinkedListNode.m
//  LearningObjectiveC
//
//  Created by Alan on 2020/6/22.
//  Copyright © 2020 aijunda. All rights reserved.
//

#import "DoublyLinkedListNode.h"

@implementation DoublyLinkedListNode

- (void)setNodeData:(id<NodeDataSource>)nodeData {
    if ([_nodeData conformsToProtocol:@protocol(NodeDataSource)] &&
        [_nodeData respondsToSelector:@selector(detailForNode:)]) {
        [_nodeData detailForNode:self];
    }
}

@end
