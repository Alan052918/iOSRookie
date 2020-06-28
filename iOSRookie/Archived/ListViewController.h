//
//  ListViewController.h
//  iOSRookie
//
//  Created by Alan on 2020/6/24.
//  Copyright © 2020 aijunda. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DoublyLinkedList.h"

NS_ASSUME_NONNULL_BEGIN

@interface ListViewController : UIViewController <DoublyLinkedListDelegate>

- (void)prepareDataSourceList;
- (NSArray *)nodeDataArray;

@end

NS_ASSUME_NONNULL_END
