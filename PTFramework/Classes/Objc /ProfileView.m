//
//  ProfileView.m
//  PTFramework
//
//  Created by Brandon Gouws on 2020/03/26.
//

#import "ProfileView.h"
#import "ProfileViewModel.h"

@interface ProfileView ()
@property (weak, nonatomic) IBOutlet UITextField *txtName;
@property (weak, nonatomic) IBOutlet UITextField *txtLastName;
@property (weak, nonatomic) IBOutlet UIButton *btnUpdate;
@property (weak, nonatomic) IBOutlet UITextView *txtBio;
@property (weak, nonatomic) IBOutlet UIButton *btnProfilePic;
@property (weak, nonatomic) IBOutlet UIImageView *imgTest;
@property (weak, nonatomic) IBOutlet UIButton *btnQuote;
@property (weak, nonatomic) IBOutlet UIButton *btnLogout;

@end

@implementation ProfileView
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _btnProfilePic.layer.masksToBounds = true;
    _btnProfilePic.layer.cornerRadius = _btnProfilePic.frame.size.width / 2;
    _btnProfilePic.layer.borderWidth = 0.5;
    _btnProfilePic.layer.borderColor = UIColor.lightGrayColor.CGColor;
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
    _btnLogout.layer.cornerRadius = 8.0;
    _btnLogout.clipsToBounds = YES;
    _btnLogout.layer.masksToBounds = NO;
    //Calling view model for data
    ProfileViewModel *profile =[[ProfileViewModel alloc] init];
    [profile setdata:^(NSString * _Nonnull firstName, NSString * _Nonnull lastName, NSString * _Nonnull bio, UIImage * _Nonnull image) {
        self.txtName.text = firstName;
        self.txtLastName.text = lastName;
        self.txtBio.text = bio;
        [self->_btnProfilePic setImage:image forState:UIControlStateNormal];
    }];
}
- (void)viewWillAppear:(BOOL)animated {
    self.title = @"Profile";
}
- (IBAction)btnQuote:(id)sender {
    [self performSegueWithIdentifier:@"ToQuoteView" sender:self];
}
- (IBAction)btnUpdateTapped:(id)sender {
    ProfileViewModel *profile =[[ProfileViewModel alloc] init];
    self.firstName = _txtName.text;
    self.lastName = _txtLastName.text;
    self.bio = _txtBio.text;
    self.img = _btnProfilePic.imageView.image;
    [profile updateData:self.firstName : self.lastName :self.bio :self.img];
}
//Image Picker delegates
-(void) imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<UIImagePickerControllerInfoKey,id> *)info {
    UIImage *image = info[UIImagePickerControllerOriginalImage];
    [_btnProfilePic setImage:image forState:UIControlStateNormal];
    [self dismissViewControllerAnimated:YES completion:^{
        nil;
    }];
}
- (IBAction)btnProfilePicTapped:(id)sender {
    
    UIImagePickerController* imagePicker = [[UIImagePickerController alloc]init];
    
    UIAlertController * view=   [UIAlertController
                                 alertControllerWithTitle:@"Upload a profile picture"
                                 message:@"Select a source"
                                 preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction* camera = [UIAlertAction
                             actionWithTitle:@"Camera"
                             style:UIAlertActionStyleDefault
                             handler:^(UIAlertAction * action)
                             {
        if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
            imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
            imagePicker.delegate = self;
            [self presentViewController:imagePicker animated:true completion:nil];
        }
        [view dismissViewControllerAnimated:YES completion:nil];
    }];
    UIAlertAction* library = [UIAlertAction
                              actionWithTitle:@"Library"
                              style:UIAlertActionStyleDefault
                              handler:^(UIAlertAction * action)
                              {
        if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]) {
            imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
            imagePicker.delegate = self;
            [self presentViewController:imagePicker animated:true completion:nil];
        }
        [view dismissViewControllerAnimated:YES completion:nil];
        
    }];
    UIAlertAction* cancel = [UIAlertAction
                             actionWithTitle:@"Cancel"
                             style:UIAlertActionStyleDefault
                             handler:^(UIAlertAction * action)
                             {
        [view dismissViewControllerAnimated:YES completion:nil];
    }];
    [view addAction:camera];
    [view addAction:library];
    [view addAction:cancel];
    [self presentViewController:view animated:YES completion:nil];
}
- (IBAction)btnLogOutTapped:(id)sender {
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}
@end
