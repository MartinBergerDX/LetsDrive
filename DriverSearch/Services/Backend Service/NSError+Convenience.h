//
//  NSError+Convenience.h
//  playerhunter
//
//  Created by Martin on 3/29/17.
//  Copyright © 2017 Playerhunter. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSError (Convenience)
+ (NSError*)errorWithDomain:(NSString*)domain code:(NSInteger)code description:(NSString*)description;
@end
