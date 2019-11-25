//
//  ReceivedTaxi.h
//  DriverSearch
//
//  Created by Martin on 11/14/19.
//  Copyright © 2019 DebuggingHell. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>

@interface ReceivedTaxi : NSObject
@property (nonatomic, strong) NSString *identifier;
@property (nonatomic, assign) CGPoint coordinate;
@property (nonatomic, strong) NSString *fleetType;
@property (nonatomic, assign) NSString *heading;
- (instancetype)initWithBackendData:(id)data;
@end
