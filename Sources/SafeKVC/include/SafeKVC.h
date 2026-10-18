#import <Foundation/Foundation.h>

FOUNDATION_EXPORT id _Nullable SafeValueForKey(id _Nonnull object, NSString * _Nonnull key);
FOUNDATION_EXPORT BOOL SafeSetValueForKey(id _Nonnull object, id _Nullable value, NSString * _Nonnull key);
// Runs `block`, converting an Objective-C exception into nil plus a description in `errorOut`.
// Swift cannot catch NSException, so every probe of AppKit behaviour goes through this.
FOUNDATION_EXPORT id _Nullable SafeInvoke(NS_NOESCAPE id _Nullable (^ _Nonnull block)(void),
                                          NSString * _Nullable * _Nullable errorOut);
