
#import "ProductionServiceRegistry.h"
#import "DriverSearch-Swift.h"

@interface ProductionServiceRegistry()
@property (nonatomic, strong) id<BackendService> backend;
@property (nonatomic, strong) LocationService* location;
@end

@implementation ProductionServiceRegistry

static id<ServiceRegistry> _instance;

+ (id<ServiceRegistry>)instance {
    if (_instance) {
        return _instance;
    }
    @synchronized (self) {
        _instance = [[ProductionServiceRegistry alloc] init];
    }
    return _instance;
}

- (id<BackendService>)backend {
    if (_backend) {
        return _backend;
    }
    _backend = [[BackendService alloc] initWithBackendConfiguration:[BackendConfiguration new]];
    return _backend;
}

- (LocationService*)location {
    if (_location) {
        return _location;
    }
    _location = [[LocationService alloc] init];
    return _location;
}

@end
