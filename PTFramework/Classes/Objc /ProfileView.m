//
//  ProfileView.m
//  PTFramework
//
//  Created by Brandon Gouws on 2020/03/26.
//

#import "ProfileView.h"
#import "ProfileViewModel.h"

@interface ProfileView ()
@property (weak, nonatomic) IBOutlet UIImageView *imgProfile;
@property (weak, nonatomic) IBOutlet UITextField *txtName;
@property (weak, nonatomic) IBOutlet UITextField *txtLastName;
@property (weak, nonatomic) IBOutlet UIButton *btnUpdate;
@property (weak, nonatomic) IBOutlet UITextView *txtBio;

@end

@implementation ProfileView

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _imgProfile.layer.masksToBounds = YES;
    _imgProfile.layer.cornerRadius = _imgProfile.frame.size.width / 2;
    _imgProfile.layer.borderWidth = 0.5;
    _imgProfile.layer.borderColor = UIColor.darkGrayColor.CGColor;
    _txtName.layer.cornerRadius = 8.0;
    _txtName.layer.borderWidth = 0.5;
    _txtName.layer.borderColor = UIColor.blackColor.CGColor;
    _txtName.clipsToBounds = YES;
    _txtLastName.layer.cornerRadius = 8.0;
    _txtLastName.layer.borderWidth = 0.5;
    _txtLastName.layer.borderColor = UIColor.blackColor.CGColor;
    _txtLastName.clipsToBounds = YES;
    _btnUpdate.layer.cornerRadius = 8.0;
    _btnUpdate.clipsToBounds = YES;
    _btnUpdate.layer.masksToBounds = NO;
    
    //Calling view model for data
    ProfileViewModel *profile =[[ProfileViewModel alloc] init];
    [profile setdata:^(NSString * _Nonnull firstName, NSString * _Nonnull lastName, NSString * _Nonnull bio) {
        self.txtName.text = firstName;
        self.txtLastName.text = lastName;
        self.txtBio.text = bio;
    }];
}

- (IBAction)btnUpdateTapped:(id)sender {
    ProfileViewModel *profile =[[ProfileViewModel alloc] init];
    self.firstName = _txtName.text;
    self.lastName = _txtLastName.text;
    self.bio = _txtBio.text;
    [profile updateData:(self.firstName) :(self.lastName) : (self.bio)];
}
@end
