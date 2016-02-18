//
//  ViewController.h
//  P_CollectionView
//
//  Created by dingyuezhang on 11/1/15.
//  Copyright © 2015 dingyuezhang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PRADataSource.h"

@interface PRAViewController : UICollectionViewController<UICollectionViewDataSource>

@property (nonatomic,strong) IBOutlet PRADataSource *praDataSource;

@end

