#import "SafeKVC.h"

id SafeValueForKey(id object, NSString *key) {
    @try { return [object valueForKey:key]; }
    @catch (NSException *exception) { return nil; }
}

BOOL SafeSetValueForKey(id object, id value, NSString *key) {
    @try { [object setValue:value forKey:key]; return YES; }
    @catch (NSException *exception) { return NO; }
}
