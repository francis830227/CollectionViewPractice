//
//  SpotsCollectionViewController.m
//  DigitalDriftPractice
//
//  Created by Francis Tseng on 2017/10/3.
//  Copyright © 2017年 Francis Tseng. All rights reserved.
//

#import "SpotsCollectionViewController.h"
#import "Spot.h"
#import "SpotCollectionViewCell.h"
#import "SDWebImage/UIImageView+WebCache.h"

@interface SpotsCollectionViewController () {
    
    NSArray<__kindof Spot *> *recievedSpots;
    
}
@end

@implementation SpotsCollectionViewController

static NSString * const reuseIdentifier = @"SpotCollectionViewCell";

DataManager *dataManager;
    
- (void)viewDidLoad {
    [super viewDidLoad];
    
    dataManager = [DataManager new];
    
    dataManager.delegate = self;
    
    [dataManager fetchSpots];
}

- (void) didGet:(NSMutableArray *)spots {
    
    recievedSpots = spots;
    
    [self.collectionView reloadData];
    
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return recievedSpots.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    SpotCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier: reuseIdentifier forIndexPath:indexPath];
    
    id recievedSpot = [recievedSpots objectAtIndex: indexPath.row];
    
    if ([recievedSpot isKindOfClass:[Spot class]]) {
        
        Spot *spot = (Spot *)recievedSpot;
        
        cell.spotNameLabel.text = spot.name;
        
        cell.spotParkNameLabel.text = spot.parkName;
        
        cell.spotIntroductionLabel.text = spot.introduction;
        
        cell.spotImageView.contentMode = UIViewContentModeScaleAspectFill;
        
        [cell.spotImageView sd_setImageWithURL: [NSURL URLWithString: spot.imageURLString]];
    }
    
    return cell;
}

#pragma mark <UICollectionViewDelegate>

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end
