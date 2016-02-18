//
//  PRACollctionViewLayout.m
//  P_CollectionView
//
//  Created by dingyuezhang on 11/1/15.
//  Copyright © 2015 dingyuezhang. All rights reserved.
//

#import "PRACollctionViewLayout.h"
#import "PRADataSource.h"    //Layout里会调用DataSource？？？为了得到indexPaths???
#import "PRACollectionViewCell.h"

static const CGFloat HeadWidth = 100;

@interface PRACollctionViewLayout ()

@property (strong, nonatomic) NSMutableArray *itemAttributes;

@end

@implementation PRACollctionViewLayout

- (void)prepareLayout
{
    //可以组建attribute？？？
}

- (CGSize)collectionViewContentSize
{
    // Don't scroll horizontally
    CGFloat contentWidth = self.collectionView.bounds.size.width;
    
    // Scroll vertically to display a full day
    CGFloat contentHeight = self.collectionView.bounds.size.height + 200;
    
    CGSize contentSize = CGSizeMake(contentWidth, contentHeight);
    return contentSize;
}

- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect{
    
    NSLog(@"layoutAttributesForElementsInRect");
    
    NSMutableArray *layoutAttributes = [NSMutableArray array];
    
    NSArray *eventIndexPaths = [self indexPathsOfEventInRect:rect];
    
    for (NSIndexPath *indexPath in eventIndexPaths) {
        UICollectionViewLayoutAttributes *attributes = [self layoutAttributesForItemAtIndexPath:indexPath];
        NSLog(@"-----%ld",(long)indexPath.item);
        [layoutAttributes addObject:attributes];
    }
    
    NSArray *descHeadViewIndexPaths = [self indexPathsOfDescHeadViewsInRect:rect];
    
    for (NSIndexPath *indexPath in descHeadViewIndexPaths) {
        UICollectionViewLayoutAttributes *attributes = [self layoutAttributesForSupplementaryViewOfKind:@"DescHeadView" atIndexPath:indexPath];
        [layoutAttributes addObject:attributes];
    }
    
    return layoutAttributes;
}

- (NSArray *)indexPathsOfEventInRect:(CGRect) rect{
    
    NSMutableArray *indexPaths = [NSMutableArray array];
    
    for (NSInteger idx = 0; idx < 1; idx ++) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:idx inSection:0];
        [indexPaths addObject:indexPath];
    }
    
    return indexPaths;
}

- (NSInteger)descIndexFromYCoordinate:(CGFloat)yPosition
{
    //NSInteger descIndex = MAX( 0 , (yPosition / HeadWidth));
    NSInteger descIndex = yPosition / HeadWidth ;
    
    return descIndex;
    
}

- (NSArray *)indexPathsOfDescHeadViewsInRect:(CGRect) rect{
    
    NSInteger minDescIndex = [self descIndexFromYCoordinate:CGRectGetMinY(rect)];
    NSInteger maxDescIndex = [self descIndexFromYCoordinate:CGRectGetMaxY(rect)];
    
    NSMutableArray *indexPaths = [NSMutableArray array];
    
    for (NSInteger idx = minDescIndex; idx <= maxDescIndex; idx ++ ) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:idx inSection:0];
        [indexPaths addObject:indexPath];
    }
    
    return indexPaths;
    
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    PRADataSource *datasource = self.collectionView.dataSource;
    //id<PRACollectionViewCell *> cell = datasource.descriptions[indexPath.item];  ???
    UICollectionViewLayoutAttributes *attributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    attributes.frame = CGRectMake(100, 30, 200, 70);
    
    return attributes;
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForSupplementaryViewOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewLayoutAttributes *attributes = [UICollectionViewLayoutAttributes layoutAttributesForSupplementaryViewOfKind:kind withIndexPath:indexPath];   //不是很理解
    CGFloat totalWidth = [self collectionViewContentSize].height;
    if ([kind isEqualToString:@"DescHeadView"]) {
        CGFloat availableWidth = totalWidth;
        CGFloat widthPerLabel = availableWidth / 9; //description
        attributes.frame = CGRectMake(0, indexPath.item * widthPerLabel, HeadWidth,widthPerLabel);
        attributes.zIndex = -10;
    }
    
    return attributes;
}

@end
