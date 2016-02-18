//
//  PRADataSource.m
//  P_CollectionView
//
//  Created by dingyuezhang on 11/1/15.
//  Copyright © 2015 dingyuezhang. All rights reserved.
//

#import "PRADataSource.h"
#import "PRACollectionViewCell.h"
#import "PRADescCell.h"
#import "HeadView.h"

@implementation PRADataSource

- (void)awakeFromNib
{
    _descriptions = [[NSMutableArray alloc] init];
    [self generateData];
}

- (void)generateData
{
    PRADescCell *cell = [PRADescCell randomDesc];
    [self.descriptions addObject:cell];
}

#pragma mark - DataSource Protocol

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    id<PRADescriptionCell> description = self.descriptions[indexPath.item];
    PRACollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"PRACollectionViewCell" forIndexPath:indexPath];
    cell.titleLabel.text = description.title;
    cell.color.text = description.color;
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    HeadView *headView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"HeadView" forIndexPath:indexPath];
    
    //if (self.configureHeadViewBlock) {
        //self.configureHeadViewBlock(headView,kind,indexPath);
    //}
    headView.titleLabel.text = [NSString stringWithFormat:@"Desc %ld", indexPath.item + 1];

    return headView;
}
@end
