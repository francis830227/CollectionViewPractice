//
//  DataManager.h
//  DigitalDriftPractice
//
//  Created by Francis Tseng on 2017/10/2.
//  Copyright © 2017年 Francis Tseng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking.h>

@protocol DataDelegate <NSObject>

-(void)didGet: (NSMutableArray *)spots;

@end

@interface DataManager : NSObject

@property (weak, nonatomic) id<DataDelegate> delegate;

-(void)fetchSpots;

@end
