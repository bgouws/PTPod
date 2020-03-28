//
//  ProfileViewModel.h
//  PTFramework
//
//  Created by Brandon Gouws on 2020/03/26.
//

#import <Foundation/Foundation.h>
#import "ProfileModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface ProfileViewModel : NSObject
- (NSString *) getFirstName;
- (NSString *) getLastName;
- (NSString *) getBio;
- (void) setdata:(void (^)(NSString * _Nonnull, NSString * _Nonnull, NSString * _Nonnull, UIImage * _Nonnull))completion;
- (void) updateData:(NSString *)firstName :(NSString *)lastName :(NSString *)bio :(UIImage*)img;
@property (strong, nonatomic) NSString *firstName;
@property (strong, nonatomic) NSString *lastName;
@property (strong, nonatomic) NSString *bio;
@property (strong, nonatomic) UIImage *image;
@property (nonatomic, assign) Class profileModel;

@end

NS_ASSUME_NONNULL_END
