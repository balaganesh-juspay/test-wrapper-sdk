//
//  TestUtils.m
//

#import "TestUtils.h"
#import "TestConstants.h"

@implementation TestUtils

+ (NSDictionary *)updateServiceNameInPayload:(NSDictionary *)payload tenantServiceName:(NSString *)tenantServiceName isResponse:(BOOL)isResponse {
    NSString *serviceName = payload[@"service"];
    if (serviceName) {
        BOOL serviceNameChanged = false;
        if (isResponse && ![tenantServiceName containsString:Test_HYPER_SERVICE_PREFIX]) {
            serviceName = [serviceName stringByReplacingOccurrencesOfString:Test_HYPER_SERVICE_PREFIX withString:@""];
            serviceNameChanged = true;
        } else if (![serviceName containsString:Test_HYPER_SERVICE_PREFIX]) {
            serviceName = [NSString stringWithFormat:@"%@%@", Test_HYPER_SERVICE_PREFIX, serviceName];
            serviceNameChanged = true;
        }
        
        if (!serviceNameChanged) {
            return payload;
        }
        
        NSMutableDictionary *updatedPayload = [NSMutableDictionary dictionaryWithDictionary:payload];
        updatedPayload[@"service"] = serviceName;
        
        return updatedPayload;
    }
    return payload;
}

@end
