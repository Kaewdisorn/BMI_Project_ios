//
//  Profile.m
//  BMI
//
//  Created by Wongsaphat Praisri on 12/23/15.
//  Copyright © 2015 Wongsaphat Praisri. All rights reserved.
//

#import "Profile.h"
#import <Parse/Parse.h>
#import "SWRevealViewController.h"

@interface Profile ()

@end

@implementation Profile

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    _sidebarButton.target = self.revealViewController;
    _sidebarButton.action = @selector(revealToggle:);
    [_load startAnimating];
    
    PFUser *cur = [PFUser currentUser];
    
    _userName.text = cur.username;
    //_email.text = cur.email;
    
    PFQuery *query = [PFQuery queryWithClassName:@"_User"];
    [query whereKey:@"username" equalTo:cur.username];
    [query getObjectInBackgroundWithId:cur.objectId block:^(PFObject *weight, NSError *error){
        
        _weight.text = weight[@"weight"];
        _LBcen.text = weight[@"height"];
        _lbBmi.text = weight[@"BMI"];
        _lbgrade.text = weight[@"grade"];
        _lbharmful.text = weight[@"harmful"];
        PFFile *userImageFile = weight[@"img"];
        
        [userImageFile getDataInBackgroundWithBlock:^(NSData *imageData, NSError *error) {
            if (!error) {
                UIImage *image = [UIImage imageWithData:imageData];
                _imgView.image = image;
          
            }
        }];

        [_load stopAnimating];
        _load.hidden = YES;
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



@end
