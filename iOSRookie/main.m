//
//  main.m
//  iOSRookie
//
//  Created by Alan on 2020/6/23.
//  Copyright © 2020 aijunda. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

int main(int argc, char * argv[]) {
    NSString * appDelegateClassName;
    @autoreleasepool {
        // Setup code that might create autoreleased objects goes here.
        appDelegateClassName = NSStringFromClass([AppDelegate class]);
        NSLog(@"Hello world");
    }
    return UIApplicationMain(argc, argv, nil, appDelegateClassName);
}
