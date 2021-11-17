//
//  target.h
//  BMI
//
//  Created by Wongsaphat Praisri on 4/7/16.
//  Copyright © 2016 Wongsaphat Praisri. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface target : UIViewController

@property (weak, nonatomic) IBOutlet UIBarButtonItem *sidebarButton;
@property (weak, nonatomic) IBOutlet UILabel *weight;
@property (weak, nonatomic) IBOutlet UILabel *resultTarget;
@property (weak, nonatomic) IBOutlet UITextField *txtTarget;
@property (weak, nonatomic) IBOutlet UILabel *lbTarget;


@property (weak, nonatomic) IBOutlet UITextField *txtlossweight;
@property (weak, nonatomic) IBOutlet UIButton *btnSet;
@property (weak, nonatomic) IBOutlet UILabel *curWeightlb;
@property (weak, nonatomic) IBOutlet UIImageView *imgPercent;
@property (weak, nonatomic) IBOutlet UIButton *btnSve;
@property (weak, nonatomic) IBOutlet UILabel *lbpercent;

@end
