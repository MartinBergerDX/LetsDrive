
#import "NSError+Convenience.h"

@implementation NSError (Convenience)

+ (NSError*)errorWithDomain:(NSString*)domain code:(NSInteger)code description:(NSString*)description {
    NSDictionary *userInfo = nil;
    if (description) {
        userInfo = @{NSLocalizedDescriptionKey : description};
    }
    return [NSError errorWithDomain:domain code:code userInfo:userInfo];
}

@end
