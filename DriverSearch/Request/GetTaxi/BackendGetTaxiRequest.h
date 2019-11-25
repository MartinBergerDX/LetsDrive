//
//  BackendGetTaxiRequest.h
//  DriverSearch
//
//  Created by Martin on 11/13/19.
//  Copyright © 2019 DebuggingHell. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>
#import "BackendRequest.h"
#import "ReceivedTaxi.h"

@interface BackendGetTaxiRequest : NSObject <BackendRequest>
@property (nonatomic, copy) void(^success)(NSArray*);
@property (nonatomic, copy) void(^failure)(NSError *error);
- (instancetype)initWithNorthEast:(CLLocationCoordinate2D)northEast southWest:(CLLocationCoordinate2D)southWest;
- (instancetype)init NS_UNAVAILABLE;
+ (instancetype)new NS_UNAVAILABLE;
@end

