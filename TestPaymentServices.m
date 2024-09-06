//
//  TestPaymentServices.m
//

#import "TestPaymentServices.h"
#import "TestUtils.h"
#import "TestConstants.h"

@interface TestPaymentServices()

@property (nonatomic, strong) NSString *tenantServiceName;

@end

@implementation TestPaymentServices

- (instancetype)init
{
    HyperTenantParams *tenantParams = [[HyperTenantParams alloc] init];
    tenantParams.tenantId = Test_HYPER_TENANT_ID;
    tenantParams.releaseConfigURL = Test_HYPER_RELEASE_CONFIG_URL;
    
    self = [super initWithTenantParams:tenantParams];
    if (self) {
        
    }
    return self;
}

- (instancetype)initWithClientId:(NSString *)clientId {
    HyperTenantParams *tenantParams = [[HyperTenantParams alloc] init];
    tenantParams.clientId = clientId;
    tenantParams.tenantId = Test_HYPER_TENANT_ID;
    tenantParams.releaseConfigURL = Test_HYPER_RELEASE_CONFIG_URL;
    
    self = [super initWithTenantParams:tenantParams];
    if (self) {
        
    }
    return self;
}

- (void)initiate:(UIViewController *)viewController payload:(NSDictionary *)initiationPayload callback:(TestPaymentsCallback)callback {
    self.tenantServiceName = initiationPayload[@"service"];
    NSDictionary *updatedPayload = [TestUtils updateServiceNameInPayload:initiationPayload tenantServiceName:self.tenantServiceName isResponse:false];
    [super initiate:viewController payload:updatedPayload callback:^(NSDictionary<NSString *,id> * _Nullable data) {
        NSDictionary *updatedResponse = [TestUtils updateServiceNameInPayload:data tenantServiceName:self.tenantServiceName isResponse:true];
        callback(updatedResponse);
    }];
}

- (void)process:(UIViewController *)viewController processPayload:(NSDictionary *)processPayload {
    NSDictionary *updatedPayload = [TestUtils updateServiceNameInPayload:processPayload tenantServiceName:self.tenantServiceName isResponse:false];
    [super process:viewController processPayload:updatedPayload];
}

- (void)process:(NSDictionary *)processPayload {
    NSDictionary *updatedPayload = [TestUtils updateServiceNameInPayload:processPayload tenantServiceName:self.tenantServiceName isResponse:false];
    [super process:updatedPayload];
}

- (TestSDKEventsCallback)merchantEvent {
    return [super merchantEvent];
}

- (void)setDelegate:(id<TestDelegate>)delegate {
    [super setHyperDelegate:delegate];
    _delegate = delegate;
}

@end
