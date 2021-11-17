//
//  Login.m
//  BMI
//
//  Created by Wongsaphat Praisri on 12/20/15.
//  Copyright © 2015 Wongsaphat Praisri. All rights reserved.
//

#import "Login.h"

@interface Login ()

@end

@implementation Login

- (void)viewDidLoad {
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) viewDidAppear:(BOOL)animated{
    
    PFUser *user = [PFUser currentUser];
    if (user.username != nil) {
        [self performSegueWithIdentifier:@"gogo" sender:self];
        
    }
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)login:(id)sender {
    
    [PFUser logInWithUsernameInBackground:_user.text password:_pass.text block:^(PFUser *user , NSError *error){
        
        if(!error){
            
            [self performSegueWithIdentifier:@"gogo" sender:self];
        }
        if (error) {
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"ล้มเหลว"
                                                                           message:@"รหัสผ่านไม่ถูกต้อง"
                                                                    preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *first = [UIAlertAction actionWithTitle:@"ตกลง" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action){
                
                _user.text = @"";
                _pass.text = @"";
            }];
            
            [alert addAction:first];
            [self presentViewController:alert animated:YES completion:nil];

            [self viewDidLoad];
            
        }
    }];
}
@end
