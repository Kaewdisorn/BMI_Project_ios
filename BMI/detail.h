//
//  detail.h
//  BMI
//
//  Created by Wongsaphat Praisri on 12/23/15.
//  Copyright © 2015 Wongsaphat Praisri. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface detail : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@property (weak, nonatomic) IBOutlet UILabel *lbName;
@property (nonatomic, strong) PFObject *exam;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *load;

- (IBAction)add:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *butFri;
@property (weak, nonatomic) IBOutlet UIButton *butRe;
@property (weak, nonatomic) IBOutlet UIButton *butFried;

@end
