//
//  target.m
//  BMI
//
//  Created by Wongsaphat Praisri on 4/7/16.
//  Copyright © 2016 Wongsaphat Praisri. All rights reserved.
//

#import "target.h"
#import "SWRevealViewController.h"
#import <Parse/Parse.h>


@interface target (){
    
    NSString *percentSve;
}

@end

@implementation target

- (void)viewDidLoad {
    [super viewDidLoad];
    _sidebarButton.target = self.revealViewController;
    _sidebarButton.action = @selector(revealToggle:);
    _btnSve.enabled = NO;
    [self loadgade];
    
    PFUser *cur = [PFUser currentUser];
    
    PFQuery *query = [PFQuery queryWithClassName:@"_User"];
    [query whereKey:@"username" equalTo:cur.username];
    
    [query getObjectInBackgroundWithId:cur.objectId block:^(PFObject *weight, NSError *error){
        
        _weight.text = weight[@"weight"];
        _txtTarget.text = weight[@"target"];
        _lbTarget.text = weight[@"target"];
        _resultTarget.text = weight[@"loss"];
        _txtlossweight.text = weight[@"lossed"];
        //_lbpercent.text = weight[@"percent"];
        
        PFFile *userImageFile = weight[@"picgade"];
        [userImageFile getDataInBackgroundWithBlock:^(NSData *imageData, NSError *error) {
            if (!error) {
                UIImage *image = [UIImage imageWithData:imageData];
                _imgPercent.image = image;
                
            }
        }];
       
    }];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)Target:(UIButton *)sender {
    
    NSString *NowWeight = _weight.text;
    int NewW = [NowWeight intValue];
    
    
    NSString *TheTarget = _txtTarget.text;
    int NewT = [TheTarget intValue];
    NSLog(@"Now weight %d",NewW);
    NSLog(@"the target %d",NewT);
    
    if (NewW <= NewT) {
        
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"ผิดพลาด"
                                                                       message:@"น้ำหนักเป้าหมายต้องน้อยกว่าปัจจุบัน"
                                                                preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *first = [UIAlertAction actionWithTitle:@"ตกลง" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action){
            
            _txtTarget.text = @"";
            
        }];
        [alert addAction:first];
        [self presentViewController:alert animated:YES completion:nil];
        
    } else {
        
        NSLog(@"ตั้งเป้าหมายได้");
        int result = NewW - NewT;
        _lbTarget.text = _txtTarget.text;
        NSString *strFromInt = [NSString stringWithFormat:@"%d",result];
        _resultTarget.text = strFromInt;
    }



}
- (IBAction)SetBtn:(id)sender {
    
    NSString *lossW;
    
    lossW = _txtlossweight.text;
    int NewlossW = [lossW intValue];
    
    NSString *tg;
    tg = _resultTarget.text;
    int Newtg = [tg intValue];
    
    if(NewlossW > Newtg){
        
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"ผิดพลาด"
                                                                       message:@"น้ำหนักลดลงเกินกว่าเป้าหมาย"
                                                                preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *first = [UIAlertAction actionWithTitle:@"ตกลง" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action){
            
            _txtlossweight.text = @"";
            _btnSve.enabled = NO;

            
        }];
        [alert addAction:first];
        [self presentViewController:alert animated:YES completion:nil];


        
    } else {
        
        NSString *weight;
        weight = _weight.text;
        int NewWeight = [weight intValue];
        
        int newestWeight;
        newestWeight = NewWeight - NewlossW;
        
        NSString *strFromInt = [NSString stringWithFormat:@"%d",newestWeight];
        _curWeightlb.text = strFromInt;
        
        NSString *keepW = _txtlossweight.text;
        
        int NewKeepW = [keepW intValue];
        
        NSString *res = _resultTarget.text;
        int NewRes = [res intValue];
    
        if(NewRes == 15){
            
            switch (NewKeepW) {
                case 1:
                    _imgPercent.image = [UIImage imageNamed:@"151.jpg"];
                    _lbpercent.text = @"6.6";
                    percentSve = _lbpercent.text;
                    break;
                case 2:
                    _imgPercent.image = [UIImage imageNamed:@"152.jpg"];
                    _lbpercent.text = @"13.2";
                    percentSve = _lbpercent.text;
                    break;
                case 3:
                    _imgPercent.image = [UIImage imageNamed:@"153.jpg"];
                    _lbpercent.text = @"19.8";
                    percentSve = _lbpercent.text;
                    break;
                case 4:
                    _imgPercent.image = [UIImage imageNamed:@"154.jpg"];
                    _lbpercent.text = @"26.4";
                    percentSve = _lbpercent.text;
                    break;
                case 5:
                    _imgPercent.image = [UIImage imageNamed:@"155.jpg"];
                    _lbpercent.text = @"33";
                    percentSve = _lbpercent.text;
                    break;
                case 6:
                    _imgPercent.image = [UIImage imageNamed:@"156.jpg"];
                    _lbpercent.text = @"39.6";

                    break;
                case 7:
                    _imgPercent.image = [UIImage imageNamed:@"157.jpg"];
                    _lbpercent.text = @"46.2";
                    percentSve = _lbpercent.text;
                    break;
                case 8:
                    _imgPercent.image = [UIImage imageNamed:@"158.jpg"];
                    _lbpercent.text = @"52.8";
                    percentSve = _lbpercent.text;
                    break;
                case 9:
                    _imgPercent.image = [UIImage imageNamed:@"159.jpg"];
                    _lbpercent.text = @"59.4";
                    percentSve = _lbpercent.text;
                    break;
                case 10:
                    _imgPercent.image = [UIImage imageNamed:@"1510.jpg"];
                    _lbpercent.text = @"66";
                    percentSve = _lbpercent.text;
                    break;
                case 11:
                    _imgPercent.image = [UIImage imageNamed:@"1511.jpg"];
                    _lbpercent.text = @"72.6";
                    percentSve = _lbpercent.text;
                    break;
                case 12:
                    _imgPercent.image = [UIImage imageNamed:@"1512.jpg"];
                    _lbpercent.text = @"79.2";
                    percentSve = _lbpercent.text;
                    break;
                case 13:
                    _imgPercent.image = [UIImage imageNamed:@"1513.jpg"];
                    _lbpercent.text = @"85.8";
                    percentSve = _lbpercent.text;
                    break;
                case 14:
                    _imgPercent.image = [UIImage imageNamed:@"1514.jpg"];
                    _lbpercent.text = @"92.4";
                    percentSve = _lbpercent.text;
                    break;
                case 15:
                    _imgPercent.image = [UIImage imageNamed:@"1.jpg"];
                    _lbpercent.text = @"100";
                    [self ToZero];
                    break;
                    
                    
                default: 
                    break;
            }
            
            
        } else if (NewRes == 14){
            
            switch (NewKeepW) {
                    
                case 1:
                    _imgPercent.image = [UIImage imageNamed:@"141.jpg"];
                    _lbpercent.text = @"7.14";
                    percentSve = _lbpercent.text;
                    break;
                case 2:
                    _imgPercent.image = [UIImage imageNamed:@"142.jpg"];
                    _lbpercent.text = @"14.28";
                    percentSve = _lbpercent.text;
                    break;
                case 3:
                    _imgPercent.image = [UIImage imageNamed:@"143.jpg"];
                    _lbpercent.text = @"21.42";
                    percentSve = _lbpercent.text;
                    break;
                case 4:
                    _imgPercent.image = [UIImage imageNamed:@"144.jpg"];
                    _lbpercent.text = @"28.56";
                    percentSve = _lbpercent.text;
                    break;
                case 5:
                    _imgPercent.image = [UIImage imageNamed:@"145.jpg"];
                    _lbpercent.text = @"35.7";
                    percentSve = _lbpercent.text;
                    break;
                case 6:
                    _imgPercent.image = [UIImage imageNamed:@"146.jpg"];
                    _lbpercent.text = @"42.84";
                    percentSve = _lbpercent.text;
                    break;
                case 7:
                    _imgPercent.image = [UIImage imageNamed:@"147.jpg"];
                    _lbpercent.text = @"49.18";
                    percentSve = _lbpercent.text;
                    break;
                case 8:
                    _imgPercent.image = [UIImage imageNamed:@"148.jpg"];
                    _lbpercent.text = @"57.12";
                    percentSve = _lbpercent.text;
                    break;
                case 9:
                    _imgPercent.image = [UIImage imageNamed:@"149.jpg"];
                    _lbpercent.text = @"64.26";
                    percentSve = _lbpercent.text;
                    break;
                case 10:
                    _imgPercent.image = [UIImage imageNamed:@"1410.jpg"];
                    _lbpercent.text = @"71.4";
                    percentSve = _lbpercent.text;
                    break;
                case 11:
                    _imgPercent.image = [UIImage imageNamed:@"1411.jpg"];
                    _lbpercent.text = @"78.54";
                    percentSve = _lbpercent.text;
                    break;
                case 12:
                    _imgPercent.image = [UIImage imageNamed:@"1412.jpg"];
                    _lbpercent.text = @"85.68";
                    percentSve = _lbpercent.text;
                    break;
                case 13:
                    _imgPercent.image = [UIImage imageNamed:@"1413.jpg"];
                    _lbpercent.text = @"92.82";
                    percentSve = _lbpercent.text;
                    break;
                case 14:
                    _imgPercent.image = [UIImage imageNamed:@"1.jpg"];
                    _lbpercent.text = @"100";
                    [self ToZero];
                    break;
                    
                default:
                    break;
            }
        
        } else if (NewRes == 13){
            
            switch (NewKeepW) {
                    
                case 1:
                    _imgPercent.image = [UIImage imageNamed:@"131.jpg"];
                    _lbpercent.text = @"7.69";
                    percentSve = _lbpercent.text;
                    break;
                case 2:
                    _imgPercent.image = [UIImage imageNamed:@"132.jpg"];
                    _lbpercent.text = @"15.38";
                    percentSve = _lbpercent.text;
                    break;
                case 3:
                    _imgPercent.image = [UIImage imageNamed:@"133.jpg"];
                    _lbpercent.text = @"23.07";
                    percentSve = _lbpercent.text;
                    break;
                case 4:
                    _imgPercent.image = [UIImage imageNamed:@"134.jpg"];
                    _lbpercent.text = @"30.76";
                    percentSve = _lbpercent.text;
                    break;
                case 5:
                    _imgPercent.image = [UIImage imageNamed:@"135.jpg"];
                    _lbpercent.text = @"38.45";
                    percentSve = _lbpercent.text;
                    break;
                case 6:
                    _imgPercent.image = [UIImage imageNamed:@"136.jpg"];
                    _lbpercent.text = @"46.14";
                    percentSve = _lbpercent.text;
                    break;
                case 7:
                    _imgPercent.image = [UIImage imageNamed:@"137.jpg"];
                    _lbpercent.text = @"53.83";
                    percentSve = _lbpercent.text;
                    break;
                case 8:
                    _imgPercent.image = [UIImage imageNamed:@"138.jpg"];
                    _lbpercent.text = @"61.52";
                    percentSve = _lbpercent.text;
                    break;
                case 9:
                    _imgPercent.image = [UIImage imageNamed:@"139.jpg"];
                    _lbpercent.text = @"69.21";
                    percentSve = _lbpercent.text;
                    break;
                case 10:
                    _imgPercent.image = [UIImage imageNamed:@"1310.jpg"];
                    _lbpercent.text = @"76.9";
                    percentSve = _lbpercent.text;
                    break;
                case 11:
                    _imgPercent.image = [UIImage imageNamed:@"1311.jpg"];
                    _lbpercent.text = @"84.59";
                    percentSve = _lbpercent.text;
                    break;
                case 12:
                    _imgPercent.image = [UIImage imageNamed:@"1312.jpg"];
                    _lbpercent.text = @"92.28";
                    percentSve = _lbpercent.text;
                    break;
                case 13:
                    _imgPercent.image = [UIImage imageNamed:@"1.jpg"];
                    _lbpercent.text = @"100";
                    [self ToZero];
                    break;
                    
                default:
                    break;
            }
            
            
        } else if (NewRes == 12){
            
            switch (NewKeepW) {
                    
                case 1:
                    _imgPercent.image = [UIImage imageNamed:@"121.jpg"];
                    _lbpercent.text = @"8.33";
                    percentSve = _lbpercent.text;
                    break;
                case 2:
                    _imgPercent.image = [UIImage imageNamed:@"122.jpg"];
                    _lbpercent.text = @"16.66";
                    percentSve = _lbpercent.text;
                    break;
                case 3:
                    _imgPercent.image = [UIImage imageNamed:@"123.jpg"];
                    _lbpercent.text = @"24.99";
                    percentSve = _lbpercent.text;
                    break;
                case 4:
                    _imgPercent.image = [UIImage imageNamed:@"124.jpg"];
                    _lbpercent.text = @"33.32";
                    percentSve = _lbpercent.text;
                    break;
                case 5:
                    _imgPercent.image = [UIImage imageNamed:@"125.jpg"];
                    _lbpercent.text = @"41.65";
                    percentSve = _lbpercent.text;
                    break;
                case 6:
                    _imgPercent.image = [UIImage imageNamed:@"126.jpg"];
                    _lbpercent.text = @"49.98";
                    percentSve = _lbpercent.text;
                    break;
                case 7:
                    _imgPercent.image = [UIImage imageNamed:@"127.jpg"];
                    _lbpercent.text = @"58.31";
                    percentSve = _lbpercent.text;
                    break;
                case 8:
                    _imgPercent.image = [UIImage imageNamed:@"128.jpg"];
                    _lbpercent.text = @"66.64";
                    percentSve = _lbpercent.text;
                    break;
                case 9:
                    _imgPercent.image = [UIImage imageNamed:@"129.jpg"];
                    _lbpercent.text = @"74.97";
                    percentSve = _lbpercent.text;
                    break;
                case 10:
                    _imgPercent.image = [UIImage imageNamed:@"1210.jpg"];
                    _lbpercent.text = @"83.3";
                    percentSve = _lbpercent.text;
                    break;
                case 11:
                    _imgPercent.image = [UIImage imageNamed:@"1211.jpg"];
                    _lbpercent.text = @"91.63";
                    percentSve = _lbpercent.text;
                    break;
                case 12:
                    _imgPercent.image = [UIImage imageNamed:@"1.jpg"];
                    _lbpercent.text = @"100";
                    [self ToZero];
                    break;
                    
                default:
                    break;
            }
            
            
        } else if (NewRes == 11){
            
            switch (NewKeepW) {
                    
                case 1:
                    _imgPercent.image = [UIImage imageNamed:@"111.jpg"];
                    _lbpercent.text = @"9";
                    percentSve = _lbpercent.text;
                    break;
                case 2:
                    _imgPercent.image = [UIImage imageNamed:@"112.jpg"];
                    _lbpercent.text = @"18";
                    percentSve = _lbpercent.text;
                    break;
                case 3:
                    _imgPercent.image = [UIImage imageNamed:@"113.jpg"];
                    _lbpercent.text = @"27";
                    percentSve = _lbpercent.text;
                    break;
                case 4:
                    _imgPercent.image = [UIImage imageNamed:@"114.jpg"];
                    _lbpercent.text = @"36";
                    percentSve = _lbpercent.text;
                    break;
                case 5:
                    _imgPercent.image = [UIImage imageNamed:@"115.jpg"];
                    _lbpercent.text = @"45";
                    percentSve = _lbpercent.text;
                    break;
                case 6:
                    _imgPercent.image = [UIImage imageNamed:@"116.jpg"];
                    _lbpercent.text = @"54";
                    percentSve = _lbpercent.text;
                    break;
                case 7:
                    _imgPercent.image = [UIImage imageNamed:@"117.jpg"];
                    _lbpercent.text = @"63";
                    percentSve = _lbpercent.text;
                    break;
                case 8:
                    _imgPercent.image = [UIImage imageNamed:@"118.jpg"];
                    _lbpercent.text = @"72";
                    percentSve = _lbpercent.text;
                    break;
                case 9:
                    _imgPercent.image = [UIImage imageNamed:@"119.jpg"];
                    _lbpercent.text = @"81";
                    percentSve = _lbpercent.text;
                    break;
                case 10:
                    _imgPercent.image = [UIImage imageNamed:@"1110.jpg"];
                    _lbpercent.text = @"90";

                    break;
                case 11:
                    _imgPercent.image = [UIImage imageNamed:@"1.jpg"];
                    _lbpercent.text = @"100";
                    [self ToZero];
                    break;
                    
                default:
                    break;
            }
        
        
        } else if (NewRes == 10){
            
            switch (NewKeepW) {
                    
                case 1:
                    _imgPercent.image = [UIImage imageNamed:@"101.jpg"];
                    _lbpercent.text = @"10";
                    percentSve = _lbpercent.text;
                    break;
                case 2:
                    _imgPercent.image = [UIImage imageNamed:@"102.jpg"];
                    _lbpercent.text = @"20";
                    percentSve = _lbpercent.text;
                    break;
                case 3:
                    _imgPercent.image = [UIImage imageNamed:@"103.jpg"];
                    _lbpercent.text = @"30";
                    percentSve = _lbpercent.text;
                    break;
                case 4:
                    _imgPercent.image = [UIImage imageNamed:@"104.jpg"];
                    _lbpercent.text = @"40";
                    percentSve = _lbpercent.text;
                    break;
                case 5:
                    _imgPercent.image = [UIImage imageNamed:@"105.jpg"];
                    _lbpercent.text = @"50";
                    percentSve = _lbpercent.text;
                    break;
                case 6:
                    _imgPercent.image = [UIImage imageNamed:@"106.jpg"];
                    _lbpercent.text = @"60";
                    percentSve = _lbpercent.text;
                    break;
                case 7:
                    _imgPercent.image = [UIImage imageNamed:@"107.jpg"];
                    _lbpercent.text = @"70";
                    percentSve = _lbpercent.text;
                    break;
                case 8:
                    _imgPercent.image = [UIImage imageNamed:@"108.jpg"];
                    _lbpercent.text = @"80";
                    percentSve = _lbpercent.text;
                    break;
                case 9:
                    _imgPercent.image = [UIImage imageNamed:@"109.jpg"];
                    _lbpercent.text = @"90";
                    percentSve = _lbpercent.text;
                    break;
                case 10:
                    _imgPercent.image = [UIImage imageNamed:@"1.jpg"];
                    _lbpercent.text = @"100";
                    [self ToZero];
                    break;
                    
                default:
                    break;
            }
        
        } else if (NewRes == 9){
            
            switch (NewKeepW) {
                    
                case 1:
                    _imgPercent.image = [UIImage imageNamed:@"91.jpg"];
                    _lbpercent.text = @"11.1";
                    percentSve = _lbpercent.text;
                    break;
                case 2:
                    _imgPercent.image = [UIImage imageNamed:@"92.jpg"];
                    _lbpercent.text = @"22.2";
                    percentSve = _lbpercent.text;
                    break;
                case 3:
                    _imgPercent.image = [UIImage imageNamed:@"93.jpg"];
                    _lbpercent.text = @"33.3";
                    percentSve = _lbpercent.text;
                    break;
                case 4:
                    _imgPercent.image = [UIImage imageNamed:@"94.jpg"];
                    _lbpercent.text = @"44.4";
                    percentSve = _lbpercent.text;
                    break;
                case 5:
                    _imgPercent.image = [UIImage imageNamed:@"95.jpg"];
                    _lbpercent.text = @"55.5";
                    percentSve = _lbpercent.text;
                    break;
                case 6:
                    _imgPercent.image = [UIImage imageNamed:@"96.jpg"];
                    _lbpercent.text = @"66.6";
                    percentSve = _lbpercent.text;
                    break;
                case 7:
                    _imgPercent.image = [UIImage imageNamed:@"97.jpg"];
                    _lbpercent.text = @"77.7";
                    percentSve = _lbpercent.text;
                    break;
                case 8:
                    _imgPercent.image = [UIImage imageNamed:@"98.jpg"];
                    _lbpercent.text = @"88.8";
                    percentSve = _lbpercent.text;
                    break;
                case 9:
                    _imgPercent.image = [UIImage imageNamed:@"1.jpg"];
                    _lbpercent.text = @"100";
                    [self ToZero];
                    break;
                    
                default:
                    break;
            }
            
        } else if (NewRes == 8){
            
            switch (NewKeepW) {
                    
                case 1:
                    _imgPercent.image = [UIImage imageNamed:@"81.jpg"];
                    _lbpercent.text = @"12.5";
                    percentSve = _lbpercent.text;
                    break;
                case 2:
                    _imgPercent.image = [UIImage imageNamed:@"82.jpg"];
                    _lbpercent.text = @"25";
                    percentSve = _lbpercent.text;
                    break;
                case 3:
                    _imgPercent.image = [UIImage imageNamed:@"83.jpg"];
                    _lbpercent.text = @"37.5";
                    percentSve = _lbpercent.text;
                    break;
                case 4:
                    _imgPercent.image = [UIImage imageNamed:@"84.jpg"];
                    _lbpercent.text = @"50";
                    percentSve = _lbpercent.text;
                    break;
                case 5:
                    _imgPercent.image = [UIImage imageNamed:@"85.jpg"];
                    _lbpercent.text = @"62.5";
                    percentSve = _lbpercent.text;
                    break;
                case 6:
                    _imgPercent.image = [UIImage imageNamed:@"86.jpg"];
                    _lbpercent.text = @"75";
                    percentSve = _lbpercent.text;
                    break;
                case 7:
                    _imgPercent.image = [UIImage imageNamed:@"87.jpg"];
                    _lbpercent.text = @"87.5";
                    percentSve = _lbpercent.text;
                    break;
                case 8:
                    _imgPercent.image = [UIImage imageNamed:@"1.jpg"];
                    _lbpercent.text = @"100";
                    [self ToZero];
                    break;
                    
                default:
                    break;
            }
            
        } else if (NewRes == 7){
            
            switch (NewKeepW) {
                    
                case 1:
                    _imgPercent.image = [UIImage imageNamed:@"71.jpg"];
                    _lbpercent.text = @"14.28";
                    percentSve = _lbpercent.text;
                    break;
                case 2:
                    _imgPercent.image = [UIImage imageNamed:@"72.jpg"];
                    _lbpercent.text = @"28.56";
                    percentSve = _lbpercent.text;
                    break;
                case 3:
                    _imgPercent.image = [UIImage imageNamed:@"73.jpg"];
                    _lbpercent.text = @"42.84";
                    percentSve = _lbpercent.text;
                    break;
                case 4:
                    _imgPercent.image = [UIImage imageNamed:@"74.jpg"];
                    _lbpercent.text = @"57.12";
                    percentSve = _lbpercent.text;
                    break;
                case 5:
                    _imgPercent.image = [UIImage imageNamed:@"75.jpg"];
                    _lbpercent.text = @"71.4";
                    percentSve = _lbpercent.text;
                    break;
                case 6:
                    _imgPercent.image = [UIImage imageNamed:@"76.jpg"];
                    _lbpercent.text = @"85.68";
                    percentSve = _lbpercent.text;
                    break;
                case 7:
                    _imgPercent.image = [UIImage imageNamed:@"1.jpg"];
                    _lbpercent.text = @"100";
                    [self ToZero];
                    break;
                    
                default:
                    break;
            }
            
            
        } else if (NewRes == 6){
            
            switch (NewKeepW) {
                    
                case 1:
                    _imgPercent.image = [UIImage imageNamed:@"61.jpg"];
                    _lbpercent.text = @"16.66";
                    percentSve = _lbpercent.text;
                    break;
                case 2:
                    _imgPercent.image = [UIImage imageNamed:@"62.jpg"];
                    _lbpercent.text = @"33.32";
                    percentSve = _lbpercent.text;
                    break;
                case 3:
                    _imgPercent.image = [UIImage imageNamed:@"63.jpg"];
                    _lbpercent.text = @"49.98";
                    percentSve = _lbpercent.text;
                    break;
                case 4:
                    _imgPercent.image = [UIImage imageNamed:@"64.jpg"];
                    _lbpercent.text = @"66.64";
                    percentSve = _lbpercent.text;
                    break;
                case 5:
                    _imgPercent.image = [UIImage imageNamed:@"65.jpg"];
                    _lbpercent.text = @"83.3";
                    percentSve = _lbpercent.text;
                    break;
                case 6:
                    _imgPercent.image = [UIImage imageNamed:@"1.jpg"];
                    _lbpercent.text = @"100";
                    [self ToZero];
                    break;
                    
                default:
                    break;
            }
            
        } else if (NewRes == 5){
            
            switch (NewKeepW) {
                    
                case 1:
                    _imgPercent.image = [UIImage imageNamed:@"51.jpg"];
                    _lbpercent.text = @"20";
                    percentSve = _lbpercent.text;
                    break;
                case 2:
                    _imgPercent.image = [UIImage imageNamed:@"52.jpg"];
                    _lbpercent.text = @"40";
                    percentSve = _lbpercent.text;
                    break;
                case 3:
                    _imgPercent.image = [UIImage imageNamed:@"53.jpg"];
                    _lbpercent.text = @"60";
                    percentSve = _lbpercent.text;
                    break;
                case 4:
                    _imgPercent.image = [UIImage imageNamed:@"54.jpg"];
                    _lbpercent.text = @"80";
                    percentSve = _lbpercent.text;
                    break;
                case 5:
                    _imgPercent.image = [UIImage imageNamed:@"1.jpg"];
                    _lbpercent.text = @"100";
                    [self ToZero];
                    break;
                    
                default:
                    break;
            }
            
        } else if (NewRes == 4){
            
            switch (NewKeepW) {
                    
                case 1:
                    _imgPercent.image = [UIImage imageNamed:@"41.jpg"];
                    _lbpercent.text = @"25";
                    percentSve = _lbpercent.text;
                    break;
                case 2:
                    _imgPercent.image = [UIImage imageNamed:@"42.jpg"];
                    _lbpercent.text = @"50";
                    percentSve = _lbpercent.text;
                    break;
                case 3:
                    _imgPercent.image = [UIImage imageNamed:@"43.jpg"];
                    _lbpercent.text = @"75";
                    percentSve = _lbpercent.text;
                    break;
                case 4:
                    _imgPercent.image = [UIImage imageNamed:@"1.jpg"];
                    _lbpercent.text = @"100";
                    [self ToZero];
                    break;
                    
                default:
                    break;
            }
            
        } else if (NewRes == 3){
            
            switch (NewKeepW) {
                    
                case 1:
                    _imgPercent.image = [UIImage imageNamed:@"31.jpg"];
                    _lbpercent.text = @"33.33";
                    percentSve = _lbpercent.text;
                    break;
                case 2:
                    _imgPercent.image = [UIImage imageNamed:@"32.jpg"];
                    _lbpercent.text = @"66.66";
                    percentSve = _lbpercent.text;
                    break;
                case 3:
                    _imgPercent.image = [UIImage imageNamed:@"1.jpg"];
                    _lbpercent.text = @"100";
                    [self ToZero];
                    break;
                    
                default:
                    break;
            }
            
            
        } else if (NewRes == 2){
            
            switch (NewKeepW) {
                    
                case 1:
                    _imgPercent.image = [UIImage imageNamed:@"21.jpg"];
                    _lbpercent.text = @"50";
                    percentSve = _lbpercent.text;
                    break;
                case 2:
                    _imgPercent.image = [UIImage imageNamed:@"1.jpg"];
                    _lbpercent.text = @"100";
                    [self ToZero];
                    break;
                    
                default:
                    break;
            }
            
        } else if (NewRes == 1){
            
            switch (NewKeepW) {
                    
                case 1:
                    _imgPercent.image = [UIImage imageNamed:@"1.jpg"];
                    _lbpercent.text = @"100";
                    [self ToZero];
                    break;
                    
                default:
                    break;
            }
            
        }
        
    } // end else
    _btnSve.enabled = YES;
} // end setPervent Button
- (IBAction)saveAction:(id)sender {
    
    [self save];
}

