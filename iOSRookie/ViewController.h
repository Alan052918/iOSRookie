//
//  ViewController.h
//  iOSRookie
//
//  Created by Alan on 2020/6/23.
//  Copyright © 2020 aijunda. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DoublyLinkedList.h"

@interface ViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) DoublyLinkedList *dataSource;

@end
