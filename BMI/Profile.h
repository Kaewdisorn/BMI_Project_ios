//
//  Profile.h
//  BMI
//
//  Created by Wongsaphat Praisri on 12/23/15.
//  Copyright © 2015 Wongsaphat Praisri. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Profile : UIViewController

@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *load;
@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@property (weak, nonatomic) IBOutlet UILabel *userName;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *sidebarButton;
@property (weak, nonatomic) IBOutlet UILabel *weight;
@property (weak, nonatomic) IBOutlet UILabel *email;
@property (weak, nonatomic) IBOutlet UILabel *LBcen;

@property (weak, nonatomic) IBOutlet UILabel *lbgrade;
@property (weak, nonatomic) IBOutlet UILabel *lbharmful;
@property (weak, nonatomic) IBOutlet UILabel *lbBmi;

@end
