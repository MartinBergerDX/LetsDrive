
#import "BackendErrorParser.h"
#import "NSError+Convenience.h"

NSString *const kBackendServiceErrorDomain = @"LetsDrive::BackendService";

@implementation BackendErrorParser

+ (NSError*)backendError:(BSErrorCode)code description:(NSString*)description {
    return [NSError errorWithDomain:kBackendServiceErrorDomain code:code description:description];
}

+ (NSError*)parseFailedRequestError:(NSError*)error {
    if ([error.domain isEqualToString:NSURLErrorDomain] && (error.code == NSURLErrorNotConnectedToInternet || error.code == NSURLErrorTimedOut)) {
        return [NSError errorWithDomain:kBackendServiceErrorDomain code:BSEConnection description:NSLocalizedString(@"Check your connection", nil)];
    }
    return nil;
}

+ (NSError*)parseFailedRequestResponse:(id)responseObject {
    if ([responseObject isKindOfClass:[NSDictionary class]]) {
        NSDictionary *response = (NSDictionary*)responseObject;
        NSInteger code = [[response objectForKey:@"status"] integerValue];
        NSString *domain = [responseObject objectForKey:@"error"];
        NSString *message = [responseObject objectForKey:@"message"];
        return [NSError errorWithDomain:domain code:BSEUnknown description:message];
    }
    return nil;
}

@end
