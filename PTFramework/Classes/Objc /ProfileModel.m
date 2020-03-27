//
//  ProfileModel.m
//  PTFramework
//
//  Created by Brandon Gouws on 2020/03/26.
//

#import "ProfileModel.h"
#import "Firebase.h"

@implementation ProfileModel

- (void) readData:(void (^)(NSString * _Nonnull, NSString * _Nonnull, NSString * _Nonnull))completion
{
    self.ref = [[FIRDatabase database] reference];
    NSString *userID = [FIRAuth auth].currentUser.uid;
    [[[[_ref child:@"users"] child:userID] child:@"Details"] observeSingleEventOfType:FIRDataEventTypeValue withBlock:^(FIRDataSnapshot * _Nonnull snapshot) {
        NSString *firstName = snapshot.value[@"firstName"];
        NSString *lastName = snapshot.value[@"lastName"];
        NSString *bio = snapshot.value[@"bio"];
        completion(firstName, lastName, bio);
    } withCancelBlock:^(NSError * _Nonnull error) {
        NSLog(@"%@", error.localizedDescription);
    }];
}

- (void) updateData:(NSString*) firstName : (NSString*) lastName : (NSString*) bio
{
    self.ref = [[FIRDatabase database] reference];
    NSString *userID = [FIRAuth auth].currentUser.uid;
    NSDictionary *dict = @{@"firstName": firstName,
                           @"lastName": lastName,
                           @"bio": bio};
    [[[[_ref child:@"users"] child:userID] child:@"Details"] setValue:(dict)];
}
@end
