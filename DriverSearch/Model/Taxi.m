//
//  Taxi.m
//  DriverSearch
//
//  Created by Martin on 11/14/19.
//  Copyright © 2019 DebuggingHell. All rights reserved.
//

#import "Taxi.h"

@implementation Taxi

- (instancetype)initWithBackendData:(id)data {
    if (self = [super init]) {
        if ([data isKindOfClass:[NSDictionary class]]) {
            [self parse:data];
        }
    }
    return self;
}

- (void)parse:(NSDictionary*)data {
    NSNumber *identifierNumber = [data valueForKey:@"id"];
    self.identifier = [identifierNumber stringValue];
    self.fleetType = [data valueForKey:@"fleetType"];
    NSDictionary *coordinateJson = [data valueForKey:@"coordinate"];
    if ([coordinateJson isKindOfClass:[NSDictionary class]]) {
        CGFloat latitude = [[coordinateJson valueForKey:@"latitude"] floatValue];
        CGFloat longitude = [[coordinateJson valueForKey:@"longitude"] floatValue];
        self.coordinate = CGPointMake(latitude, longitude);
    }
    self.heading = [[data valueForKey:@"heading"] stringValue];
}

@end
