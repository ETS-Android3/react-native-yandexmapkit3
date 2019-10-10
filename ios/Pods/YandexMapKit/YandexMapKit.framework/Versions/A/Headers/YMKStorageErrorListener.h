#import <Foundation/Foundation.h>

/**
 * Storage error listener. This is a listener to subscribe to storage
 * errors in managers that control some type of storage.
 */
@protocol YMKStorageErrorListener <NSObject>

/**
 * Possible error types: - runtime.DiskCorruptError: Called if local
 * storage is corrupted. - runtime.DiskFullError: Called if local
 * storage is full. - runtime.DiskWriteAccessError : Called if the
 * application cannot get write access to local storage.
 */
- (void)onStorageErrorWithError:(nonnull NSError *)error;


@end
