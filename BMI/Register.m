//
//  Register.m
//  BMI
//
//  Created by Wongsaphat Praisri on 12/20/15.
//  Copyright © 2015 Wongsaphat Praisri. All rights reserved.
//

#import "Register.h"

@interface Register ()

@end

@implementation Register

- (void)viewDidLoad {
    [super viewDidLoad];
    _load.hidden = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    [self.view endEditing:YES];
    
}



- (IBAction)takePhoto:(id)sender {
    
    if ([UIImagePickerController isSourceTypeAvailable:
         UIImagePickerControllerSourceTypeCamera])
    {
        UIImagePickerController *imagePicker =
        [[UIImagePickerController alloc] init];
        imagePicker.delegate = self;
        imagePicker.sourceType =
        UIImagePickerControllerSourceTypeCamera;
        imagePicker.mediaTypes = @[(NSString *) kUTTypeImage];
        imagePicker.allowsEditing = NO;
        [self presentViewController:imagePicker
                           animated:YES completion:nil];
        _newMedia = YES;
    }
    

}

- (IBAction)choosePhoto:(id)sender {
    
    if ([UIImagePickerController isSourceTypeAvailable:
         UIImagePickerControllerSourceTypeSavedPhotosAlbum])
    {
        UIImagePickerController *imagePicker =
        [[UIImagePickerController alloc] init];
        imagePicker.delegate = self;
        imagePicker.sourceType =
        UIImagePickerControllerSourceTypePhotoLibrary;
        imagePicker.mediaTypes = @[(NSString *) kUTTypeImage];
        imagePicker.allowsEditing = NO;
        [self presentViewController:imagePicker
                           animated:YES completion:nil];
        _newMedia = NO;
    }
}

-(void)imagePickerController:(UIImagePickerController *)picker
didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    NSString *mediaType = info[UIImagePickerControllerMediaType];
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
    if ([mediaType isEqualToString:(NSString *)kUTTypeImage]) {
        UIImage *image = info[UIImagePickerControllerOriginalImage];
        
        _imgView.image = image;
        if (_newMedia)
            UIImageWriteToSavedPhotosAlbum(image,
                                           self,
                                           @selector(image:finishedSavingWithError:contextInfo:),
                                           nil);
    }
    else if ([mediaType isEqualToString:(NSString *)kUTTypeMovie])
    {
        // Code here to support video if enabled
    }
}

-(void)image:(UIImage *)image
finishedSavingWithError:(NSError *)error
 contextInfo:(void *)contextInfo
{
    if (error) {
       
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"ล้มเหลว"
                                                                       message:@"บันทึกภาพล้มเหลว"
                                                                preferredStyle:UIAlertControllerStyleActionSheet];
        UIAlertAction *firstAction = [UIAlertAction actionWithTitle:@"ตกลง"
                                                              style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {
                                                                  //NSLog(@"You pressed button one");
                                                              }];
        [alert addAction:firstAction];
        [self presentViewController:alert animated:YES completion:nil];
 
    }
}

-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker

{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)register:(id)sender {
    
    
    if([_user.text  isEqual: @""] || [_pass.text  isEqual: @""] || [_repass.text  isEqual: @""] || [_email.text  isEqual: @""] || [_weight.text  isEqual: @""]) {
        
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"ล้มเหลว"
                                                                       message:@"กรุณากรอกข้อมูลให้ครบ"
                                                                preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *first = [UIAlertAction actionWithTitle:@"ตกลง" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action){
        }];
        
        [alert addAction:first];
        [self presentViewController:alert animated:YES completion:nil];
        
    } else if (![_pass.text isEqualToString:_repass.text]) {
        
        self.pass.text = @"";
        self.repass.text = @"";
        [self.pass becomeFirstResponder];
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"ล้มเหลว"
                                                                       message:@"รหัสผ่านไม่ตรงกัน"
                                                                preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *first = [UIAlertAction actionWithTitle:@"ตกลง" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action){
        }];
        
        [alert addAction:first];
        [self presentViewController:alert animated:YES completion:nil];

        
    } else {
        
        PFUser *newUser = [PFUser user];
        newUser.username = _user.text;
        newUser.password = _pass.text;
        newUser.email = _email.text;
        
        NSData* data = UIImageJPEGRepresentation(_imgView.image, 0.5f);
        PFFile *imageFile = [PFFile fileWithName:@"Image.jpg" data:data];
        
        [newUser signUpInBackgroundWithBlock:^(BOOL succeeded , NSError *error){
            
            if(!error){
                
                NSLog(@"Success");
                UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"สำเร็จ"
                                                                               message:@"สมัครสมาชิกเรียบร้อย"
                                                                        preferredStyle:UIAlertControllerStyleAlert];
                UIAlertAction *first = [UIAlertAction actionWithTitle:@"ตกลง" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action){
                    
                    _load.hidden = NO;
                    [_load startAnimating];
                    NSLog(@"ไปหน้าหลัก");
                    [imageFile saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error){
                        
                        if(!error){
                            
                            [newUser setObject:imageFile forKey:@"img"];
                            //[newUser setObject:_weight.text forKey:@"weight"];
                            [newUser setObject:@"-"forKey:@"weight"];
                            [newUser setObject:@"-"forKey:@"height"];
                            [newUser setObject:@"-"forKey:@"harmful"];
                            [newUser setObject:@"-"forKey:@"grade"];
                            [newUser setObject:@"-" forKey:@"BMI"];
                            
                            [newUser saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error){
                                
                                if(!error){
                                    
                                    NSLog(@"SUCCESS FOR REGISTER");
                                /*    PFObject *friend = [PFObject objectWithClassName:@"Friends"];
                                    friend[@"username"] = _user.text;
                                    friend[@"friendOrNot"] = @"no";
                                    [friend setObject:imageFile forKey:@"pic"];
                                    
                             
                                    [friend saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
                                        
                                        if (succeeded) {
                                            
                                            
                                        } else {
                                            
                                            
                                        }
                                    }]; */
                                    
                                    [_load stopAnimating];
                                    [self performSegueWithIdentifier:@"gogo" sender:nil];
                                    
                                }
                                
                            }];
                            
                        }
                        
                        
                    }];
                }];
                
                [alert addAction:first];
                [self presentViewController:alert animated:YES completion:nil];
                
            }
        }];
        
        
    }
}
@end
