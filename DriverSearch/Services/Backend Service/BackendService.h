
#import <Foundation/Foundation.h>
#import "BackendRequest.h"
#import "BackendConfiguration.h"

extern NSString * const kBackendServiceError403ForbiddenAccessNotification;

@protocol BackendService <NSObject>
- (void)execute:(id<BackendRequest>)request;
@end

@interface BackendService : NSObject <BackendService>
- (instancetype)initWithBackendConfiguration:(BackendConfiguration*)backendConfiguration;
- (instancetype)init NS_UNAVAILABLE;
+ (instancetype)new NS_UNAVAILABLE;
@end
