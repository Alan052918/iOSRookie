//
//  ViewController.m
//  iOSRookie
//
//  Created by Alan on 2020/6/23.
//  Copyright © 2020 aijunda. All rights reserved.
//

#import "ViewController.h"
#import "ListViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
  if (self = [super initWithCoder:aDecoder]) {
      ListViewController *listViewController = [[ListViewController alloc] init];
      [self addChildViewController:listViewController];
  }
  return self;
}

@end
