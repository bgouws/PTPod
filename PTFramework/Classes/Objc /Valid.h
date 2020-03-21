//
//  Valid.h
//  PTFramework
//
//  Created by Brandon Gouws on 2020/03/20.
//

#import <Foundation/Foundation.h>
#import "ValidationProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface Valid : NSObject <validating>

- (BOOL) signUpValidation: (NSString*) email : (NSString*) password : (NSString*) conPassword;
- (BOOL) signInValidation: (NSString*) email : (NSString*) password;
- (BOOL) checkEmail: (NSString*) email;

@end

NS_ASSUME_NONNULL_END
