//
//  DetailFriends.m
//  BMI
//
//  Created by Wongsaphat Praisri on 5/2/16.
//  Copyright © 2016 Wongsaphat Praisri. All rights reserved.
//

#import "DetailFriends.h"

@interface DetailFriends ()

@end

@implementation DetailFriends{
    
    NSString *FriName;
    NSArray *arrBmi;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = [_exam objectForKey:@"userfriend"];
    FriName = [_exam objectForKey:@"userfriend"];
    
    [_load startAnimating];
    
    PFFile *userImageFile = _exam[@"img2"];
    
    [userImageFile getDataInBackgroundWithBlock:^(NSData *imageData, NSError *error) {
        
        if (!error) {
            
            UIImage *image = [UIImage imageWithData:imageData];
            _imgView.image = image;
            _load.hidden = YES;
        }
    }];
    
    PFQuery *query = [PFQuery queryWithClassName:@"_User"];
    [query whereKey:@"username" equalTo:FriName];
    
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {

            for (PFObject *object in objects) {
                
                NSLog(@"%@", object.objectId);
                
                [query getObjectInBackgroundWithId:object.objectId block:^(PFObject *bmi, NSError *error){
                    
                    _bmiLb.text = bmi[@"BMI"];
                    _lbnumPercent.text = bmi[@"percent"];
                    PFFile *userImageFile = bmi[@"picgade"];
                    [userImageFile getDataInBackgroundWithBlock:^(NSData *imageData, NSError *error) {
                        if (!error) {
                            UIImage *image = [UIImage imageWithData:imageData];
                            _imgPercent.image = image;
                            
                        }
                    }];

                }];
                
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



@end
