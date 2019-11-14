//
//  BackendErrorParser.h
//  playerhunter
//
//  Created by Martin on 3/29/17.
//  Copyright © 2017 Playerhunter. All rights reserved.
//

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
