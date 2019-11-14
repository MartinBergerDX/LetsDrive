//
//  NSError+Convenience.m
//  playerhunter
//
//  Created by Martin on 3/29/17.
//  Copyright © 2017 Playerhunter. All rights reserved.
//

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
