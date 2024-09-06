//
//  TestPaymentServices.h
//

#import <Foundation/Foundation.h>
#import <HyperSDK/Hyper.h>

NS_ASSUME_NONNULL_BEGIN

typedef HyperSDKCallback TestPaymentsCallback;

typedef HyperEventsCallback TestSDKEventsCallback;

@protocol TestDelegate <HyperDelegate>

@end

@interface TestPaymentServices : HyperServices

@property (nonatomic, weak) id <TestDelegate> _Nullable delegate;

- (instancetype _Nonnull)initWithClientId:(NSString * _Nonnull)clientId;

- (void)initiate:(UIViewController * _Nonnull)viewController payload:(NSDictionary * _Nonnull)initiationPayload callback:(TestPaymentsCallback _Nonnull)callback;

- (TestSDKEventsCallback _Nullable)merchantEvent;

@end

NS_ASSUME_NONNULL_END
