#import <YandexRuntime/YRTPlatformBinding.h>
#import <YandexRuntime/YRTServiceClient.h>

/// @cond EXCLUDE
/**
 * IDL doesn’t support passing the listener as an argument in the
 * static interface
 */
@interface YRTServiceManager : YRTPlatformBinding

- (void)addClientToServiceWithClient:(nonnull id<YRTServiceClient>)client
                         serviceName:(nonnull NSString *)serviceName;


- (void)sendDataToServiceWithData:(nonnull NSData *)data
                      serviceName:(nonnull NSString *)serviceName
                   senderClientId:(nonnull NSString *)senderClientId;


/**
 * Tells if this object is valid or no. Any method called on an invalid
 * object will throw an exception. The object becomes invalid only on UI
 * thread, and only when its implementation depends on objects already
 * destroyed by now. Please refer to general docs about the interface for
 * details on its invalidation.
 */
@property (nonatomic, readonly, getter=isValid) BOOL valid;

@end
/// @endcond

