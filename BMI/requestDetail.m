//
//  requestDetail.m
//  BMI
//
//  Created by Wongsaphat Praisri on 1/18/16.
//  Copyright © 2016 Wongsaphat Praisri. All rights reserved.
//

#import "requestDetail.h"

@interface requestDetail ()

@end

@implementation requestDetail

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [_ac startAnimating];
    _lbname.text = [_exam objectForKey:@"username"];
    
    PFFile *userImageFile = _exam[@"img"];
    
    [userImageFile getDataInBackgroundWithBlock:^(NSData *imageData, NSError *error) {
        
        if (!error) {
            
            UIImage *image = [UIImage imageWithData:imageData];
            _imgView.image = image;
            _ac.hidden = YES;
        }
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)accButton:(id)sender {

    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"ยืนยัน"
                                                                   message:@"คุณต้องการรับเป็นเพื่อนหรือไม่"
                                                            preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *first = [UIAlertAction actionWithTitle:@"ตกลง" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action){
        
        PFUser *cur = [PFUser currentUser];
        PFQuery *query = [PFQuery queryWithClassName:@"Friends"];
        [query whereKey:@"userfriend" equalTo:cur.username];
        [query whereKey:@"username" equalTo:_lbname.text];
        [query findObjectsInBackgroundWithBlock:^(NSArray *objects,NSError *error) {
            
            if(!error)
            {
                

                for (PFObject *object in objects) {
                    NSLog(@"%@", object.objectId);
                    [query getObjectInBackgroundWithId:object.objectId
                                                 block:^(PFObject *sta, NSError *error) {
                                                     // Now let's update it with some new data. In this case, only cheatMode and score
                                                     // will get sent to the cloud. playerName hasn't changed.
                                                     sta[@"status"] = @"yes";
                                                     [sta saveInBackground];
                                                     
                                                     UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"สำเร็จ"
                                                                                                                    message:@"รับเป็นเพื่อนแล้ว"
                                                                                                             preferredStyle:UIAlertControllerStyleAlert];
                                                     UIAlertAction *secondd = [UIAlertAction actionWithTitle:@"ตกลง" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action){
                                                         
                                                     }];
                                                     
                                                     [alert addAction:secondd];
                                                     [self presentViewController:alert animated:YES completion:nil];
                                                 }];
                }
                
            }
            else
            {
                NSLog(@"Errorrrr = %@",error);
                
            }
        }];
        
    }];
    
    UIAlertAction *second = [UIAlertAction actionWithTitle:@"ยกเลิก" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action){
        
    }];
    
    [alert addAction:first];
    [alert addAction:second];
    [self presentViewController:alert animated:YES completion:nil];
}


@end
