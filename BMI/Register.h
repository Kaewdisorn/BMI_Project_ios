//
//  Register.h
//  BMI
//
//  Created by Wongsaphat Praisri on 12/20/15.
//  Copyright © 2015 Wongsaphat Praisri. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import <MobileCoreServices/MobileCoreServices.h>

@interface Register : UIViewController<UIImagePickerControllerDelegate,
UINavigationControllerDelegate>

@property BOOL newMedia;
@property (weak, nonatomic) IBOutlet UIImageView *imgView;

- (IBAction)takePhoto:(id)sender;
- (IBAction)choosePhoto:(id)sender;

@property (weak, nonatomic) IBOutlet UITextField *user;
@property (weak, nonatomic) IBOutlet UITextField *pass;
@property (weak, nonatomic) IBOutlet UITextField *repass;
@property (weak, nonatomic) IBOutlet UITextField *email;
@property (weak, nonatomic) IBOutlet UITextField *weight;

- (IBAction)register:(id)sender;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *load;

@end
