//
//  ProfileViewModel.m
//  PTFramework
//
//  Created by Brandon Gouws on 2020/03/26.
//

#import "ProfileViewModel.h"


@implementation ProfileViewModel

- (void) setdata
{
    self.firstName = @"";
    self.lastName = @"";
    self.bio = @"";
    ProfileModel *profile =[[ProfileModel alloc] init];
    [profile readData:^(NSString * _Nonnull firstName, NSString * _Nonnull lastName, NSString * _Nonnull bio) {
        self.firstName = firstName;
        self.lastName = lastName;
        self.bio = bio;
        
    }];
}

- (void) setdata:(void (^)(NSString * _Nonnull, NSString * _Nonnull, NSString * _Nonnull))completion
{
    self.firstName = @"";
    self.lastName = @"";
    self.bio = @"";
    ProfileModel *profile =[[ProfileModel alloc] init];
    [profile readData:^(NSString * _Nonnull firstName, NSString * _Nonnull lastName, NSString * _Nonnull bio) {
        self.firstName = firstName;
        self.lastName = lastName;
        self.bio = bio;
        completion(self.firstName, self.lastName, self.bio);
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
