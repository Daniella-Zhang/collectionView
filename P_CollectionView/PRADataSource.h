//
//  PRADataSource.h
//  P_CollectionView
//
//  Created by dingyuezhang on 11/1/15.
//  Copyright © 2015 dingyuezhang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HeadView.h"

typedef void (^ConfigureHeaderViewBlock)(HeadView *headView, NSString *kind, NSIndexPath *indexPath);

@interface PRADataSource : NSObject<UICollectionViewDataSource>

@property (strong,nonatomic) NSMutableArray *descriptions;

@property (copy,nonatomic) ConfigureHeaderViewBlock configureHeadViewBlock;

@end
