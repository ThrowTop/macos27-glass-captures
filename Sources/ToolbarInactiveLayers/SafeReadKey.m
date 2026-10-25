#import "SafeReadKey.h"

NSInteger SafeReadKey(id object, NSString *key,
    id __autoreleasing *value,
    NSString * __autoreleasing *exceptionName,
    NSString * __autoreleasing *exceptionReason) {
    @try {
        id result = [object valueForKey:key];
        if (value) *value = result;
        return 0;
    } @catch (NSException *exception) {
        if (exceptionName) *exceptionName = exception.name;
        if (exceptionReason) *exceptionReason = exception.reason;
        return 2;
    }
}
