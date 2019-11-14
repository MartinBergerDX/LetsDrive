//
//  BackendGetTaxiRequest.m
//  DriverSearch
//
//  Created by Martin on 11/13/19.
//  Copyright © 2019 DebuggingHell. All rights reserved.
//

#import "BackendGetTaxiRequest.h"

//https://fake-poi-api.mytaxi.com/?p2Lat=53.394655&p1Lon=9.757589&p1Lat=53.694865&p2Lon=10.099891

@interface BackendGetTaxiRequest ()

@end

@implementation BackendGetTaxiRequest
@synthesize state = _state;

- (instancetype)initWithPoint:(NSString*)point; {
    if (self = [super init]) {

    }
    return self;
}

- (NSString*)method {
    return BRMethodGet;
}

- (NSString*)endpoint {
    if ([self hasValidData] == NO) {
        return nil;
    }
    return @"/?p2Lat=53.394655&p1Lon=9.757589&p1Lat=53.694865&p2Lon=10.099891";
}

- (id)parameters {
    return nil;
}

- (void)didReceiveData:(id)data {
    if (self.success) {
        NSMutableArray *taxis = [NSMutableArray new];
        NSArray *poiList = [data valueForKey:@"poiList"];
        for (NSDictionary *taxiJson in poiList) {
            Taxi *taxi = [[Taxi alloc] initWithBackendData:taxiJson];
            [taxis addObject:taxi];
        }
        self.success(taxis);
    }
}

- (void)didReceiveError:(NSError*)error {
    if (self.failure) {
        self.failure(error);
    }
}

- (BOOL)hasValidData {
    return YES;
}

@end
