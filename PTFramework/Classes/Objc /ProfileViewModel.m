//
//  ProfileViewModel.m
//  PTFramework
//
//  Created by Brandon Gouws on 2020/03/26.
//

#import "ProfileViewModel.h"
#import "Firebase.h"


@implementation ProfileViewModel
- (void) setdata:(void (^)(NSString * _Nonnull, NSString * _Nonnull, NSString * _Nonnull, UIImage * _Nonnull))completion
{
    self.firstName = @"";
    self.lastName = @"";
    self.bio = @"";
    ProfileModel *profile =[[ProfileModel alloc] init];
    [profile readData:^(NSString * _Nonnull firstName, NSString * _Nonnull lastName, NSString * _Nonnull bio, UIImage * _Nonnull image) {
        self.firstName = firstName;
        self.lastName = lastName;
        self.bio = bio;
        self.image = image;
        completion(self.firstName, self.lastName, self.bio, self.image);
    }];
}
- (void) updateData:(NSString *)firstName :(NSString *)lastName :(NSString *)bio :(UIImage*)img
{
    ProfileModel *profile =[[ProfileModel alloc] init];
    [profile updateData:firstName :lastName :bio];
    NSString * userID = [[[FIRAuth auth] currentUser] uid];
    [profile setProfileImage:userID :img :^(NSString * _Nonnull output) {
    }];
}
- (NSString *) getFirstName
{
    return self.firstName;
}
- (NSString *) getLastName
{
    return self.lastName;
}
- (NSString *) getBio
{
    return self.bio;
}
@end
