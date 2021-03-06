//
//  ProfileModel.h
//  PTFramework
//
//  Created by Brandon Gouws on 2020/03/26.
//

#import <Foundation/Foundation.h>
#import "Firebase.h"

NS_ASSUME_NONNULL_BEGIN

@interface ProfileModel : NSObject
@property (strong, nonatomic) FIRDatabaseReference *ref;
- (void) readData:(void (^)(NSString * _Nonnull, NSString * _Nonnull, NSString * _Nonnull, UIImage * _Nonnull))completion;
- (void) updateData:(NSString*) firstName : (NSString*) lastName : (NSString*) bio;
- (void) setProfileImage: (NSString*) userID : (UIImage*)img : (void (^)(NSString * _Nonnull))completion;
@end

NS_ASSUME_NONNULL_END
