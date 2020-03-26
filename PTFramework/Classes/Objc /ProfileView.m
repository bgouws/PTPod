//
//  ProfileView.m
//  PTFramework
//
//  Created by Brandon Gouws on 2020/03/26.
//

#import "ProfileView.h"
#import "ProfileViewModel.h"

@interface ProfileView ()
@property (weak, nonatomic) IBOutlet UILabel *lblFirstName;
@property (weak, nonatomic) IBOutlet UILabel *lblLastName;
@property (weak, nonatomic) IBOutlet UILabel *lblBio;

@end

@implementation ProfileView

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _lblFirstName.text = @"Loading...";
    _lblLastName.text = @"Loading...";
    _lblBio.text = @"Loading";
    
    ProfileViewModel *profile =[[ProfileViewModel alloc] init];
    
    [profile setdata:^(NSString * _Nonnull firstName, NSString * _Nonnull lastName, NSString * _Nonnull bio) {
        self.lblFirstName.text = firstName;
        self.lblLastName.text = lastName;
        self.lblBio.text = bio;
    }];
    
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
