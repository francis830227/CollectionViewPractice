//
//  SpotsViewController.m
//  DigitalDriftPractice
//
//  Created by Francis Tseng on 2017/10/2.
//  Copyright © 2017年 Francis Tseng. All rights reserved.
//

#import "SpotsViewController.h"
#import "Spot.h"

@interface SpotsViewController () {

NSArray<__kindof Spot *> *spots;

}
@end

@implementation SpotsViewController

DataManager *dataManager;

static NSString * const reuseIdentifier = @"";

- (void)viewDidLoad {
    [super viewDidLoad];

    dataManager = [DataManager new];
    
    dataManager.delegate = self;
    
    [dataManager fetchSpots];
    
}

@end
