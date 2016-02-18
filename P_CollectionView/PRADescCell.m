//
//  PRADescCell.m
//  P_CollectionView
//
//  Created by dingyuezhang on 11/6/15.
//  Copyright © 2015 dingyuezhang. All rights reserved.
//

#import "PRADescCell.h"

@implementation PRADescCell

@synthesize title = _title;
@synthesize color = _color;

+ (instancetype)randomDesc
{
    NSString *title = [NSString stringWithFormat:@"Your VisionEar"];
    NSString *color = [NSString stringWithFormat:@"Red"];
    
    return [[self alloc] initWithDescTitle:title withFlaceColor:color];    //!!!
}

- (instancetype)initWithDescTitle:(NSString *) title withFlaceColor:(NSString *) color{
    
    self = [super init];
    if (self) {
        _title = [title copy];
        _color = [color copy];
    }
    
    return self;
}

@end
