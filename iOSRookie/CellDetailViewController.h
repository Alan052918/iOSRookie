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

- (BOOL)tableInsertCellWithData:(id)cellData atIndex:(NSUInteger)cellIndex error:(NSError **)error;

@end

@interface CellDetailViewController : UIViewController

@property (strong, nonatomic) id <CellCreationDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
