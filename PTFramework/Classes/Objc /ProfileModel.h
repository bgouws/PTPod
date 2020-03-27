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
- (void)readData:(void (^)(NSString *firstName, NSString *lastName, NSString *bio))completion;
- (void) updateData:(NSString*) firstName : (NSString*) lastName : (NSString*) bio;
@end

NS_ASSUME_NONNULL_END
