//
//  about.m
//  BMI
//
//  Created by Wongsaphat Praisri on 1/18/16.
//  Copyright © 2016 Wongsaphat Praisri. All rights reserved.
//

#import "about.h"
#import "SWRevealViewController.h"

@interface about ()

@end

@implementation about

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _sidebarButton.target = self.revealViewController;
    _sidebarButton.action = @selector(revealToggle:);
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
