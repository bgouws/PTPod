//
//  ValidationProtocol.h
//  PTFramework
//
//  Created by Brandon Gouws on 2020/03/21.
//

#import <Foundation/Foundation.h>


@protocol validating <NSObject>
@required
- (BOOL)signInValidation:(NSString*) email :(NSString*) password;
- (BOOL)signUpValidation:(NSString*) email :(NSString*) password :(NSString*) conPassword;
- (BOOL)validateEmail: (NSString*) email;
@end

