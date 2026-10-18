#import "SafeKVC.h"

id SafeValueForKey(id object, NSString *key) {
    @try { return [object valueForKey:key]; }
    @catch (NSException *exception) { return nil; }
}

BOOL SafeSetValueForKey(id object, id value, NSString *key) {
    @try { [object setValue:value forKey:key]; return YES; }
    @catch (NSException *exception) { return NO; }
}

id SafeInvoke(NS_NOESCAPE id (^block)(void), NSString **errorOut) {
    @try { return block(); }
    @catch (NSException *exception) {
        if (errorOut) *errorOut = [NSString stringWithFormat:@"%@: %@", exception.name, exception.reason];
        return nil;
    }
}
