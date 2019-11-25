
#import <Foundation/Foundation.h>

@interface NSError (Convenience)
+ (NSError*)errorWithDomain:(NSString*)domain code:(NSInteger)code description:(NSString*)description;
@end
