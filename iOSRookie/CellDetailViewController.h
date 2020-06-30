//
//  CellDetailViewController.h
//  iOSRookie
//
//  Created by Alan Ai on 2020/6/29.
//  Copyright © 2020 aijunda. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol CellCreationDelegate <NSObject>

- (BOOL)insertCellWithData:(id)cellData atIndex:(NSUInteger)cellIndex;

@end

@interface CellDetailViewController : UIViewController

@property (strong, nonatomic) id <CellCreationDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
