//
//  ProfileModel.m
//  PTFramework
//
//  Created by Brandon Gouws on 2020/03/26.
//

#import "ProfileModel.h"
#import "Firebase.h"

@implementation ProfileModel

- (void) readData:(void (^)(NSString * _Nonnull, NSString * _Nonnull, NSString * _Nonnull, UIImage * _Nonnull))completion
{
    self.ref = [[FIRDatabase database] reference];
    NSString *userID = [FIRAuth auth].currentUser.uid;
    [[[[_ref child:@"users"] child:userID] child:@"Details"] observeSingleEventOfType:FIRDataEventTypeValue withBlock:^(FIRDataSnapshot * _Nonnull snapshot) {
        NSString *firstName = snapshot.value[@"firstName"];
        NSString *lastName = snapshot.value[@"lastName"];
        NSString *bio = snapshot.value[@"bio"];
        [self getProfileImage:userID :^(UIImage * _Nonnull image) {
            completion(firstName, lastName, bio, image);
        }];
        
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
- (void) setProfileImage: (NSString*) userID : (UIImage*)img : (void (^)(NSString * _Nonnull))completion
{
    FIRStorage *storage = [FIRStorage storage];
    NSString *path = [NSString stringWithFormat:@"%@", userID];
    FIRStorageReference *ref = [storage referenceWithPath: path];
    NSData *data = UIImageJPEGRepresentation(img, 0.75f);
    [ref putData:data];
    completion(@"Successfully Stored Image");
    NSLog(@"%s", "Successfully Stored Image");
}
- (void) getProfileImage: (NSString*) userID : (void (^)(UIImage * _Nonnull))completion {
    FIRStorage *storage = [FIRStorage storage];
    NSString *path = [NSString stringWithFormat:@"%@", userID];
    FIRStorageReference *islandRef = [storage referenceWithPath: path];
    // Download in memory with a maximum allowed size of 1MB (1 * 1024 * 1024 bytes)
    [islandRef dataWithMaxSize:2 * 1024 * 1024 completion:^(NSData *data, NSError *error){
      if (error != nil) {
        // Will handle errors here eventually
      } else {
        UIImage *islandImage = [UIImage imageWithData:data];
          completion(islandImage);
      }
    }];
}
@end
