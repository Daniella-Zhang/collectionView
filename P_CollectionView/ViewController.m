//
//  ViewController.m
//  P_CollectionView
//
//  Created by dingyuezhang on 11/1/15.
//  Copyright © 2015 dingyuezhang. All rights reserved.
//

#import "ViewController.h"
#import "PRADataSource.h"
#import "HeadView.h"
#import "PRACollectionViewCell.h"

@interface PRAViewController ()

@end

@implementation PRAViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
        self.collectionView.backgroundColor = [UIColor whiteColor];
    
    
    UINib *headerViewNib = [UINib nibWithNibName:@"HeadView" bundle:nil];
    [self.collectionView registerNib:headerViewNib forSupplementaryViewOfKind:@"DescHeadView" withReuseIdentifier:@"HeadView"];
    PRADataSource *dataSource = self.collectionView.dataSource;
    
    //dataSource.configureHeadViewBlock = ^(HeadView *headView, NSString *kind, NSIndexPath *indexPath){
        //if ([kind isEqualToString:@"DescHeadView"]) {
            //headView.titleLabel.text = [NSString stringWithFormat:@"Desc %ld", indexPath.item + 1];   //???
        //}
   // };
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - DataSource Protocol
/*
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    PRACollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"PRACollectionViewCell" forIndexPath:indexPath];
    cell.titleLabel.text = @"Try";
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
 */
@end
