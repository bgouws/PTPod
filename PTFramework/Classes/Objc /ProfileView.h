//
//  ProfileView.h
//  PTFramework
//
//  Created by Brandon Gouws on 2020/03/26.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ProfileView : UIViewController

@property (strong, nonatomic) NSString *firstName;
@property (strong, nonatomic) NSString *lastName;
@property (strong, nonatomic) NSString *bio;

@end

NS_ASSUME_NONNULL_END
