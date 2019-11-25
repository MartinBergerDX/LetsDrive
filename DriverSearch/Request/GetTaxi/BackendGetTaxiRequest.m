
#import "BackendGetTaxiRequest.h"

//https://fake-poi-api.mytaxi.com/?p2Lat=53.394655&p1Lon=9.757589&p1Lat=53.694865&p2Lon=10.099891

@interface BackendGetTaxiRequest ()
@property (nonatomic, strong) NSString *p1Lat;
@property (nonatomic, strong) NSString *p1Lon;
@property (nonatomic, strong) NSString *p2Lat;
@property (nonatomic, strong) NSString *p2Lon;
@end

@implementation BackendGetTaxiRequest
@synthesize state = _state;

- (instancetype)initWithNorthEast:(CLLocationCoordinate2D)northEast southWest:(CLLocationCoordinate2D)southWest {
    if (self = [super init]) {
        self.p1Lat = [NSString stringWithFormat:@"%.9lf", northEast.latitude];
        self.p1Lon = [NSString stringWithFormat:@"%.9lf", northEast.longitude];
        self.p2Lat = [NSString stringWithFormat:@"%.9lf", southWest.latitude];
        self.p2Lon = [NSString stringWithFormat:@"%.9lf", southWest.longitude];
    }
    return self;
}

- (NSString*)method {
    return BRMethodGet;
}

- (NSString*)endpoint {
    if ([self hasValidData] == NO) {
        return nil;
    }
    NSMutableString *full = [NSMutableString new];
    [full appendString:@"/?"];
    [full appendString:[NSString stringWithFormat:@"p1Lat=%@", self.p1Lat]];
    [full appendString:@"&"];
    [full appendString:[NSString stringWithFormat:@"p1Lon=%@", self.p1Lon]];
    [full appendString:@"&"];
    [full appendString:[NSString stringWithFormat:@"p2Lat=%@", self.p2Lat]];
    [full appendString:@"&"];
    [full appendString:[NSString stringWithFormat:@"p2Lon=%@", self.p2Lon]];
    return full;
    //return @"/?p2Lat=53.394655&p1Lon=9.757589&p1Lat=53.694865&p2Lon=10.099891";
}

- (id)parameters {
    return nil;
}

- (void)didReceiveData:(id)data {
    if (self.success) {
        NSMutableArray *taxis = [NSMutableArray new];
        NSArray *poiList = [data valueForKey:@"poiList"];
        for (NSDictionary *taxiJson in poiList) {
            ReceivedTaxi *taxi = [[ReceivedTaxi alloc] initWithBackendData:taxiJson];
            [taxis addObject:taxi];
        }
        self.success(taxis);
    }
}

- (void)didReceiveError:(NSError*)error {
    if (self.failure) {
        self.failure(error);
    }
}

- (BOOL)hasValidData {
    return YES;
}

@end
