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
- (void) setdata;
@property (strong, nonatomic) NSString *firstName;
@property (strong, nonatomic) NSString *lastName;
@property (strong, nonatomic) NSString *bio;
@property (nonatomic, assign) Class profileModel;

@end

NS_ASSUME_NONNULL_END
