
#import "ProductionServiceRegistry.h"

@interface ProductionServiceRegistry()
@property (nonatomic, strong) id<BackendService> backend;
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

@end
