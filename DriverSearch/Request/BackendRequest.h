
#import <Foundation/Foundation.h>

extern NSString * const BRMethodGet;
extern NSString * const BRMethodPost;
extern NSString * const BRMethodDelete;
extern NSString * const BRMethodPut;
extern NSString * const BRMethodInvalid;

typedef NS_ENUM(NSInteger, BRState) {
    BRReady,
    BRStarted,
    BRInvalid,
    BRFailed,
    BRDone
};

@protocol BackendRequest <NSObject>
@property (nonatomic) BRState state;
- (NSString*)method;
- (NSString*)endpoint;
- (id)parameters;
- (void)didReceiveData:(id)data;
- (void)didReceiveError:(NSError*)error;
- (BOOL)hasValidData;
@end
