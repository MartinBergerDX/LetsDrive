
#import <Foundation/Foundation.h>
#import "ServiceRegistry.h"

@interface ProductionServiceRegistry : NSObject <ServiceRegistry>
@property (class, nonatomic, strong, readonly) id<ServiceRegistry> instance;
@end
