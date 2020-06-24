//
//  DoublyLinkedListDelegate.m
//  iOSRookie
//
//  Created by Alan on 2020/6/24.
//  Copyright © 2020 aijunda. All rights reserved.
//

#import "DoublyLinkedListDelegate.h"

@implementation DoublyLinkedListDelegate

//- (void)nodeShouldRemove {
//
//}

- (void)listDidRemoveNode:(DoublyLinkedListNode *)removedNode {
    NSLog(@"Successfully removed node: %@", removedNode.nodeData);
}

@end
