#import "SafeKVC.h"

id SafeValueForKey(id object, NSString *key) {
    @try { return [object valueForKey:key]; }
    @catch (NSException *exception) { return nil; }
}
