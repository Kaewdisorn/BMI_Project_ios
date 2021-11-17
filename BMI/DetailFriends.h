//
//  DetailFriends.h
//  BMI
//
//  Created by Wongsaphat Praisri on 5/2/16.
//  Copyright © 2016 Wongsaphat Praisri. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface DetailFriends : UIViewController

@property (nonatomic, strong) PFObject *exam;
@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *load;
@property (weak, nonatomic) IBOutlet UILabel *bmiLb;

@property (weak, nonatomic) IBOutlet UIImageView *imgPercent;
@property (weak, nonatomic) IBOutlet UILabel *lbnumPercent;


@end
