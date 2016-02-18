//
//  PRACollectionViewCell.m
//  P_CollectionView
//
//  Created by dingyuezhang on 11/2/15.
//  Copyright © 2015 dingyuezhang. All rights reserved.
//

#import "PRACollectionViewCell.h"

@implementation PRACollectionViewCell

/*
- (id)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    
    return self;
}
*/

- (id)initWithCoder:(NSCoder *)decoder{
    
    self = [super initWithCoder:decoder];
    if (self) {
        [self setup];
    }
    
    return self;
}

-(void)setup
{
    self.layer.cornerRadius = 10;
    self.layer.borderWidth = 1.0;
    self.layer.borderColor = [[UIColor colorWithRed:0 green:0 blue:0.7 alpha:1] CGColor];
}

@end
