//
//  Taxi.h
//  DriverSearch
//
//  Created by Martin on 11/14/19.
//  Copyright © 2019 DebuggingHell. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>

/*
 "id": 837852,
 "coordinate": {
     "latitude": 53.61708719976051,
     "longitude": 9.963053986816481
 },
 "fleetType": "POOLING",
 "heading": 54.90136026294247
 */

@interface Taxi : NSObject
@property (nonatomic, strong) NSString *identifier;
@property (nonatomic, assign) CGPoint coordinate;
@property (nonatomic, strong) NSString *fleetType;
@property (nonatomic, assign) NSString *heading;
- (instancetype)initWithBackendData:(id)data;
@end
