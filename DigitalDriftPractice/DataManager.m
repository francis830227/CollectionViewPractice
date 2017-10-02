//
//  DataManager.m
//  DigitalDriftPractice
//
//  Created by Francis Tseng on 2017/10/2.
//  Copyright © 2017年 Francis Tseng. All rights reserved.
//

#import "DataManager.h"
#import "DataManager.h"
#import "Spot.h"

@implementation DataManager

- (void)fetchSpots {
    
    NSMutableArray *spots = [[NSMutableArray alloc] init];
    
    NSString *spotsURLString = @"http://data.taipei/opendata/datalist/apiAccess?scope=resourceAquire&rid=bf073841-c734-49bf-a97f-3757a6013812";
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration: configuration];
    
    NSURL *URL = [NSURL URLWithString: spotsURLString];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL: URL];
    
    [request setHTTPMethod: @"GET"];
    
    NSURLSessionDataTask *dataTask = [manager dataTaskWithRequest: request completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
        
        if (error != nil) {
            NSLog(@"Error: %@", error);
            return;
        }

        NSArray *result = [responseObject valueForKey: @"result"];
        
        NSArray *results = [result valueForKey: @"results"];
        
        for (NSDictionary *spotResult in results) {
        
            Spot *spot = [Spot new];
            
            spot.identifier = spotResult[@"_id"];
            
            spot.name = spotResult[@"Name"];
            
            spot.parkName = spotResult[@"ParkName"];
            
            spot.imageURLString = spotResult[@"Image"];
            
            spot.introduction = spotResult[@"Introduction"];
            
            [spots addObject: spot];
            
            [self.delegate didGet: spots];
        }
    }];
    
    [dataTask resume];
}

@end
