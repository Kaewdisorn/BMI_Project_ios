//
//  detail.m
//  BMI
//
//  Created by Wongsaphat Praisri on 12/23/15.
//  Copyright © 2015 Wongsaphat Praisri. All rights reserved.
//

#import "detail.h"

@interface detail ()

@end

@implementation detail{
    
    NSArray *data;
    NSString *keep;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [_load startAnimating];
    _lbName.text = [_exam objectForKey:@"username"];
    
    PFFile *userImageFile = _exam[@"img"];
    
    [userImageFile getDataInBackgroundWithBlock:^(NSData *imageData, NSError *error) {
        
        if (!error) {
            
            UIImage *image = [UIImage imageWithData:imageData];
            _imgView.image = image;
            _load.hidden = YES;
        }
    }];
    PFUser *cur = [PFUser currentUser];
    NSLog(@"User = %@",cur.username);
    PFQuery *query = [PFQuery queryWithClassName:@"Friends"];
    [query whereKey:@"username" equalTo:cur.username];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            
            NSLog(@"%@",objects);
            for(PFObject *obj in objects){
                
                NSLog(@"หาชื่อเพื่อน %@",obj[@"userfriend"]);

                if([obj[@"userfriend"] isEqualToString:_lbName.text]){
                    
                    NSLog(@"เจอ %@",obj[@"userfriend"]);
                    keep = obj[@"status"];
                    NSLog(@"สถานะคือ %@",keep);
                    if([keep isEqualToString:@"pending"]){
                        
                        _butFri.hidden = YES;
                        _butFried.hidden = YES;
                        _butRe.hidden = NO;
                        break;
                    } else if ([keep isEqualToString:@"yes"]){
                        
                        _butFri.hidden = YES;
                        _butRe.hidden  = YES;
                        _butFried.hidden = NO;
                        break;
                    }
                   
                    
                } else {
                    
                    NSLog(@"ไม่เจอ ");
                    _butFri.hidden = NO;
                    _butFried.hidden = YES;
                    _butRe.hidden  = YES;
                    
                }
            }
            
            if ((_butRe.hidden == NO) ) {
                
                _butFri.hidden = YES;

            } else if ((_butFried.hidden == NO)) {
                
                _butFri.hidden = YES;

            } else {
                _butFri.hidden = NO;
            }
            
        } else {
            // Log details of the failure
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
    }];

    

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)add:(id)sender {
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"เพิ่มเพื่อน"
                                                                   message:@"คุณต้องการเพิ่มเพื่อนหรือไม่"
                                                            preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *first = [UIAlertAction actionWithTitle:@"ตกลง" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action){
        

        PFUser *cur = [PFUser currentUser];
        NSString *Fname = _lbName.text;
        
        PFObject *friend = [PFObject objectWithClassName:@"Friends"];
        [friend setObject:cur.username forKey:@"username"];
        [friend setObject:Fname forKey:@"userfriend"];
        [friend setObject:@"pending" forKey:@"status"];
        
        PFFile *userImageFile = cur[@"img"];
        
        NSData* data2 = UIImageJPEGRepresentation(_imgView.image, 0.5f);
        PFFile *imageFile2 = [PFFile fileWithName:@"Image.jpg" data:data2];
    

        
        
        [userImageFile getDataInBackgroundWithBlock:^(NSData *imageData, NSError *error) {
            
            if (!error) {
                

                PFFile *imageFile = [PFFile fileWithName:@"Image.jpg" data:imageData];
                [friend setObject:imageFile forKey:@"img"];
                [friend setObject:imageFile2 forKey:@"img2"];
                
                [friend saveInBackgroundWithBlock:^(BOOL success,NSError *error){
                 
                 if(success){
                 
                 _butFri.hidden = YES;
                 _butRe.hidden = NO;
                     
                }
                 
                 }];

            }
        }];
        
       // NSData* dataaa = UIImageJPEGRepresentation(_imgView.image, 0.5f);
       // PFFile *imageFile = [PFFile fileWithName:@"Image.jpg" data:dataaa];
        
        
        
     /*   [friend saveInBackgroundWithBlock:^(BOOL success,NSError *error){
        
            if(success){
                                
                _butFri.hidden = YES;
                _butRe.hidden = NO;
            }
        
        }]; */
        
    }];
    
    UIAlertAction *second = [UIAlertAction actionWithTitle:@"ยกเลิก" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action){
        
    }];
    
    [alert addAction:first];
    [alert addAction:second];
    [self presentViewController:alert animated:YES completion:nil];
    
    /* PFQuery *query = [PFQuery queryWithClassName:@"Friends"];
     [query whereKey:@"username" equalTo:[_exam objectForKey:@"username"]];
     
     
     [query getObjectInBackgroundWithId:[_exam objectId] block:^(PFObject *get, NSError *error){
     
     [get setObject:@"pending" forKey:@"friendOrNot"];
     
     [get saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
     
     if (succeeded) {
     
     _butFri.hidden = YES;
     _butRe.hidden = NO;
     
     PFUser *cur = [PFUser currentUser];
     PFObject *friend = [PFObject objectWithClassName:@"myFriend"];
     friend[@"username"] = cur.username;
     friend[@"userfriend"] = [_exam objectForKey:@"username"];
     friend[@"status"] = @"pending";
     [friend saveInBackground];
     
     } else {
     
     
     }
     }];
     }];*/
}
@end
