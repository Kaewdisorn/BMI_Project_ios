//
//  requestDetail.h
//  BMI
//
//  Created by Wongsaphat Praisri on 1/18/16.
//  Copyright © 2016 Wongsaphat Praisri. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface requestDetail : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *ac;
@property (weak, nonatomic) IBOutlet UILabel *lbname;
@property (nonatomic, strong) PFObject *exam;


- (IBAction)accButton:(id)sender;
@end
