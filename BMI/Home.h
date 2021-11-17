//
//  Home.h
//  BMI
//
//  Created by Wongsaphat Praisri on 12/20/15.
//  Copyright © 2015 Wongsaphat Praisri. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface Home : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *txtWeight;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *sidebarButton;
@property (weak, nonatomic) IBOutlet UILabel *lbWeight;
- (IBAction)buttonCal:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *txtHeight;
@property (weak, nonatomic) IBOutlet UILabel *lbBmi;
@property (weak, nonatomic) IBOutlet UILabel *lbGrade;
@property (weak, nonatomic) IBOutlet UILabel *lbHarmful;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *load;
- (IBAction)calAgain:(id)sender;
- (IBAction)save:(id)sender;
@end
