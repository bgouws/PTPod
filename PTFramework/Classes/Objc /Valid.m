//
//  Valid.m
//  PTFramework
//
//  Created by Brandon Gouws on 2020/03/20.
//

#import "Valid.h"

@implementation Valid 
- (BOOL) signUpValidation: (NSString*) email : (NSString*) password : (NSString*) conPassword
{
    BOOL flag = [self checkEmail: email];
    if (flag && ![password  isEqual: @""] && password == conPassword) {
        flag = YES;
    } else {
        flag = NO;
    }
    return flag;
}
- (BOOL) signInValidation: (NSString*) email : (NSString*) password
{
    BOOL flag = [self checkEmail: email];
    if (flag && ![password  isEqual: @""]) {
        flag = YES;
    } else {
        flag = NO;
    }
    return flag;
}
- (BOOL) checkEmail: (NSString*) email
{
    BOOL stricterFilter = NO; // Discussion http://blog.logichigh.com/2010/09/02/validating-an-e-mail-address/
    NSString *stricterFilterString = @"[A-Z0-9a-z\\._%+-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,4}";
    NSString *laxString = @".+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2}[A-Za-z]*";
    NSString *emailRegex = stricterFilter ? stricterFilterString : laxString;
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:email];
}
@end
