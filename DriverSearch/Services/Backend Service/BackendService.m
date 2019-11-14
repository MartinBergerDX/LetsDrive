
#import "BackendService.h"
#import "BackendErrorParser.h"

NSString * const kBackendServiceError403ForbiddenAccessNotification = @"BACKEND_SERVICE_ERROR::403_FORBIDDEN_ACCESS";

@interface BackendService()
@property (nonatomic, strong) BackendConfiguration *backendConfiguration;
@property (nonatomic, strong) NSURLSession *session;
@end

@implementation BackendService

- (instancetype)initWithBackendConfiguration:(BackendConfiguration*)backendConfiguration {
    if (self = [super init]) {
        self.backendConfiguration = backendConfiguration;
        NSURLSessionConfiguration *sessionConfiguration = [NSURLSessionConfiguration defaultSessionConfiguration];
        sessionConfiguration.HTTPAdditionalHeaders = @{@"Accept": @"application/json"};
        NSURLSession *session = [NSURLSession sessionWithConfiguration:sessionConfiguration delegate:nil delegateQueue:nil];
        self.session = session;
    }
    return self;
}

- (void)execute:(id<BackendRequest>)request {
    
    if (request == nil) {
        NSLog(@"tried to execute empty request");
        return;
    }
    
    request.state = BRStarted;
    
    if ([request hasValidData] == NO) {
        request.state = BRInvalid;
        [request didReceiveError:[BackendErrorParser backendError:BSEInvalidParameter description:NSLocalizedString(@"Invalid request data", @"Trying to send invalid data to backend")]];
        return;
    }
    
    NSMutableString *requestUrl = [NSMutableString new];
    [requestUrl appendString:[self.backendConfiguration restEndpoint]];
    [requestUrl appendString:request.endpoint];
    NSURL *url = [NSURL URLWithString:requestUrl];
    NSMutableURLRequest *httpRequest = [NSMutableURLRequest requestWithURL:url];
    httpRequest.HTTPMethod = request.method;

    __block NSURLSessionDataTask *dataTask = [self.session dataTaskWithRequest:httpRequest completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (error) {
            [self handleFailedDataTask:dataTask error:error request:request response:response];
            return;
        }
        NSError *parseError = nil;
        id object = [NSJSONSerialization JSONObjectWithData:data options:0 error:&parseError];

        if(parseError) {
            [self handleFailedDataTask:dataTask error:error request:request response:response];
            return;
        }

        if([object isKindOfClass:[NSDictionary class]]) {
            [request didReceiveData:object];
            request.state = BRDone;
        }
    }];
    [dataTask resume];
}

- (void)handleFailedDataTask:(NSURLSessionDataTask*)dataTask error:(NSError*)error request:(id<BackendRequest>)request response:(id)response {
    NSError *parsedError = [BackendErrorParser parseFailedRequestResponse:response];
    request.state = BRFailed;
    [request didReceiveError:parsedError];
    NSLog(@"request failed with error: %@,\ndataTask: %@,\nresponse: %@", error, dataTask, response);
}

@end
