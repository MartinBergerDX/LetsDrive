
#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, BSErrorCode) {
    BSEUnknown = 0,
    BSEInvalidParameter,
    BSEConnection,    
};

@interface BackendErrorParser : NSObject
+ (NSError*)backendError:(BSErrorCode)code description:(NSString*)description;
+ (NSError*)parseFailedRequestError:(NSError*)error;
+ (NSError*)parseFailedRequestResponse:(id)responseObject;
@end