- (void) save {
    
    NSLog(@"in save Function");
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"แจ้งเตือน"
                                                                   message:@"คุณต้องการบันทึกข้อมูลใช่หรือไม่"
                                                            preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *first = [UIAlertAction actionWithTitle:@"ตกลง" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action){
        
      
         PFQuery *query = [PFQuery queryWithClassName:@"_User"];
        PFUser *cur = [PFUser currentUser];
        NSData* data = UIImageJPEGRepresentation(_imgPercent.image, 0.5f);
        PFFile *imageFile = [PFFile fileWithName:@"gade.jpg" data:data];
        [query whereKey:@"username" equalTo:cur.username];
        
        [query getObjectInBackgroundWithId:cur.objectId
                                     block:^(PFObject *sve, NSError *error) {
                                         // Now let's update it with some new data. In this case, only cheatMode and score
                                         // will get sent to the cloud. playerName hasn't changed.
                                         sve[@"target"] = _lbTarget.text;
                                         sve[@"loss"] = _resultTarget.text;
                                         sve[@"percent"] = percentSve;
                                         sve[@"lossed"] = _txtlossweight.text;
                                         sve[@"weight"] = _curWeightlb.text;
                                         [sve setObject:imageFile forKey:@"picgade"];
                                         [sve saveInBackground];
                                         NSLog(@"Finished");
                                     }];

        
        [self viewDidLoad];
    }];
    [alert addAction:first];
    [self presentViewController:alert animated:YES completion:nil];
}

