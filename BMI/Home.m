//
//  Home.m
//  BMI
//
//  Created by Wongsaphat Praisri on 12/20/15.
//  Copyright © 2015 Wongsaphat Praisri. All rights reserved.
//

#import "Home.h"
#import "SWRevealViewController.h"


@interface Home ()

@end

@implementation Home{
    
    NSArray *name;
    NSString *keepBmi;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [_load startAnimating];
    _sidebarButton.target = self.revealViewController;
    _sidebarButton.action = @selector(revealToggle:);
    
   /* PFUser *cur = [PFUser currentUser];
    PFQuery *query = [PFQuery queryWithClassName:@"_User"];
    
    [query whereKey:@"username" equalTo:cur.username];
    [query getObjectInBackgroundWithId:cur.objectId block:^(PFObject *weight, NSError *error){
    
      
        _lbWeight.text = weight[@"weight"];
        [_load stopAnimating];
        _load.hidden = YES;
    }];*/
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)buttonCal:(id)sender {
    
    float w = [_txtWeight.text floatValue];
    float h = [_txtHeight.text floatValue];
    float h2 = h/100;
    float h3 = h2*h2;
    float result = w/h3;
    _lbBmi.text = [NSString stringWithFormat:@"%.2f",result];
    
    if (result<=18.50) {
        
        _lbGrade.text = @"ผอม";
        _lbHarmful.text = @"มากกว่าคนปกติ";
        
    } else if (result > 18.50 && result <= 22.90){
        
        _lbGrade.text = @"ปกติ";
        _lbHarmful.text = @"เท่าคนปกติ";
        
    } else if (result > 22.91 && result <= 24.90){
        
        _lbGrade.text = @"ท้วม";
        _lbHarmful.text = @"อันตรายระดับที่ 1 ";
        
    } else if (result > 24.91 && result <= 29.90){
        
        _lbGrade.text = @"อ้วน";
        _lbHarmful.text = @"อันตรายระดับที่ 2 ";
        
    } else if (result > 29.91){
        
        _lbGrade.text = @"อ้วนมาก";
        _lbHarmful.text = @"อันตรายระดับที่ 3 ";
    }
    
    NSLog(@"%.2f , %0.2f , result : = %.2f",w,h2,result);
    keepBmi = [NSString stringWithFormat:@"%.2f",result];
    
}

- (IBAction)calAgain:(id)sender {
    
    _txtHeight.text = @"";
    _lbBmi.text = @"";
    _lbGrade.text = @"";
    _lbHarmful.text = @"";
    _txtWeight.text = @"";
}

- (IBAction)save:(id)sender {
    
    PFUser *cur = [PFUser currentUser];
    [cur setObject:keepBmi forKey:@"BMI"];
    [cur setObject:_txtWeight.text forKey:@"weight"];
    [cur setObject:_txtHeight.text forKey:@"height"];
    [cur setObject:_lbGrade.text forKey:@"grade"];
    [cur setObject:_lbHarmful.text forKey:@"harmful"];
    
    [cur saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error){
    
        if(succeeded){
            
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"สำเร็จ"
                                                                           message:@"บันทึกเรียบร้อย"
                                                                    preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *first = [UIAlertAction actionWithTitle:@"ตกลง" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action){
                
                _txtHeight.text = @"";
                _lbBmi.text = @"";
                _lbGrade.text = @"";
                _lbHarmful.text = @"";
                _txtWeight.text = @"";
            }];
            
            [alert addAction:first];
            [self presentViewController:alert animated:YES completion:nil];
            
        }
    
    }];
    
}
- (void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    [self.view endEditing:YES];
    
}
@end
