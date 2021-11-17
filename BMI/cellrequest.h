//
//  cellrequest.h
//  BMI
//
//  Created by Wongsaphat Praisri on 1/15/16.
//  Copyright © 2016 Wongsaphat Praisri. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface cellrequest : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *ac;
@property (weak, nonatomic) IBOutlet UILabel *label;
@end
