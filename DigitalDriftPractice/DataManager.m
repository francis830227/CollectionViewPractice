//
//  DataManager.m
//  DigitalDriftPractice
//
//  Created by Francis Tseng on 2017/10/2.
//  Copyright © 2017年 Francis Tseng. All rights reserved.
//

#import "DataManager.h"
#import "DataManager.h"

@implementation DataManager

-(void)fetchSpots {
    
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
        NSLog(@"%@", responseObject);
       // NSArray *results = responseObject[@"result.results"];
        
        NSArray *result = [responseObject valueForKey: @"result"];
        
        NSArray *results = [result valueForKey: @"results"];
        
        for (NSDictionary *spotInDict in results) {
        
        NSLog(@"%@", spotInDict);
        
        }
    }];
    
    [dataTask resume];
}

@end
