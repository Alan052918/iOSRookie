//
//  DoublyLinkedListDelegate.m
//  iOSRookie
//
//  Created by Alan on 2020/6/24.
//  Copyright © 2020 aijunda. All rights reserved.
//

#import "DoublyLinkedListDelegate.h"

@interface DoublyLinkedListDelegate() <DoublyLinkedListDelegate>

@property (strong, nonatomic) DoublyLinkedList *dataSourceList;

@end

@implementation DoublyLinkedListDelegate

- (void)prepareDataSourceList {
    NSMutableArray *marray = [[NSMutableArray alloc] init];
    for (int i = 1; i <= 100; i++) {
        [marray addObject:[NSString stringWithFormat:@"%d", i]];
    }
    NSArray *array = [NSArray arrayWithArray:marray];
    self.dataSourceList = [DoublyLinkedList makeDoublyLinkedListFromNSArray:array];
}

- (NSArray *)nodeDataArray {
    NSMutableArray *array = [[NSMutableArray alloc] init];
    DoublyLinkedListNode *iterator = self.dataSourceList.head;
    while (iterator != nil) {
        [array addObject:iterator.nodeData];
        iterator = iterator.nextNode;
    }
    return array;
}

- (void)listDidRemoveNode:(DoublyLinkedListNode *)removedNode {
    NSLog(@"Successfully removed node: %@", removedNode.nodeData);
}

- (BOOL)nodeShouldRemove:(nonnull DoublyLinkedListNode *)node {
    return YES;
}

@end
