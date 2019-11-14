//
//  ServiceRegistry.h
//  playerhunter
//
//  Created by Martin on 3/28/17.
//  Copyright © 2017 Playerhunter. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BackendService.h"

@protocol ServiceRegistry
@property (nonatomic, readonly) id<BackendService> backend;
@end

@protocol ServiceRegistryUser <NSObject>
@property (nonatomic, strong) id<ServiceRegistry> serviceRegistry;
@end
