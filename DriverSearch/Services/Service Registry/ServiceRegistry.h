
#import <Foundation/Foundation.h>
#import "BackendService.h"
// do not include compiler generated swift-objc header

@class LocationService; // evade circular dependency by bridging header and compiler generated swift-objc header

@protocol ServiceRegistry
@property (nonatomic, readonly) id<BackendService> backend;
@property (nonatomic, readonly) LocationService* location;
@end

@protocol ServiceRegistryUser <NSObject>
@property (nonatomic, strong) id<ServiceRegistry> serviceRegistry;
@end
