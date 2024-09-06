//
//  TestCheckoutLite.m
//

#import "TestCheckoutLite.h"
#import "TestUtils.h"

@implementation TestCheckoutLite

static NSString* tenantServiceName;

+ (void)openPaymentPage:(UIViewController * _Nonnull)viewController payload:(NSDictionary * _Nonnull)sdkPayload callback:(TestPaymentsCallback _Nonnull)callback {
    tenantServiceName = sdkPayload[@"service"];
    NSDictionary *updatedPayload = [TestUtils updateServiceNameInPayload:sdkPayload tenantServiceName:tenantServiceName isResponse:false];
    [super openPaymentPage:viewController payload:updatedPayload callback:^(NSDictionary<NSString *,id> * _Nullable data) {
        NSDictionary *updatedResponse = [TestUtils updateServiceNameInPayload:data tenantServiceName:tenantServiceName isResponse:true];
        callback(updatedResponse);
    }];
}

@end
