//
//  Spot.h
//  DigitalDriftPractice
//
//  Created by Francis Tseng on 2017/10/2.
//  Copyright © 2017年 Francis Tseng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Spot : NSObject

@property (strong, nonatomic) NSString *identifier;

@property NSString *parkName;

@property NSString *name;

@property NSString *introduction;
    
@property NSString *imageURLString;

@end