-(void) ToZero{
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"สำเร็จ"
                                                                   message:@"คุณสำเร็จเป้าหมายแล้ว"
                                                            preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *first = [UIAlertAction actionWithTitle:@"ตกลง" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action){
        
        _imgPercent.image = [UIImage imageNamed:@"0.jpg"];
        _lbpercent.text = @"0";
        
        PFQuery *query = [PFQuery queryWithClassName:@"_User"];
        PFUser *cur = [PFUser currentUser];
        
        NSData* data = UIImageJPEGRepresentation(_imgPercent.image, 0.5f);
        PFFile *imageFile = [PFFile fileWithName:@"gade.jpg" data:data];

        [query whereKey:@"username" equalTo:cur.username];
        
        [query getObjectInBackgroundWithId:cur.objectId
                                     block:^(PFObject *sve, NSError *error) {
                                         
                                         // Now let's update it with some new data. In this case, only cheatMode and score
                                         // will get sent to the cloud. playerName hasn't changed.
                                         sve[@"target"] = @"0" ;
                                         sve[@"loss"] = @"0";
                                         sve[@"weight"] = _curWeightlb.text;
                                         sve[@"lossed"] = @"0";
                                         sve[@"percent"] = @"0";
                                         [sve setObject:imageFile forKey:@"picgade"];
                                         [sve saveInBackground];
                                         
                                         NSLog(@"Finished");
                                         [self viewDidLoad];
                                         
                                     }];

    }];
    [alert addAction:first];
    [self presentViewController:alert animated:YES completion:nil];
    
}

- (void) loadgade{
    

    PFUser *cur = [PFUser currentUser];
    
    PFQuery *query = [PFQuery queryWithClassName:@"_User"];
    [query whereKey:@"username" equalTo:cur.username];
    
    [query getObjectInBackgroundWithId:cur.objectId block:^(PFObject *weight, NSError *error){
        
        _lbpercent.text = weight[@"percent"];
        
    }];
    
}

- (void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    [self.view endEditing:YES];
    
}
@end
